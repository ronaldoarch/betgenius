<?php

namespace App\Traits\Gateways;

use App\Helpers\Core;
use App\Models\AffiliateHistory;
use App\Models\AffiliateWithdraw;
use App\Models\Deposit;
use App\Models\Gateway;
use App\Models\Setting;
use App\Models\Transaction;
use App\Models\User;
use App\Models\Wallet;
use App\Models\Withdrawal;
use App\Notifications\NewDepositNotification;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use App\Helpers\Core as Helper;

trait AgilizepayTrait
{
    protected static string $uriAgilizepay;
    protected static string $clienteIdAgilizepay;
    protected static string $clienteSecretAgilizepay;

    private static function logAgilizepayDebug(string $action, array $data = []): void
    {
        try {
            $line = now()->format('Y-m-d H:i:s') . " [$action] " . json_encode($data, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES) . PHP_EOL;
            file_put_contents(storage_path('logs/agilizepay.log'), $line, FILE_APPEND);
        } catch (\Throwable $e) {
            // Evitar loops de log; em último caso ignora a escrita de debug.
        }
    }

    private static function generateCredentialsAgilizepay()
    {
        $setting = Gateway::first();
        if (!empty($setting)) {
            self::$uriAgilizepay = $setting->getAttributes()['agilizepay_uri'];
            self::$clienteIdAgilizepay = $setting->getAttributes()['agilizepay_client_id'];
            self::$clienteSecretAgilizepay = $setting->getAttributes()['agilizepay_client_secret'];
        }
    }

