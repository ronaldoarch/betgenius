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

trait CartwavehubTrait
{
    protected static string $uriCartwavehub;
    protected static string $apiSecretCartwavehub;
    protected static string $apiPublicCartwavehub;

    private static function logCartwavehubDebug(string $action, array $data = []): void
    {
        try {
            $line = now()->format('Y-m-d H:i:s') . " [$action] " . json_encode($data, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES) . PHP_EOL;
            file_put_contents(storage_path('logs/cartwavehub.log'), $line, FILE_APPEND);
        } catch (\Throwable $e) {
            // Evitar loops de log; em último caso ignora a escrita de debug.
        }
    }

    private static function generateCredentialsCartwavehub()
    {
        $setting = Gateway::first();
        if (!empty($setting)) {
            self::$uriCartwavehub = $setting->getAttributes()['cartwavehub_uri'] ?? 'https://api.cartwavehub.com.br';
            self::$apiSecretCartwavehub = $setting->getAttributes()['cartwavehub_api_secret'] ?? '';
            self::$apiPublicCartwavehub = $setting->getAttributes()['cartwavehub_api_public'] ?? '';
        }
    }

    /**
     * Criar Transação PIX IN (Depósito)
     * POST https://api.cartwavehub.com.br/v1/cob
     */
    public function requestQrcodeCartwavehub($request)
    {
        try {
            $setting = Core::getSetting();
            $rules = [
                'amount' => ['required', 'numeric', 'min:' . $setting->min_deposit, 'max:' . $setting->max_deposit],
            ];

            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return response()->json($validator->errors(), 400);
            }

            self::generateCredentialsCartwavehub();
            
            $idUnico = uniqid();
            $user = auth('api')->user();

            $payloadPixIn = [
                'postbackUrl' => url('/cartwavehub/callback', [], true),
                'amount' => (int) ($request->input("amount") * 100), // Valor em centavos
            ];

            // Campos opcionais
            if ($request->has('externalCode')) {
                $payloadPixIn['externalCode'] = $request->input('externalCode');
            } else {
                $payloadPixIn['externalCode'] = $idUnico;
            }

            if ($request->has('ip')) {
                $payloadPixIn['ip'] = $request->input('ip');
            }

            if ($request->has('metadata')) {
                $payloadPixIn['metadata'] = $request->input('metadata');
            } else {
                // Metadata padrão
                $payloadPixIn['metadata'] = [
                    'user_email' => $user->email,
                    'user_id' => $user->id,
                ];
            }

            // Subseller (opcional)
            if ($request->has('subseller')) {
                $payloadPixIn['subseller'] = $request->input('subseller');
            }

            self::logCartwavehubDebug('PIX_IN_REQUEST', [
                'headers' => ['x-authorization-key' => self::$apiSecretCartwavehub],
                'body' => $payloadPixIn,
            ]);

            $headers = [
                'x-authorization-key' => self::$apiSecretCartwavehub,
                'Accept' => 'application/json',
                'Content-Type' => 'application/json'
            ];

            // Se tiver chave pública, adiciona no header
            if (!empty(self::$apiPublicCartwavehub)) {
                $headers['x-store-key'] = self::$apiPublicCartwavehub;
            }

            $response = Http::withOptions([
                'verify' => true,
                'curl' => [
                    CURLOPT_IPRESOLVE => CURL_IPRESOLVE_V4,
                ]
            ])->withHeaders($headers)
              ->timeout(30)
              ->post(self::$uriCartwavehub . '/v1/cob', $payloadPixIn);

            self::logCartwavehubDebug('PIX_IN_RESPONSE', [
                'status' => $response->status(),
                'body' => $response->body(),
            ]);

            if ($response->successful()) {
                $responseData = $response->json();
                
                // Resposta esperada: id, status, amount, pix.encodedImage, pix.payload
                if (isset($responseData['id']) && isset($responseData['pix'])) {
                    self::logCartwavehubDebug('PIX_IN_SUCCESS', $responseData);
                    self::generateTransactionCartwavehub($responseData['id'], $request->input("amount"), $idUnico);
                    self::generateDepositCartwavehub($responseData['id'], $request->input("amount"));
                    
                    return response()->json([
                        'status' => true,
                        'idTransaction' => $responseData['id'],
                        'qrcode' => $responseData['pix']['encodedImage'] ?? '',
                        'pix_code' => $responseData['pix']['payload'] ?? ''
                    ]);
                }
            }

            Log::error('Cartwavehub Request Error', [
                'status' => $response->status(),
                'body' => $response->body()
            ]);
            self::logCartwavehubDebug('PIX_IN_ERROR', [
                'status' => $response->status(),
                'body' => $response->body()
            ]);

            $errorMessage = "Ocorreu uma falha ao entrar em contato com o gateway.";
            if ($response->status() === 401) {
                $errorMessage = "Credenciais inválidas. Verifique suas chaves de API.";
            } elseif ($response->status() === 400) {
                $errorData = $response->json();
                $errorMessage = $errorData['message'] ?? $errorMessage;
            }

            return response()->json(['error' => $errorMessage], $response->status() ?: 500);
        } catch (Exception $e) {
            Log::error('Cartwavehub Exception', ['message' => $e->getMessage()]);
            self::logCartwavehubDebug('PIX_IN_EXCEPTION', ['message' => $e->getMessage()]);
            return response()->json(['error' => 'Erro interno'], 500);
        }
    }

    /**
     * Criar Saque PIX OUT
     * POST https://api.cartwavehub.com.br/v1/request/withdraw
     */
    private static function pixCashOutCartwavehub($id, $tipo)
    {
        $withdrawal = Withdrawal::find($id);
        if ($tipo == "afiliado") {
            $withdrawal = AffiliateWithdraw::find($id);
        }

        self::generateCredentialsCartwavehub();

        if ($withdrawal != null) {
            $keyType = null;
            $pixKey = null;

            // Mapear tipos de chave PIX
            switch ($withdrawal->pix_type) {
                case 'document':
                case 'cpf':
                case 'cnpj':
                    $pixKeySemPontuacao = preg_replace('/[^0-9]/', '', $withdrawal->pix_key);
                    $keyType = strlen($pixKeySemPontuacao) == 11 ? "CPF" : "CNPJ";
                    $pixKey = $pixKeySemPontuacao;
                    break;
                case 'phoneNumber':
                case 'phone':
                    $keyType = "phone";
                    $pixKey = preg_replace('/[^0-9]/', '', $withdrawal->pix_key);
                    break;
                case 'email':
                    $keyType = "email";
                    $pixKey = $withdrawal->pix_key;
                    break;
                case 'randomKey':
                case 'random':
                    $keyType = "random";
                    $pixKey = $withdrawal->pix_key;
                    break;
                default:
                    $keyType = "CPF";
                    $pixKey = preg_replace('/[^0-9]/', '', $withdrawal->pix_key);
            }

            $payloadPixOut = [
                'amount' => (int) ($withdrawal->amount * 100), // Valor em centavos
                'pixKey' => $pixKey,
                'pixKeyType' => $keyType,
                'baasPostbackUrl' => url('/cartwavehub/callback-withdrawal', [], true),
            ];

            // External code opcional
            if (!empty($withdrawal->payment_id)) {
                $payloadPixOut['externalCode'] = $withdrawal->payment_id;
            }

            self::logCartwavehubDebug('PIX_OUT_REQUEST', [
                'headers' => ['x-authorization-key' => self::$apiSecretCartwavehub],
                'body' => $payloadPixOut,
            ]);

            $headers = [
                'x-authorization-key' => self::$apiSecretCartwavehub,
                'Accept' => 'application/json',
                'Content-Type' => 'application/json'
            ];

            $response = Http::withOptions([
                'verify' => true,
            ])->withHeaders($headers)
              ->timeout(30)
              ->post(self::$uriCartwavehub . '/v1/request/withdraw', $payloadPixOut);

            self::logCartwavehubDebug('PIX_OUT_RESPONSE', [
                'status' => $response->status(),
                'body' => $response->body(),
            ]);

            if ($response->successful()) {
                $responseData = $response->json();
                
                // Resposta esperada: id, amount, taxes, pixKey, pixKeyType, withdrawStatusId
                if (isset($responseData['id'])) {
                    self::logCartwavehubDebug('PIX_OUT_SUCCESS', $responseData);
                    $withdrawal->update([
                        'status' => 1,
                        'payment_id' => $responseData['id']
                    ]);
                    return true;
                }
            }

            Log::error('Cartwavehub Withdrawal Error', [
                'status' => $response->status(),
                'body' => $response->body()
            ]);
            self::logCartwavehubDebug('PIX_OUT_ERROR', [
                'status' => $response->status(),
                'body' => $response->body()
            ]);

            return false;
        }

        self::logCartwavehubDebug('PIX_OUT_WITHDRAWAL_NOT_FOUND', ['withdrawal_id' => $id, 'tipo' => $tipo]);
        return false;
    }

    /**
     * Consultar Saldo
     * GET https://api.cartwavehub.com.br/v1/request/withdraw/balance
     */
    public static function getBalanceCartwavehub()
    {
        try {
            self::generateCredentialsCartwavehub();

            $headers = [
                'x-authorization-key' => self::$apiSecretCartwavehub,
                'Accept' => 'application/json',
            ];

            $response = Http::withOptions([
                'verify' => true,
            ])->withHeaders($headers)
              ->timeout(30)
              ->get(self::$uriCartwavehub . '/v1/request/withdraw/balance');

            if ($response->successful()) {
                return $response->json();
            }

            return null;
        } catch (Exception $e) {
            Log::error('Cartwavehub Balance Error', ['message' => $e->getMessage()]);
            return null;
        }
    }

    /**
     * Listar Transações
     * GET https://api.cartwavehub.com.br/v1/transactions
     */
    public static function listTransactionsCartwavehub($page = 1, $pageSize = 15)
    {
        try {
            self::generateCredentialsCartwavehub();

            $headers = [
                'x-authorization-key' => self::$apiSecretCartwavehub,
                'Accept' => 'application/json',
            ];

            $response = Http::withOptions([
                'verify' => true,
            ])->withHeaders($headers)
              ->timeout(30)
              ->get(self::$uriCartwavehub . '/v1/transactions', [
                  'page' => $page,
                  'pageSize' => $pageSize,
              ]);

            if ($response->successful()) {
                return $response->json();
            }

            return null;
        } catch (Exception $e) {
            Log::error('Cartwavehub List Transactions Error', ['message' => $e->getMessage()]);
            return null;
        }
    }

    /**
     * Webhook - Depósito Confirmado (PIX IN)
     */
    private static function webhookCartwavehub(Request $request)
    {
        try {
            // Webhook POST esperado conforme documentação:
            // code, externalCode, orderId, storeId, paymentMethod?, status, endToEnd?, amount?, paidAt?, createdAt?, updatedAt?, receiptUrl?, payer?

            $status = $request->input('status');
            $code = $request->input('code');
            $externalCode = $request->input('externalCode');
            $orderId = $request->input('orderId');

            self::logCartwavehubDebug('WEBHOOK_PIX_IN', $request->all());

            // Status possíveis: paid, refused, refunded, infraction
            if ($status == 'paid') {
                // Buscar transação pelo code ou orderId
                $transaction = Transaction::where('payment_id', $code)
                    ->orWhere('payment_id', $orderId)
                    ->orWhere('idUnico', $externalCode)
                    ->where('status', 0)
                    ->first();

                if ($transaction != null) {
                    $payment = self::finalizePaymentCartwavehub($transaction);
                    if ($payment == true) {
                        return response()->json(['message' => 'Pagamento processado'], 200);
                    }
                }
            }

            return response()->json(['message' => 'Transação não encontrada ou já processada'], 404);
        } catch (Exception $e) {
            Log::error('Cartwavehub Webhook Error', ['message' => $e->getMessage()]);
            self::logCartwavehubDebug('WEBHOOK_PIX_IN_ERROR', ['message' => $e->getMessage()]);
            return response()->json(['error' => 'Erro ao processar webhook'], 500);
        }
    }

    /**
     * Webhook - Saque Confirmado (PIX OUT)
     */
    private static function webhookWithdrawalCartwavehub(Request $request)
    {
        try {
            // Webhook POST esperado conforme documentação:
            // id, amount, taxes, pixKey, pixKeyType, withdrawStatusId, createdAt, updatedAt, paidAt?, observation, externalCode?, endToEndId?, receiver?

            $withdrawStatusId = $request->input('withdrawStatusId');
            $id = $request->input('id');
            $externalCode = $request->input('externalCode');

            self::logCartwavehubDebug('WEBHOOK_PIX_OUT', $request->all());

            // Status possíveis: Successfull, Failure, Canceled, Reversed
            $withdrawal = Withdrawal::where('payment_id', $id)
                ->orWhere('payment_id', $externalCode)
                ->first();

            if ($withdrawal != null) {
                if ($withdrawStatusId == 'Successfull') {
                    $withdrawal->update(['status' => 1]);
                    return response()->json(['message' => 'Saque confirmado'], 200);
                } elseif ($withdrawStatusId == 'Failure' || $withdrawStatusId == 'Canceled') {
                    // Reembolsar o usuário
                    $wallet = Wallet::where('user_id', $withdrawal->user_id)->first();
                    if ($wallet) {
                        $wallet->increment('balance', $withdrawal->amount);
                    }
                    $withdrawal->update(['status' => 2]); // Status 2 = cancelado
                    return response()->json(['message' => 'Saque cancelado e reembolsado'], 200);
                } elseif ($withdrawStatusId == 'Reversed') {
                    // Estorno
                    $wallet = Wallet::where('user_id', $withdrawal->user_id)->first();
                    if ($wallet) {
                        $wallet->increment('balance', $withdrawal->amount);
                    }
                    $withdrawal->update(['status' => 2]);
                    return response()->json(['message' => 'Saque revertido e reembolsado'], 200);
                }
            }

            return response()->json(['message' => 'Transação não encontrada'], 404);
        } catch (Exception $e) {
            Log::error('Cartwavehub Withdrawal Webhook Error', ['message' => $e->getMessage()]);
            self::logCartwavehubDebug('WEBHOOK_PIX_OUT_ERROR', ['message' => $e->getMessage()]);
            return response()->json(['error' => 'Erro ao processar webhook'], 500);
        }
    }

    private static function finalizePaymentCartwavehub($transaction)
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

    private static function generateDepositCartwavehub($idTransaction, $amount)
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

    private static function generateTransactionCartwavehub($idTransaction, $amount, $id)
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

