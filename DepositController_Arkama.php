<?php

namespace App\Http\Controllers\Api\Wallet;

use App\Helpers\CartwavehubHelper;
use App\Http\Controllers\Controller;
use App\Models\AffiliateHistory;
use App\Models\Gateway;
use App\Models\Deposit;
use App\Models\Transaction;
use App\Models\Wallet;
use App\Traits\Gateways\AgilizepayTrait;
use App\Traits\Gateways\ArkamaTrait;
use App\Traits\Gateways\BsPayTrait;
use App\Traits\Gateways\CashtimeTrait;
use App\Traits\Gateways\DigitoPayTrait;
use App\Traits\Gateways\EzzepayTrait;
use App\Traits\Gateways\SuitpayTrait;
use App\Traits\Gateways\CartwavehubTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Exception;

class DepositController extends Controller
{
    use SuitpayTrait, DigitoPayTrait, EzzepayTrait, BsPayTrait, AgilizepayTrait, CashtimeTrait, CartwavehubTrait, ArkamaTrait;

    public function __construct()
    {
        // Log para verificar se a classe está sendo carregada
        Log::info('[DepositController] Classe instanciada');
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse|null
     */
    public function submitPayment(Request $request)
    {
        try {
            // Log para debug
            Log::info('[DepositController] submitPayment chamado', [
                'gateway_request' => $request->gateway ?? 'não especificado',
                'amount' => $request->amount ?? 'não especificado',
                'user_id' => auth('api')->id() ?? 'não autenticado',
                'all_request' => $request->all(),
            ]);

            // Auto-detectar gateway ativo se não especificado
            if (!$request->has('gateway') || empty($request->gateway)) {
                $gw = Gateway::first();
                
                if (!$gw) {
                    Log::error('[DepositController] Gateway não encontrado no banco');
                    return response()->json(['error' => 'Gateway não configurado'], 500);
                }
                
                Log::info('[DepositController] Auto-detectando gateway', [
                    'arkama_ativo' => $gw->arkama_ativo ?? 0,
                    'agilizepay_ativo' => $gw->agilizepay_ativo ?? 0,
                    'cartwavehub_ativo' => $gw->cartwavehub_ativo ?? 0,
                ]);
                
                // Prioridade: Arkama > AgilizePay > Cartwavehub > outros
                if ($gw && $gw->arkama_ativo == 1) {
                    $request->merge(['gateway' => 'arkama']);
                    Log::info('[DepositController] Gateway detectado: arkama');
                } elseif ($gw && $gw->agilizepay_ativo == 1) {
                    $request->merge(['gateway' => 'agilizepay']);
                    Log::info('[DepositController] Gateway detectado: agilizepay');
                } elseif ($gw && $gw->cartwavehub_ativo == 1) {
                    $request->merge(['gateway' => 'cartwavehub']);
                    Log::info('[DepositController] Gateway detectado: cartwavehub');
                }
            }

            Log::info('[DepositController] Gateway final', ['gateway' => $request->gateway]);

            if (empty($request->gateway)) {
                Log::error('[DepositController] Nenhum gateway ativo encontrado');
                return response()->json(['error' => 'Nenhum gateway configurado'], 500);
            }

            switch ($request->gateway) {
                case 'suitpay':
                    return self::requestQrcode($request);
                case 'ezzepay':
                    return self::requestQrcodeEzze($request);
                case 'digitopay':
                    return self::requestQrcodeDigito($request);
                case 'bspay':
                    return self::requestQrcodeBsPay($request);
                case 'agilizepay':
                    return self::requestQrcodeAgilizepay($request);
                case 'cashtime':
                    return self::requestQrcodeCashtime($request);
                case 'cartwavehub':
                    return self::requestQrcodeCartwavehub($request);
                case 'arkama':
                    Log::info('[DepositController] Chamando requestQrcodeArkama');
                    return self::requestQrcodeArkama($request);
                default:
                    Log::error('[DepositController] Gateway não encontrado', ['gateway' => $request->gateway]);
                    return response()->json(['error' => 'Nenhum gateway configurado'], 500);
            }
        } catch (\Exception $e) {
            Log::error('[DepositController] Exception em submitPayment', [
                'message' => $e->getMessage(),
                'file' => $e->getFile(),
                'line' => $e->getLine(),
                'trace' => $e->getTraceAsString()
            ]);
            
            return response()->json([
                'error' => 'Erro ao processar pagamento: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public static function requestQrcodeCartwavehub(Request $request)
    {
        $user = Auth::user();

        if (!$user) {
            return response()->json(['error' => 'Usuário não autenticado'], 401);
        }

        $rules = [
            'amount' => 'required|numeric|min:5|max:10000',
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        $amount = $request->amount;

        try {
            $gateway = Gateway::first();
            if (!$gateway || $gateway->cartwavehub_ativo != 1) {
                throw new Exception('Gateway Cartwavehub não está ativo.');
            }

            if (!$gateway->cartwavehub_uri || !$gateway->cartwavehub_api_secret) {
                throw new Exception('Gateway Cartwavehub não configurado corretamente.');
            }

            $cartwavehubTransaction = CartwavehubHelper::createPixTransaction(
                $user->id,
                $amount,
                'Depósito PIX'
            );

            $deposit = new Deposit();
            $deposit->user_id = $user->id;
            $deposit->amount = $amount;
            $deposit->type = 'pix';
            $deposit->status = 0;
            $deposit->payment_id = $cartwavehubTransaction['id'];
            $deposit->external_id = $cartwavehubTransaction['id'];
            $deposit->qrcode_url = $cartwavehubTransaction['pix']['qrCode'] ?? null;
            $deposit->pix_key = $cartwavehubTransaction['pix']['pixKey'] ?? null;
            $deposit->save();

            Log::info('[Cartwavehub] Depósito criado', [
                'user_id' => $user->id,
                'deposit_id' => $deposit->id,
                'amount' => $amount,
                'payment_id' => $deposit->payment_id
            ]);

            return response()->json([
                'status' => true,
                'idTransaction' => $deposit->id,
                'qrcode' => $cartwavehubTransaction['pix']['qrCode'],
                'pix_key' => $cartwavehubTransaction['pix']['pixKey'],
                'expires_at' => $cartwavehubTransaction['pix']['expiresAt'] ?? null,
            ]);

        } catch (Exception $e) {
            Log::error('[Cartwavehub] Erro ao criar depósito', [
                'user_id' => $user->id,
                'amount' => $amount,
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);

            return response()->json([
                'error' => $e->getMessage()
            ], $e->getCode() ?: 500);
        }
    }

    /**
     * Show the form for creating a new resource.
     */
    public function consultStatusTransactionPix(Request $request)
    {
        return self::consultStatusTransaction($request);
    }

    /**
     * @param $request
     * @return \Illuminate\Http\JsonResponse
     */
    public static function consultStatusTransaction($request)
    {
        self::generateCredentials();
    
        $transaction = Transaction::where('payment_id', $request->input("idTransaction"))->first();
        
        if ($transaction != null && $transaction->status) {
            return response()->json(['status' => 'PAID']);
        } elseif ($transaction != null) {
            // Transação encontrada, mas ainda não paga
            return response()->json(['status' => 'PENDING']);
        } else {
            // Transação não encontrada
            return response()->json(['status' => 'NOT_FOUND'], 404);
        }
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function getDeposit(Request $request)
    {
        $user = Auth::user();
        $validator = Validator::make($request->all(), [
            'id' => 'required|integer',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        $deposit = Deposit::where('id', $request->id)
            ->where('user_id', $user->id)
            ->first();

        if (!$deposit) {
            return response()->json(['error' => 'Depósito não encontrado'], 404);
        }

        return response()->json([
            'status' => true,
            'deposit' => $deposit,
        ]);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function cancelDeposit(Request $request)
    {
        $user = Auth::user();
        $validator = Validator::make($request->all(), [
            'id' => 'required|integer',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        $deposit = Deposit::where('id', $request->id)
            ->where('user_id', $user->id)
            ->where('status', 0)
            ->first();

        if (!$deposit) {
            return response()->json(['error' => 'Depósito não encontrado ou já processado'], 404);
        }

        $deposit->status = 2;
        $deposit->save();

        return response()->json([
            'status' => true,
            'message' => 'Depósito cancelado com sucesso',
        ]);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function listDeposits(Request $request)
    {
        $user = Auth::user();

        $deposits = Deposit::where('user_id', $user->id)
            ->orderBy('created_at', 'desc')
            ->limit(50)
            ->get();

        return response()->json([
            'status' => true,
            'deposits' => $deposits,
        ]);
    }

    /**
     * Webhook do Arkama - método público para rotas
     * Copiado do ArkamaTrait para garantir que funcione nas rotas
     */
    public function arkamaWebhook(Request $request)
    {
        $payload = $request->all();
        
        Log::info('[Arkama Webhook] Recebido', ['payload' => $payload]);

        try {
            $transactionId = $payload['id'] ?? null;
            $status = $payload['status'] ?? null;
            $externalId = $payload['external_id'] ?? null;

            if (!$transactionId || !$status) {
                return response()->json(['error' => 'Payload inválido'], 400);
            }

            DB::beginTransaction();

            $deposit = Deposit::where('payment_id', $transactionId)
                ->orWhere('external_id', $externalId)
                ->lockForUpdate()
                ->first();

            if (!$deposit) {
                Log::warning('[Arkama Webhook] Depósito não encontrado', [
                    'transaction_id' => $transactionId,
                    'external_id' => $externalId
                ]);
                DB::rollBack();
                return response()->json(['message' => 'Depósito não encontrado']);
            }

            // Mapear status do Arkama
            $newStatus = $deposit->status;
            
            if (in_array($status, ['approved', 'paid', 'completed'])) {
                $newStatus = 1; // approved
            } elseif (in_array($status, ['cancelled', 'expired', 'failed'])) {
                $newStatus = 2; // rejected
            }

            // Se aprovado e ainda não creditado
            if ($newStatus == 1 && $deposit->status != 1) {
                $deposit->status = $newStatus;
                $deposit->save();

                $wallet = Wallet::where('user_id', $deposit->user_id)
                    ->lockForUpdate()
                    ->first();

                if (!$wallet) {
                    throw new \Exception('Carteira não encontrada');
                }

                $balanceBefore = $wallet->balance;
                $wallet->balance += $deposit->amount;
                $wallet->save();

                Transaction::create([
                    'user_id' => $deposit->user_id,
                    'payment_id' => $deposit->id,
                    'type' => 'deposit',
                    'amount' => $deposit->amount,
                    'description' => 'Depósito PIX via Arkama aprovado',
                ]);

                Log::info('[Arkama Webhook] Saldo creditado', [
                    'user_id' => $deposit->user_id,
                    'amount' => $deposit->amount,
                    'balance_before' => $balanceBefore,
                    'balance_after' => $wallet->balance
                ]);
            } else if ($deposit->status != $newStatus) {
                $deposit->status = $newStatus;
                $deposit->save();
            }

            DB::commit();
            return response()->json(['message' => 'Webhook processado']);

        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('[Arkama Webhook] Erro', [
                'message' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);
            return response()->json(['error' => 'Erro ao processar webhook'], 500);
        }
    }
}