    /**
     * Criar Transação PIX (Depósito)
     * POST https://api.agilizepay.com/pix
     */
    public function requestQrcodeAgilizepay($request)
    {
        try {
            $setting = Core::getSetting();
            $rules = [
                'amount' => ['required', 'numeric', 'min:' . $setting->min_deposit, 'max:' . $setting->max_deposit],
                'cpf'    => ['required', 'string', 'max:255'],
            ];

            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return response()->json($validator->errors(), 400);
            }

            self::generateCredentialsAgilizepay();
            
            $idUnico = uniqid();
            $user = auth('api')->user();

            $payloadPixIn = [
                'code' => $idUnico,
                'amount' => (float) $request->input("amount"),
                'email' => $user->email,
                'document' => \Helper::soNumero($request->cpf),
                'url' => url('/agilizepay/callback', [], true),
            ];

            self::logAgilizepayDebug('PIX_IN_REQUEST', [
                'headers' => ['client_id' => self::$clienteIdAgilizepay],
                'body' => $payloadPixIn,
            ]);

            $response = Http::withOptions([
                'verify' => false,
                'curl' => [
                    CURLOPT_IPRESOLVE => CURL_IPRESOLVE_V4,
                    CURLOPT_SSL_VERIFYPEER => false,
                    CURLOPT_SSL_VERIFYHOST => 0,
                ]
            ])->withHeaders([
                'client_id' => self::$clienteIdAgilizepay,
                'Accept' => 'application/json',
                'Content-Type' => 'application/json'
            ])->timeout(30)->post(self::$uriAgilizepay . '/pix', $payloadPixIn);

            self::logAgilizepayDebug('PIX_IN_RESPONSE', [
                'status' => $response->status(),
                'body' => $response->body(),
            ]);

            if ($response->successful()) {
                $responseData = $response->json();
                
                // Resposta esperada: location, correlationId, txid, status, chave, pixCopiaECola, qrCode
                if (isset($responseData['txid'])) {
                    self::logAgilizepayDebug('PIX_IN_SUCCESS', $responseData);
                    self::generateTransactionAgilizepay($responseData['txid'], $request->input("amount"), $idUnico);
                    self::generateDepositAgilizepay($responseData['txid'], $request->input("amount"));
                    
                    return response()->json([
                        'status' => true,
                        'idTransaction' => $responseData['txid'],
                        'qrcode' => $responseData['qrCode'] ?? '',
                        'pix_code' => $responseData['pixCopiaECola'] ?? ''
                    ]);
                }
            }

            Log::error('AgilizePay Request Error', [
                'status' => $response->status(),
                'body' => $response->body()
            ]);
            self::logAgilizepayDebug('PIX_IN_ERROR', [
                'status' => $response->status(),
                'body' => $response->body()
            ]);

            return response()->json(['error' => "Ocorreu uma falha ao entrar em contato com o gateway."], 500);
        } catch (Exception $e) {
            Log::error('AgilizePay Exception', ['message' => $e->getMessage()]);
            self::logAgilizepayDebug('PIX_IN_EXCEPTION', ['message' => $e->getMessage()]);
            return response()->json(['error' => 'Erro interno'], 500);
        }
    }

    /**
     * Criar Saque PIX
     * POST https://api.agilizepay.com/pix/payment
     */
    private static function pixCashOutAgilizepay($id, $tipo)
    {
        $withdrawal = Withdrawal::find($id);
        if ($tipo == "afiliado") {
            $withdrawal = AffiliateWithdraw::find($id);
        }

        self::generateCredentialsAgilizepay();

        if ($withdrawal != null) {
            $idUnico = uniqid();
            $keyType = null;
            $pixKey = null;

            switch ($withdrawal->pix_type) {
                case 'document':
                    $pixKeySemPontuacao = preg_replace('/[^0-9]/', '', $withdrawal->pix_key);
                    $keyType = strlen($pixKeySemPontuacao) == 11 ? "CPF" : "CNPJ";
                    $pixKey = $pixKeySemPontuacao;
                    break;
                case 'phoneNumber':
                    $keyType = "PHONE";
                    $pixKey = "+55" . preg_replace('/[^0-9]/', '', $withdrawal->pix_key);
                    break;
                case 'email':
                    $keyType = "EMAIL";
                    $pixKey = $withdrawal->pix_key;
                    break;
                case 'randomKey':
                    $keyType = "EVP";
                    $pixKey = $withdrawal->pix_key;
                    break;
            }

            $payloadPixOut = [
                'amount' => (float) $withdrawal->amount,
                'code' => $idUnico,
                'name' => $withdrawal->name,
                'key_type' => $keyType,
                'document' => preg_replace('/[^0-9]/', '', $withdrawal->cpf),
                'key_pix' => $pixKey,
                'PostBackUrl' => url('/agilizepay/callback-withdrawal', [], true),
                'client_id' => self::$clienteIdAgilizepay,
                'client_secret' => self::$clienteSecretAgilizepay,
            ];

            self::logAgilizepayDebug('PIX_OUT_REQUEST', [
                'headers' => [
                    'client_id' => self::$clienteIdAgilizepay,
                    'client_secret' => '***',
                ],
                'body' => array_merge($payloadPixOut, [
                    'client_id' => self::$clienteIdAgilizepay,
                    'client_secret' => '***',
                ]),
            ]);

            $response = Http::withOptions([
                'verify' => false,
            ])->withHeaders([
                'client_id' => self::$clienteIdAgilizepay,
                'client_secret' => self::$clienteSecretAgilizepay,
                'Accept' => 'application/json',
                'Content-Type' => 'application/json'
            ])->timeout(30)->post(self::$uriAgilizepay . '/pix/payment', $payloadPixOut);

            self::logAgilizepayDebug('PIX_OUT_RESPONSE', [
                'status' => $response->status(),
                'body' => $response->body(),
            ]);

            if ($response->successful()) {
                $responseData = $response->json();
                
                // Resposta esperada: txid, status (EM PROCESSAMENTO)
                if (isset($responseData['txid'])) {
                    self::logAgilizepayDebug('PIX_OUT_SUCCESS', $responseData);
                    $withdrawal->update([
                        'status' => 1,
                        'payment_id' => $responseData['txid']
                    ]);
                    return true;
                }
            }

            Log::error('AgilizePay Withdrawal Error', [
                'status' => $response->status(),
                'body' => $response->body()
            ]);
            self::logAgilizepayDebug('PIX_OUT_ERROR', [
                'status' => $response->status(),
                'body' => $response->body()
            ]);

            return false;
        }

        self::logAgilizepayDebug('PIX_OUT_WITHDRAWAL_NOT_FOUND', ['withdrawal_id' => $id, 'tipo' => $tipo]);
        return false;
    }

    /**
     * Webhook - Depósito Confirmado
     */
    private static function webhookAgilizepay(Request $request)
    {
        try {
            // Webhook POST esperado:
            // typeTransaction = PAID_IN
            // statusTransaction = sucesso
            // idTransaction = string
            // e2d = string
            // paid_by = string
            // paid_doc = string

            $typeTransaction = $request->input('typeTransaction');
            $statusTransaction = $request->input('statusTransaction');
            $idTransaction = $request->input('idTransaction');

            if ($typeTransaction == 'PAID_IN' && $statusTransaction == 'sucesso') {
                $transaction = Transaction::where('payment_id', $idTransaction)
                    ->where('status', 0)
                    ->first();

                if ($transaction != null) {
                    $payment = self::finalizePaymentAgilizepay($transaction);
                    if ($payment == true) {
                        return response()->json(['message' => 'Pagamento processado'], 200);
                    }
                }
            }

            return response()->json(['message' => 'Transação não encontrada ou já processada'], 404);
        } catch (Exception $e) {
            Log::error('AgilizePay Webhook Error', ['message' => $e->getMessage()]);
            return response()->json(['error' => 'Erro ao processar webhook'], 500);
        }
    }

    /**
     * Webhook - Saque Confirmado
     */
    private static function webhookWithdrawalAgilizepay(Request $request)
    {
        try {
            // Webhook POST esperado:
            // typeTransaction = PAID_OUT
            // statusTransaction = sucesso / cancelado
            // idTransaction = string
            // e2e = string

            $typeTransaction = $request->input('typeTransaction');
            $statusTransaction = $request->input('statusTransaction');
            $idTransaction = $request->input('idTransaction');

            if ($typeTransaction == 'PAID_OUT') {
                $withdrawal = Withdrawal::where('payment_id', $idTransaction)->first();

                if ($withdrawal != null) {
                    if ($statusTransaction == 'sucesso') {
                        $withdrawal->update(['status' => 1]);
                        return response()->json(['message' => 'Saque confirmado'], 200);
                    } elseif ($statusTransaction == 'cancelado') {
                        // Reembolsar o usuário
                        $wallet = Wallet::where('user_id', $withdrawal->user_id)->first();
                        if ($wallet) {
                            $wallet->increment('balance', $withdrawal->amount);
                        }
                        $withdrawal->update(['status' => 2]); // Status 2 = cancelado
                        return response()->json(['message' => 'Saque cancelado e reembolsado'], 200);
                    }
                }
            }

            return response()->json(['message' => 'Transação não encontrada'], 404);
        } catch (Exception $e) {
            Log::error('AgilizePay Withdrawal Webhook Error', ['message' => $e->getMessage()]);
            return response()->json(['error' => 'Erro ao processar webhook'], 500);
        }
    }

    private static function finalizePaymentAgilizepay($transaction)
    {
        $setting = Core::getSetting();
        $user = User::find($transaction->user_id);
        $wallet = Wallet::where('user_id', $transaction->user_id)->first();

        if (!empty($wallet)) {
            // Verificar se é o primeiro depósito
            $checkTransactions = Transaction::where('user_id', $transaction->user_id)
                ->where('status', 1)
                ->count();

            if ($checkTransactions == 0 || empty($checkTransactions)) {
                // Pagar o bônus de primeiro depósito
                $bonus = Core::porcentagem_xn($setting->initial_bonus, $transaction->price);
                $wallet->increment('balance_bonus', $bonus);
                $wallet->update(['balance_bonus_rollover' => $bonus * $setting->rollover]);
            }

            // Rollover de depósito
            $wallet->update(['balance_deposit_rollover' => $transaction->price * intval($setting->rollover_deposit)]);

            if ($wallet->increment('balance', $transaction->price)) {
                if ($transaction->update(['status' => 1])) {
                    $deposit = Deposit::where('payment_id', $transaction->payment_id)->where('status', 0)->first();
                    
                    if (!empty($deposit)) {
                        // Processar comissão de afiliado (CPA)
                        $affHistoryCPA = AffiliateHistory::where('user_id', $user->id)
                            ->where('commission_type', 'cpa')
                            ->where('status', 0)
                            ->first();

                        if (!empty($affHistoryCPA)) {
                            $sponsorCpa = User::find($user->inviter);
                            if (!empty($sponsorCpa)) {
                                if ($affHistoryCPA->deposited_amount >= $sponsorCpa->affiliate_baseline || $deposit->amount >= $sponsorCpa->affiliate_baseline) {
                                    $walletCpa = Wallet::where('user_id', $affHistoryCPA->inviter)->first();
                                    if (!empty($walletCpa)) {
                                        $walletCpa->increment('refer_rewards', $sponsorCpa->affiliate_cpa);
                                        $affHistoryCPA->update([
                                            'status' => 1,
                                            'deposited' => $transaction->price,
                                            'commission_paid' => $sponsorCpa->affiliate_cpa
                                        ]);
                                    }
                                } else {
                                    $affHistoryCPA->update(['deposited_amount' => $transaction->price]);
                                }
                            }
                        }

                        if ($deposit->update(['status' => 1])) {
                            // Notificar admins
                            $admins = User::where('role_id', 0)->get();
                            foreach ($admins as $admin) {
                                $admin->notify(new NewDepositNotification($user->name, $transaction->price));
                            }
                            return true;
                        }
                    }
                    return true;
                }
            }
        }

        return false;
    }

    private static function generateDepositAgilizepay($idTransaction, $amount)
    {
        $userId = auth('api')->user()->id;
        $wallet = Wallet::where('user_id', $userId)->first();

        Deposit::create([
            'payment_id' => $idTransaction,
            'user_id'   => $userId,
            'amount'    => $amount,
            'type'      => 'pix',
            'currency'  => $wallet->currency,
            'symbol'    => $wallet->symbol,
            'status'    => 0
        ]);
    }

    private static function generateTransactionAgilizepay($idTransaction, $amount, $id)
    {
        $setting = Core::getSetting();

        Transaction::create([
            'payment_id' => $idTransaction,
            'user_id' => auth('api')->user()->id,
            'payment_method' => 'pix',
            'price' => $amount,
            'currency' => $setting->currency_code,
            'status' => 0,
            "idUnico" => $id
        ]);
    }
}

