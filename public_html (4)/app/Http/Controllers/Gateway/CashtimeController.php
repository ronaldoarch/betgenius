<?php

namespace App\Http\Controllers\Gateway;

use App\Http\Controllers\Controller;
use App\Traits\Gateways\CashtimeTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class CashtimeController extends Controller
{
    use CashtimeTrait;

    /**
     * Webhook para depósitos (PIX-IN)
     * 
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function callbackPayment(Request $request)
    {
        Log::info('Cashtime Webhook Received - Deposit', $request->all());
        return self::webhookCashtime($request);
    }

    /**
     * Webhook para saques (PIX-OUT)
     * 
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function callbackWithdrawal(Request $request)
    {
        Log::info('Cashtime Webhook Received - Withdrawal', $request->all());
        return self::webhookWithdrawalCashtime($request);
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

        $result = self::pixCashOutCashtime($withdrawalId, $type);

        if ($result) {
            return response()->json(['success' => true, 'message' => 'Saque processado com sucesso']);
        }

        return response()->json(['success' => false, 'message' => 'Falha ao processar saque'], 500);
    }
}

