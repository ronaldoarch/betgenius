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

trait CashtimeTrait
{
    protected static string $uriCashtime;
    protected static string $clienteIdCashtime;
    protected static string $clienteSecretCashtime;
    protected static ?string $accessToken = null;
    protected static ?int $tokenExpiresAt = null;

    private static function logCashtimeDebug(string $action, array $data = []): void
    {
        try {
            $line = now()->format('Y-m-d H:i:s') . " [$action] " . json_encode($data, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES) . PHP_EOL;
            file_put_contents(storage_path('logs/cashtime.log'), $line, FILE_APPEND);
        } catch (\Throwable $e) {
            // Evitar loops de log
        }
    }

    private static function generateCredentialsCashtime()
    {
        $setting = Gateway::first();
        if (!empty($setting)) {
            self::$uriCashtime = $setting->getAttributes()['cashtime_uri'] ?? 'https://transaction.cartwavehub.com.br';
            self::$clienteIdCashtime = $setting->getAttributes()['cashtime_client_id'] ?? '';
            self::$clienteSecretCashtime = $setting->getAttributes()['cashtime_client_secret'] ?? '';
        }
    }

    /**
     * Obter Token JWT de Acesso
     * POST https://transaction.cartwavehub.com.br/auth/token
     */
    private static function getTokenCashtime(): array
    {
        try {
            // Verificar se o token ainda é válido (com margem de 60 segundos)
            if (self::$accessToken !== null && self::$tokenExpiresAt !== null && time() < (self::$tokenExpiresAt - 60)) {
                return ['error' => '', 'accessToken' => self::$accessToken];
            }

            self::generateCredentialsCashtime();

            self::logCashtimeDebug('TOKEN_REQUEST', [
                'uri' => self::$uriCashtime . '/auth/token',
                'client_id' => self::$clienteIdCashtime,
            ]);

            $response = Http::asForm()->post(self::$uriCashtime . '/auth/token', [
                'client_id' => self::$clienteIdCashtime,
                'client_secret' => self::$clienteSecretCashtime,
                'grant_type' => 'client_credentials'
            ]);

            self::logCashtimeDebug('TOKEN_RESPONSE', [
                'status' => $response->status(),
                'body' => $response->body(),
            ]);

            if ($response->successful()) {
                $responseData = $response->json();
                if (isset($responseData['access_token'])) {
                    self::$accessToken = $responseData['access_token'];
                    // expires_in_sec está em segundos, calcular timestamp de expiração
                    $expiresInSec = $responseData['expires_in_sec'] ?? 300; // padrão 5 minutos
                    self::$tokenExpiresAt = time() + $expiresInSec;
                    
                    return ['error' => '', 'accessToken' => self::$accessToken];
                } else {
                    return ['error' => 'Token não retornado', 'accessToken' => ''];
                }
            } else {
                return ['error' => 'Erro ao obter token: ' . $response->status(), 'accessToken' => ''];
            }
        } catch (Exception $e) {
            self::logCashtimeDebug('TOKEN_EXCEPTION', ['message' => $e->getMessage()]);
            return ['error' => 'Erro interno: ' . $e->getMessage(), 'accessToken' => ''];
        }
    }

    /**
     * Criar Transação PIX (Depósito)
     * POST https://transaction.cartwavehub.com.br/transaction
     */
    public function requestQrcodeCashtime($request)
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

            self::generateCredentialsCashtime();
            $token = self::getTokenCashtime();
            if ($token['error'] != "") {
                return response()->json(['error' => 'Ocorreu uma falha ao obter autenticação: ' . $token['error']], 500);
            }

            $idUnico = uniqid();
            $user = auth('api')->user();

            $payloadPixIn = [
                'amount' => (float) $request->input("amount"),
                'payment_method' => 'PIX',
                'customer' => [
                    'name' => $user->name,
                    'document' => \Helper::soNumero($request->cpf),
                    'email' => $user->email,
                ],
                'callback_url' => url('/cashtime/callback', [], true),
                'external_id' => $idUnico,
            ];

            self::logCashtimeDebug('PIX_IN_REQUEST', [
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
                'Authorization' => 'Bearer ' . $token['accessToken'],
                'Accept' => 'application/json',
                'Content-Type' => 'application/json'
            ])->timeout(30)->post(self::$uriCashtime . '/transaction', $payloadPixIn);

            self::logCashtimeDebug('PIX_IN_RESPONSE', [
                'status' => $response->status(),
                'body' => $response->body(),
            ]);

            if ($response->successful()) {
                $responseData = $response->json();
                
                // Ajustar conforme a resposta real da API Cashtime
                if (isset($responseData['id']) || isset($responseData['transaction_id'])) {
                    $transactionId = $responseData['id'] ?? $responseData['transaction_id'];
                    self::logCashtimeDebug('PIX_IN_SUCCESS', $responseData);
                    self::generateTransactionCashtime($transactionId, $request->input("amount"), $idUnico);
                    self::generateDepositCashtime($transactionId, $request->input("amount"));
                    
                    return response()->json([
                        'status' => true,
                        'idTransaction' => $transactionId,
                        'qrcode' => $responseData['qr_code'] ?? $responseData['qrcode'] ?? '',
                        'pix_code' => $responseData['pix_copia_cola'] ?? $responseData['pix_code'] ?? $responseData['qr_code'] ?? ''
                    ]);
                }
            }

            Log::error('Cashtime Request Error', [
                'status' => $response->status(),
                'body' => $response->body()
            ]);
            self::logCashtimeDebug('PIX_IN_ERROR', [
                'status' => $response->status(),
                'body' => $response->body()
            ]);

