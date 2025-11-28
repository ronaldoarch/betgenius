<?php

namespace App\Http\Controllers\Gateway;

use App\Http\Controllers\Controller;
use App\Traits\Gateways\AgilizepayTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class AgilizepayController extends Controller
{
    use AgilizepayTrait;

    /**
     * Webhook para depósitos (PIX-IN)
     * 
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function callbackPayment(Request $request)
    {
        Log::info('AgilizePay Webhook Received - Deposit', $request->all());
        return self::webhookAgilizepay($request);
    }

    /**
     * Webhook para saques (PIX-OUT)
     * 
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function callbackWithdrawal(Request $request)
    {
        Log::info('AgilizePay Webhook Received - Withdrawal', $request->all());
        return self::webhookWithdrawalAgilizepay($request);
    }

    /**
     * Processar saque manualmente (chamado pelo admin)
     * 
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function processWithdrawal(Request $request)
    {
        $withdrawalId = $request->input('withdrawal_id');
        $type = $request->input('type', 'normal'); // normal ou afiliado

        $result = self::pixCashOutAgilizepay($withdrawalId, $type);

        if ($result) {
            return response()->json(['success' => true, 'message' => 'Saque processado com sucesso']);
        }

        return response()->json(['success' => false, 'message' => 'Falha ao processar saque'], 500);
    }
}

