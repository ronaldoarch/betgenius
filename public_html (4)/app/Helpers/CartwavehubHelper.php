<?php

namespace App\Helpers;

use App\Models\Gateway;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Exception;

/**
 * CartwavehubHelper
 * Implementação seguindo o guia oficial Cashtime (CartWaveHub)
 * 
 * @see https://api-docs.cashtime.com.br
 * @see https://cartwavehub.notion.site/
 */
class CartwavehubHelper
{
    /**
     * Base URL da API Cartwavehub
     */
    private static $baseUrl = 'https://api.cartwavehub.com.br';

    /**
     * Buscar credenciais do banco de dados
     * 
     * @return array ['api_secret' => string, 'api_public' => string|null, 'uri' => string]
     * @throws Exception
     */
    private static function getCredentials(): array
    {
        $gateway = Gateway::first();
        
        if (!$gateway) {
            throw new Exception('Gateway não configurado');
        }

        $apiSecret = $gateway->cartwavehub_api_secret ?? null;
        $apiPublic = $gateway->cartwavehub_api_public ?? null;
        $uri = $gateway->cartwavehub_uri ?? self::$baseUrl;

        if (empty($apiSecret) || trim($apiSecret) === '') {
            throw new Exception('API Secret do Cartwavehub não configurado');
        }

        return [
            'api_secret' => trim($apiSecret),
            'api_public' => $apiPublic ? trim($apiPublic) : null,
            'uri' => trim($uri)
        ];
    }

    /**
     * Criar transação PIX (Depósito)
     * Endpoint: POST /v1/cob
     * 
     * @param int $userId ID do usuário
     * @param float $amount Valor em reais (ex: 50.00)
     * @param string $description Descrição da transação
     * @param string|null $postbackUrl URL do webhook (opcional)
     * @return array Dados da transação criada
     * @throws Exception
     */
    public static function createPixTransaction(
        int $userId, 
        float $amount, 
        string $description = 'Depósito',
        ?string $postbackUrl = null
    ): array {
        try {
            // 1. Buscar credenciais
            $credentials = self::getCredentials();

            // 2. Buscar dados do usuário
            $user = \App\Models\User::find($userId);
            
            if (!$user) {
                throw new Exception('Usuário não encontrado');
            }

            // 3. Validar valor
            if ($amount < 5.00) {
                throw new Exception('Valor mínimo: R$ 5,00');
            }

            if ($amount > 10000.00) {
                throw new Exception('Valor máximo: R$ 10.000,00');
            }

            // 4. Converter para centavos
            $amountInCents = intval(round($amount * 100));

            // 5. Gerar postbackUrl se não fornecido
            if (empty($postbackUrl)) {
                $postbackUrl = url('/cartwavehub/callback');
            }

            // 6. Preparar payload conforme guia
            $payload = [
                'postbackUrl' => $postbackUrl,
                'amount' => $amountInCents,
                'externalCode' => 'user_' . $userId . '_' . time(),
                'metadata' => [
                    'user_id' => (string)$userId,
                    'user_name' => $user->name ?? '',
                    'user_email' => $user->email ?? '',
                    'user_cpf' => preg_replace('/[^0-9]/', '', $user->cpf ?? ''),
                    'description' => $description
                ]
            ];

            // 7. Preparar headers conforme guia
            $headers = [
                'Content-Type' => 'application/json',
                'Accept' => 'application/json',
                'x-authorization-key' => $credentials['api_secret']
            ];

            if (!empty($credentials['api_public'])) {
                $headers['x-store-key'] = $credentials['api_public'];
            }

            // 8. Log da requisição
            Log::channel('daily')->info('[Cartwavehub] Criando PIX', [
                'user_id' => $userId,
                'amount' => $amount,
                'amount_cents' => $amountInCents,
                'external_code' => $payload['externalCode']
            ]);

            // 9. Fazer requisição HTTP
            $response = Http::withHeaders($headers)
                ->timeout(30)
                ->post($credentials['uri'] . '/v1/cob', $payload);

            // 10. Verificar resposta
            if (!$response->successful()) {
                $errorData = $response->json();
                $errorMsg = $errorData['message'] ?? $errorData['error'] ?? 'HTTP ' . $response->status();
                
                Log::channel('daily')->error('[Cartwavehub] Erro na criação', [
                    'status' => $response->status(),
                    'error' => $errorMsg,
                    'response' => $response->body()
                ]);
                
                throw new Exception('Erro ao criar PIX: ' . $errorMsg, $response->status());
            }

            $data = $response->json();

            // 11. Validar resposta
            if (!isset($data['id']) || !isset($data['pix'])) {
                Log::channel('daily')->error('[Cartwavehub] Resposta inválida', [
                    'response' => $data
                ]);
                throw new Exception('Resposta inválida da API');
            }

            // 12. Log de sucesso
            Log::channel('daily')->info('[Cartwavehub] PIX criado com sucesso', [
                'transaction_id' => $data['id'],
                'user_id' => $userId
            ]);

            return $data;

        } catch (Exception $e) {
            Log::channel('daily')->error('[Cartwavehub] Exception', [
                'message' => $e->getMessage(),
                'user_id' => $userId,
                'amount' => $amount
            ]);
            throw $e;
        }
    }

    /**
     * Listar transações
     * Endpoint: GET /v1/transactions
     * 
     * @param array $filters Filtros (opcional)
     * @return array Lista de transações
     * @throws Exception
     */
    public static function getTransactions(array $filters = []): array
    {
        try {
            $credentials = self::getCredentials();

            $headers = [
                'Content-Type' => 'application/json',
                'Accept' => 'application/json',
                'x-authorization-key' => $credentials['api_secret']
            ];

            if (!empty($credentials['api_public'])) {
                $headers['x-store-key'] = $credentials['api_public'];
            }

            $response = Http::withHeaders($headers)
                ->timeout(30)
                ->get($credentials['uri'] . '/v1/transactions', $filters);

            if (!$response->successful()) {
                throw new Exception('Erro ao listar transações: HTTP ' . $response->status());
            }

            return $response->json();

        } catch (Exception $e) {
            Log::channel('daily')->error('[Cartwavehub] Erro ao listar transações', [
                'message' => $e->getMessage()
            ]);
            throw $e;
        }
    }

    /**
     * Buscar saldo na conta Cartwavehub
     * Endpoint: GET /v1/balance
     * 
     * @return array Dados do saldo
     * @throws Exception
     */
    public static function getBalance(): array
    {
        try {
            $credentials = self::getCredentials();

            $headers = [
                'Content-Type' => 'application/json',
                'Accept' => 'application/json',
                'x-authorization-key' => $credentials['api_secret']
            ];

            if (!empty($credentials['api_public'])) {
                $headers['x-store-key'] = $credentials['api_public'];
            }

            $response = Http::withHeaders($headers)
                ->timeout(30)
                ->get($credentials['uri'] . '/v1/balance');

            if (!$response->successful()) {
                throw new Exception('Erro ao buscar saldo: HTTP ' . $response->status());
            }

            return $response->json();

        } catch (Exception $e) {
            Log::channel('daily')->error('[Cartwavehub] Erro ao buscar saldo', [
                'message' => $e->getMessage()
            ]);
            throw $e;
        }
    }
}

