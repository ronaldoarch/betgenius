<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Helpers\CartwavehubHelper;
use App\Models\Deposit;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Exception;

/**
 * Controller para criação de depósitos via Cartwavehub (PIX)
 * Seguindo o guia oficial
 */
class CartwavehubDepositController extends Controller
{
    /**
     * Criar depósito PIX via Cartwavehub
     * 
     * POST /api/cartwavehub/create-pix
     * 
     * @param Request $request
     * @return JsonResponse
     */
    public function createPix(Request $request): JsonResponse
    {
        try {
            // 1. Verificar autenticação
            $user = Auth::user();
            
            if (!$user) {
                return response()->json([
                    'success' => false,
                    'error' => 'Não autenticado'
                ], 401);
            }

            // 2. Validar dados
            $validator = Validator::make($request->all(), [
                'amount' => 'required|numeric|min:5|max:10000'
            ], [
                'amount.required' => 'Valor é obrigatório',
                'amount.numeric' => 'Valor deve ser numérico',
                'amount.min' => 'Valor mínimo: R$ 5,00',
                'amount.max' => 'Valor máximo: R$ 10.000,00'
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'error' => $validator->errors()->first()
                ], 400);
            }

            $amount = floatval($request->input('amount'));

            // 3. Criar transação no Cartwavehub
            $transaction = CartwavehubHelper::createPixTransaction(
                $user->id,
                $amount,
                'Depósito via PIX'
            );

            // 4. Salvar no banco de dados (tabela deposits)
            $deposit = new Deposit();
            $deposit->user_id = $user->id;
            $deposit->amount = $amount;
            $deposit->type = 'pix';
            $deposit->proof = null;
            $deposit->status = 0; // 0 = pending, 1 = completed, 2 = cancelled
            $deposit->currency = 'BRL';
            
            // Salvar dados do PIX em JSON
            $deposit->pix_code = json_encode([
                'transaction_id' => $transaction['id'],
                'qr_code' => $transaction['pix']['qrCode'] ?? null,
                'pix_key' => $transaction['pix']['pixKey'] ?? null,
                'expires_at' => $transaction['pix']['expiresAt'] ?? null,
                'created_at' => now()->toISOString()
            ]);
            
            $deposit->save();

            // 5. Log de sucesso
            Log::channel('daily')->info('[Cartwavehub] Depósito criado', [
                'deposit_id' => $deposit->id,
                'user_id' => $user->id,
                'amount' => $amount,
                'transaction_id' => $transaction['id']
            ]);

            // 6. Retornar resposta
            return response()->json([
                'success' => true,
                'deposit_id' => $deposit->id,
                'pix' => [
                    'qr_code' => $transaction['pix']['qrCode'] ?? null,
                    'pix_key' => $transaction['pix']['pixKey'] ?? null,
                    'expires_at' => $transaction['pix']['expiresAt'] ?? null
                ],
                'amount' => $amount,
                'message' => 'QR Code PIX gerado com sucesso'
            ], 201);

        } catch (Exception $e) {
            Log::channel('daily')->error('[Cartwavehub] Erro ao criar depósito', [
                'user_id' => Auth::id(),
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);

            return response()->json([
                'success' => false,
                'error' => $e->getMessage()
            ], $e->getCode() ?: 500);
        }
    }

    /**
     * Listar depósitos do usuário
     * 
     * GET /api/cartwavehub/my-deposits
     * 
     * @param Request $request
     * @return JsonResponse
     */
    public function myDeposits(Request $request): JsonResponse
    {
        try {
            $user = Auth::user();
            
            if (!$user) {
                return response()->json([
                    'success' => false,
                    'error' => 'Não autenticado'
                ], 401);
            }

            $deposits = Deposit::where('user_id', $user->id)
                ->where('type', 'pix')
                ->orderBy('created_at', 'desc')
                ->limit(50)
                ->get()
                ->map(function ($deposit) {
                    $pixData = json_decode($deposit->pix_code, true);
                    
                    return [
                        'id' => $deposit->id,
                        'amount' => $deposit->amount,
                        'status' => $deposit->status,
                        'status_label' => self::getStatusLabel($deposit->status),
                        'pix_key' => $pixData['pix_key'] ?? null,
                        'qr_code' => $pixData['qr_code'] ?? null,
                        'created_at' => $deposit->created_at->toISOString(),
                        'expires_at' => $pixData['expires_at'] ?? null
                    ];
                });

            return response()->json([
                'success' => true,
                'deposits' => $deposits
            ]);

        } catch (Exception $e) {
            return response()->json([
                'success' => false,
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Obter label do status
     * 
     * @param int $status
     * @return string
     */
    private static function getStatusLabel(int $status): string
    {
        return match($status) {
            0 => 'Pendente',
            1 => 'Aprovado',
            2 => 'Cancelado',
            default => 'Desconhecido'
        };
    }
}

