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
    use SuitpayTrait, DigitoPayTrait, EzzepayTrait, BsPayTrait, AgilizepayTrait, CashtimeTrait, CartwavehubTrait;

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse|null
     */
    public function submitPayment(Request $request)
    {
        // Auto-detectar gateway ativo se não especificado
        if (!$request->has('gateway') || empty($request->gateway)) {
            $gw = Gateway::first();
            
            // Prioridade: AgilizePay > Cartwavehub > outros
            if ($gw && $gw->agilizepay_ativo == 1) {
                $request->merge(['gateway' => 'agilizepay']);
            } elseif ($gw && $gw->cartwavehub_ativo == 1) {
                $request->merge(['gateway' => 'cartwavehub']);
            }
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
            default:
                return response()->json(['error' => 'Nenhum gateway configurado'], 500);
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
            // Verificar se o gateway está configurado e ativo
            $gateway = Gateway::first();
            if (!$gateway || $gateway->cartwavehub_ativo != 1) {
                throw new Exception('Gateway Cartwavehub não está ativo.');
            }

            if (!$gateway->cartwavehub_uri || !$gateway->cartwavehub_api_secret) {
                throw new Exception('Gateway Cartwavehub não configurado corretamente.');
            }

            // Criar transação PIX via CartwavehubHelper
            $cartwavehubTransaction = CartwavehubHelper::createPixTransaction(
                $user->id,
                $amount,
                'Depósito PIX'
            );

            // Criar registro de depósito
            $deposit = new Deposit();
            $deposit->user_id = $user->id;
            $deposit->amount = $amount;
            $deposit->type = 'pix';
            $deposit->status = 0; // pending
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

        $deposit->status = 2; // cancelled
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
}

