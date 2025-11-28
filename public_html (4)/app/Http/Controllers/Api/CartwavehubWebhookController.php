<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Deposit;
use App\Models\Wallet;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Exception;

/**
 * Webhook Controller para Cartwavehub
 * Processa callbacks de pagamentos aprovados/reprovados
 * 
 * Seguindo o guia oficial:
 * - SEMPRE retornar HTTP 200 (evita retry infinito)
 * - Usar transação de banco com FOR UPDATE
 * - Mapear status conforme documentação
 */
class CartwavehubWebhookController extends Controller
{
    /**
     * Receber webhook de depósitos (PIX IN)
     * 
     * POST /cartwavehub/callback
     * 
     * @param Request $request
     * @return JsonResponse
     */
    public function callback(Request $request): JsonResponse
    {
        try {
            // 1. Capturar payload
            $payload = $request->all();
            $rawPayload = $request->getContent();

            // 2. Log do webhook recebido
            Log::channel('daily')->info('[Cartwavehub Webhook] Recebido', [
                'payload' => $payload,
                'raw' => $rawPayload,
                'ip' => $request->ip()
            ]);

            // 3. Extrair dados essenciais
            $transactionId = $payload['id'] ?? $payload['transaction_id'] ?? null;
            $status = $payload['status'] ?? null;
            $paidAt = $payload['paidAt'] ?? $payload['paid_at'] ?? null;
            $amount = $payload['amount'] ?? null;

            if (!$transactionId) {
                Log::channel('daily')->warning('[Cartwavehub Webhook] Transaction ID não encontrado');
                return response()->json([
                    'success' => true,
                    'message' => 'Transaction ID não encontrado'
                ], 200);
            }

            // 4. Buscar depósito no banco
            $deposit = Deposit::where('pix_code', 'LIKE', '%"transaction_id":"' . $transactionId . '"%')
                ->first();

            if (!$deposit) {
                Log::channel('daily')->info('[Cartwavehub Webhook] Depósito não encontrado', [
                    'transaction_id' => $transactionId
                ]);
                return response()->json([
                    'success' => true,
                    'message' => 'Depósito não encontrado'
                ], 200);
            }

            // 5. Mapear status conforme guia
            $newStatus = 0; // pending
            if (in_array(strtolower($status), ['paid', 'approved', 'completed'])) {
                $newStatus = 1; // completed
            } elseif (in_array(strtolower($status), ['failed', 'cancelled', 'expired'])) {
                $newStatus = 2; // cancelled
            }

            Log::channel('daily')->info('[Cartwavehub Webhook] Status mapeado', [
                'deposit_id' => $deposit->id,
                'old_status' => $deposit->status,
                'new_status' => $newStatus,
                'cashtime_status' => $status
            ]);

            // 6. Atualizar status do depósito
            $deposit->status = $newStatus;
            
            if ($paidAt) {
                $pixData = json_decode($deposit->pix_code, true) ?? [];
                $pixData['paid_at'] = $paidAt;
                $deposit->pix_code = json_encode($pixData);
            }
            
            $deposit->save();

            // 7. Se aprovado, creditar saldo
            if ($newStatus === 1 && $deposit->status !== 1) {
                $this->creditBalance($deposit);
            }

            // 8. Sempre retornar 200 (conforme guia)
            return response()->json([
                'success' => true,
                'message' => 'Webhook processado com sucesso'
            ], 200);

        } catch (Exception $e) {
            // Log do erro mas retorna 200 para não gerar retry
            Log::channel('daily')->error('[Cartwavehub Webhook] Erro ao processar', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
                'payload' => $request->all()
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Erro interno processado',
                'error' => $e->getMessage()
            ], 200); // Sempre 200 conforme guia
        }
    }

    /**
     * Creditar saldo na carteira do usuário
     * Usa transação de banco com FOR UPDATE (conforme guia)
     * 
     * @param Deposit $deposit
     * @return void
     * @throws Exception
     */
    private function creditBalance(Deposit $deposit): void
    {
        DB::beginTransaction();

        try {
            // 1. Buscar carteira com lock (FOR UPDATE)
            $wallet = Wallet::where('user_id', $deposit->user_id)
                ->lockForUpdate()
                ->first();

            if (!$wallet) {
                // Criar carteira se não existir
                $wallet = new Wallet();
                $wallet->user_id = $deposit->user_id;
                $wallet->balance = 0;
                $wallet->balance_bonus = 0;
                $wallet->balance_withdrawal = 0;
                $wallet->save();
            }

            // 2. Calcular saldos
            $balanceBefore = floatval($wallet->balance);
            $balanceAfter = $balanceBefore + floatval($deposit->amount);

            // 3. Atualizar saldo
            $wallet->balance = $balanceAfter;
            $wallet->save();

            // 4. Criar transação no histórico
            $transaction = new Transaction();
            $transaction->user_id = $deposit->user_id;
            $transaction->payment_id = null;
            $transaction->type = 'deposit'; // tipo: deposit
            $transaction->amount = $deposit->amount;
            $transaction->refer = 'Depósito PIX aprovado - Cartwavehub';
            $transaction->status = 1; // completed
            $transaction->price = $deposit->amount;
            $transaction->currency = 'BRL';
            $transaction->balance_before = $balanceBefore;
            $transaction->balance_after = $balanceAfter;
            $transaction->save();

            // 5. Commit da transação
            DB::commit();

            Log::channel('daily')->info('[Cartwavehub] Saldo creditado', [
                'deposit_id' => $deposit->id,
                'user_id' => $deposit->user_id,
                'amount' => $deposit->amount,
                'balance_before' => $balanceBefore,
                'balance_after' => $balanceAfter
            ]);

        } catch (Exception $e) {
            DB::rollBack();

            Log::channel('daily')->error('[Cartwavehub] Erro ao creditar saldo', [
                'deposit_id' => $deposit->id,
                'user_id' => $deposit->user_id,
                'error' => $e->getMessage()
            ]);

            throw $e;
        }
    }
}

