<?php

namespace App\Http\Controllers\Gateway;

use App\Http\Controllers\Controller;
use App\Traits\Gateways\CartwavehubTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class CartwavehubController extends Controller
{
    use CartwavehubTrait;

    /**
     * Webhook para depósitos (PIX-IN)
     * 
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function callbackPayment(Request $request)
    {
        Log::info('Cartwavehub Webhook Received - Deposit', $request->all());
        return self::webhookCartwavehub($request);
    }

    /**
     * Webhook para saques (PIX-OUT)
     * 
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function callbackWithdrawal(Request $request)
    {
        Log::info('Cartwavehub Webhook Received - Withdrawal', $request->all());
        return self::webhookWithdrawalCartwavehub($request);
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

        $result = self::pixCashOutCartwavehub($withdrawalId, $type);

        if ($result) {
            return response()->json(['success' => true, 'message' => 'Saque processado com sucesso']);
        }

        return response()->json(['success' => false, 'message' => 'Falha ao processar saque'], 500);
    }

    /**
     * Consultar saldo
     * 
     * @return \Illuminate\Http\JsonResponse
     */
    public function getBalance()
    {
        $balance = self::getBalanceCartwavehub();
        
        if ($balance !== null) {
            return response()->json($balance);
        }

        return response()->json(['error' => 'Erro ao consultar saldo'], 500);
    }

    /**
     * Listar transações
     * 
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function listTransactions(Request $request)
    {
        $page = $request->input('page', 1);
        $pageSize = $request->input('pageSize', 15);

        $transactions = self::listTransactionsCartwavehub($page, $pageSize);
        
        if ($transactions !== null) {
            return response()->json($transactions);
        }

        return response()->json(['error' => 'Erro ao listar transações'], 500);
    }
}