            return response()->json(['error' => "Ocorreu uma falha ao entrar em contato com o gateway."], 500);
        } catch (Exception $e) {
            Log::error('Cashtime Exception', ['message' => $e->getMessage()]);
            self::logCashtimeDebug('PIX_IN_EXCEPTION', ['message' => $e->getMessage()]);
            return response()->json(['error' => 'Erro interno'], 500);
        }
    }

    /**
     * Criar Saque PIX
     * POST https://transaction.cartwavehub.com.br/transaction (com type: withdrawal)
     */
    private static function pixCashOutCashtime($id, $tipo)
    {
        $withdrawal = Withdrawal::find($id);
        if ($tipo == "afiliado") {
            $withdrawal = AffiliateWithdraw::find($id);
        }

        self::generateCredentialsCashtime();
        $token = self::getTokenCashtime();
        if ($token['error'] != "") {
            self::logCashtimeDebug('PIX_OUT_TOKEN_ERROR', ['error' => $token['error']]);
            return false;
        }

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
                'payment_method' => 'PIX',
                'type' => 'withdrawal',
                'customer' => [
                    'name' => $withdrawal->name,
                    'document' => preg_replace('/[^0-9]/', '', $withdrawal->cpf),
                ],
                'pix_key' => $pixKey,
                'pix_key_type' => $keyType,
                'callback_url' => url('/cashtime/callback-withdrawal', [], true),
                'external_id' => $idUnico,
            ];

            self::logCashtimeDebug('PIX_OUT_REQUEST', [
                'body' => array_merge($payloadPixOut, ['pix_key' => '***']),
            ]);

            $response = Http::withOptions([
                'verify' => false,
            ])->withHeaders([
                'Authorization' => 'Bearer ' . $token['accessToken'],
                'Accept' => 'application/json',
                'Content-Type' => 'application/json'
            ])->timeout(30)->post(self::$uriCashtime . '/transaction', $payloadPixOut);

            self::logCashtimeDebug('PIX_OUT_RESPONSE', [
                'status' => $response->status(),
                'body' => $response->body(),
            ]);

            if ($response->successful()) {
                $responseData = $response->json();
                
                if (isset($responseData['id']) || isset($responseData['transaction_id'])) {
                    $transactionId = $responseData['id'] ?? $responseData['transaction_id'];
                    self::logCashtimeDebug('PIX_OUT_SUCCESS', $responseData);
                    $withdrawal->update([
                        'status' => 1,
                        'payment_id' => $transactionId
                    ]);
                    return true;
                }
            }

            Log::error('Cashtime Withdrawal Error', [
                'status' => $response->status(),
                'body' => $response->body()
            ]);
            self::logCashtimeDebug('PIX_OUT_ERROR', [
                'status' => $response->status(),
                'body' => $response->body()
            ]);

            return false;
        }

        self::logCashtimeDebug('PIX_OUT_WITHDRAWAL_NOT_FOUND', ['withdrawal_id' => $id, 'tipo' => $tipo]);
        return false;
    }

    /**
     * Webhook - Depósito Confirmado
     */
    private static function webhookCashtime(Request $request)
    {
        try {
            // Ajustar conforme a estrutura real do webhook da Cashtime
            $transactionId = $request->input('id') ?? $request->input('transaction_id');
            $status = $request->input('status');
            $type = $request->input('type');

            self::logCashtimeDebug('WEBHOOK_DEPOSIT', $request->all());

            if ($status == 'paid' || $status == 'completed' || $status == 'success') {
                $transaction = Transaction::where('payment_id', $transactionId)
                    ->where('status', 0)
                    ->first();

                if ($transaction != null) {
                    $payment = self::finalizePaymentCashtime($transaction);
                    if ($payment == true) {
                        return response()->json(['message' => 'Pagamento processado'], 200);
                    }
                }
            }

            return response()->json(['message' => 'Transação não encontrada ou já processada'], 404);
        } catch (Exception $e) {
            Log::error('Cashtime Webhook Error', ['message' => $e->getMessage()]);
            self::logCashtimeDebug('WEBHOOK_DEPOSIT_EXCEPTION', ['message' => $e->getMessage()]);
            return response()->json(['error' => 'Erro ao processar webhook'], 500);
        }
    }

    /**
     * Webhook - Saque Confirmado
     */
    private static function webhookWithdrawalCashtime(Request $request)
    {
        try {
            $transactionId = $request->input('id') ?? $request->input('transaction_id');
            $status = $request->input('status');
            $type = $request->input('type');

            self::logCashtimeDebug('WEBHOOK_WITHDRAWAL', $request->all());

            if ($type == 'withdrawal' || $type == 'payout') {
                $withdrawal = Withdrawal::where('payment_id', $transactionId)->first();

                if ($withdrawal != null) {
                    if ($status == 'paid' || $status == 'completed' || $status == 'success') {
                        $withdrawal->update(['status' => 1]);
                        return response()->json(['message' => 'Saque confirmado'], 200);
                    } elseif ($status == 'cancelled' || $status == 'failed' || $status == 'rejected') {
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
            Log::error('Cashtime Withdrawal Webhook Error', ['message' => $e->getMessage()]);
            self::logCashtimeDebug('WEBHOOK_WITHDRAWAL_EXCEPTION', ['message' => $e->getMessage()]);
            return response()->json(['error' => 'Erro ao processar webhook'], 500);
        }
    }

    private static function finalizePaymentCashtime($transaction)
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

    private static function generateDepositCashtime($idTransaction, $amount)
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

    private static function generateTransactionCashtime($idTransaction, $amount, $id)
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

