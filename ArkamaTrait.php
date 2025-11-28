<?php

namespace App\Traits\Gateways;

use App\Models\Deposit;
use App\Models\Gateway;
use App\Models\Transaction;
use App\Models\Wallet;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

trait ArkamaTrait
{
    /**
     * Criar depósito PIX via Arkama
     */
    public function requestQrcodeArkama(Request $request)
    {
        Log::info('[Arkama] requestQrcodeArkama chamado', [
            'amount' => $request->amount ?? 'não especificado',
            'cpf' => $request->cpf ?? 'não especificado',
            'user_id' => auth('api')->id() ?? 'não autenticado',
        ]);

        try {
            $user = auth('api')->user();
            
            if (!$user) {
                Log::error('[Arkama] Usuário não autenticado');
                return response()->json(['error' => 'Usuário não autenticado'], 401);
            }

            $validator = Validator::make($request->all(), [
                'amount' => 'required|numeric|min:1|max:100000',
                'cpf' => 'required|string',
            ]);

            if ($validator->fails()) {
                return response()->json(['error' => $validator->errors()->first()], 400);
            }

            $gateway = Gateway::first();
            
            if (!$gateway || !$gateway->arkama_api_token || $gateway->arkama_ativo != 1) {
                return response()->json(['error' => 'Gateway Arkama não configurado'], 500);
            }

            $amount = floatval($request->amount);
            $cpf = preg_replace('/[^0-9]/', '', $request->cpf);
            $orderId = 'DEP-' . $user->id . '-' . time();

            // Formatar CPF (11 dígitos) ou CNPJ (14 dígitos)
            $document = $cpf;
            if (strlen($document) == 11) {
                // Formatar CPF: 000.000.000-00
                $document = substr($document, 0, 3) . '.' . substr($document, 3, 3) . '.' . substr($document, 6, 3) . '-' . substr($document, 9, 2);
            } elseif (strlen($document) == 14) {
                // Formatar CNPJ: 00.000.000/0000-00
                $document = substr($document, 0, 2) . '.' . substr($document, 2, 3) . '.' . substr($document, 5, 3) . '/' . substr($document, 8, 4) . '-' . substr($document, 12, 2);
            }

            // Obter IP do cliente
            $clientIp = $request->ip() 
                     ?? $request->header('X-Forwarded-For') 
                     ?? $request->header('X-Real-IP') 
                     ?? '127.0.0.1';
            
            // Se X-Forwarded-For tiver múltiplos IPs, pegar o primeiro
            if (strpos($clientIp, ',') !== false) {
                $clientIp = trim(explode(',', $clientIp)[0]);
            }

            // Payload conforme formato da API Arkama
            $payload = [
                'value' => $amount,
                'paymentMethod' => 'pix',
                'customer' => [
                    'name' => $user->name ?? 'Cliente',
                    'email' => $user->email ?? 'cliente@email.com',
                    'document' => $document,
                ],
                'shipping' => [
                    'address' => [
                        'street' => 'Não informado',
                        'number' => '0',
                        'neighborhood' => 'Não informado',
                        'city' => 'Não informado',
                        'state' => 'SP',
                        'zipCode' => '00000000',
                        'country' => 'BR',
                    ]
                ],
                'items' => [
                    [
                        'title' => 'Depósito PIX',
                        'quantity' => 1,
                        'unitPrice' => $amount,
                        'isDigital' => true,
                    ]
                ],
                'external_id' => $orderId,
                'notification_url' => url('/api/arkama/webhook'),
                'ip' => $clientIp,
            ];

            Log::info('[Arkama] Criando pedido', [
                'user_id' => $user->id,
                'amount' => $amount,
                'order_id' => $orderId
            ]);

            $response = Http::withHeaders([
                'Content-Type' => 'application/json',
                'Authorization' => 'Bearer ' . $gateway->arkama_api_token,
                'User-Agent' => 'BetGenius/1.0',
            ])->timeout(30)->post($gateway->arkama_uri . '/orders', $payload);

            if (!$response->successful()) {
                $errorMsg = $response->json('message') ?? 'Erro ao processar pagamento';
                
                Log::error('[Arkama] Erro na API', [
                    'status' => $response->status(),
                    'error' => $errorMsg,
                    'body' => $response->body()
                ]);
                
                return response()->json(['error' => $errorMsg], $response->status());
            }

            $data = $response->json();

            // Log completo da resposta para debug
            Log::info('[Arkama] Resposta da API recebida', [
                'response_data' => $data,
                'all_keys' => array_keys($data ?? [])
            ]);

            if (!isset($data['id'])) {
                Log::error('[Arkama] Resposta inválida - ID não encontrado', ['data' => $data]);
                return response()->json(['error' => 'Resposta inválida da API: ID não encontrado'], 500);
            }

            // A API Arkama retorna o código PIX em pix.payload
            $pixCode = $data['pix']['payload'] ?? null;

            if (!$pixCode) {
                Log::error('[Arkama] Código PIX não encontrado na resposta', [
                    'data' => $data,
                    'campos_disponiveis' => array_keys($data ?? []),
                    'pix_keys' => isset($data['pix']) ? array_keys($data['pix']) : null
                ]);
                return response()->json(['error' => 'Código PIX não encontrado na resposta da API'], 500);
            }

            // O QR Code pode ser gerado a partir do payload PIX
            // Para exibir, usamos o próprio payload como código PIX
            $qrcode = $pixCode;

            // Criar depósito no banco
            $deposit = new Deposit();
            $deposit->user_id = $user->id;
            $deposit->amount = $amount;
            $deposit->type = 'pix';
            $deposit->status = 0; // pending
            $deposit->payment_id = $data['id'];
            // Usar proof para armazenar o QR code (coluna existente na tabela)
            $deposit->proof = $qrcode;
            $deposit->save();
            
            // Atualizar external_id se a coluna existir
            if (\Schema::hasColumn('deposits', 'external_id')) {
                \DB::table('deposits')
                    ->where('id', $deposit->id)
                    ->update(['external_id' => $orderId]);
            }

            Log::info('[Arkama] Depósito criado com sucesso', [
                'deposit_id' => $deposit->id,
                'arkama_id' => $data['id'],
                'qrcode_length' => strlen($qrcode ?? '')
            ]);

            return response()->json([
                'status' => true,
                'idTransaction' => $deposit->id,
                'qrcode' => $qrcode,
                'pix_code' => $pixCode ?? '',
            ]);

        } catch (\Exception $e) {
            Log::error('[Arkama] Exception', [
                'message' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);
            
            return response()->json(['error' => 'Erro ao processar pagamento'], 500);
        }
    }

    /**
     * Webhook do Arkama
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
            // approved, pending, cancelled, refunded
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

