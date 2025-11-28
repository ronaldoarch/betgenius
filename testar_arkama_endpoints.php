<?php

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

echo "🧪 TESTANDO DIFERENTES ENDPOINTS ARKAMA\n";
echo "========================================\n\n";

$gw = \App\Models\Gateway::first();
$baseUri = rtrim($gw->arkama_uri ?? 'https://app.arkama.com.br/api/v1', '/');
$token = $gw->arkama_api_token ?? '';

echo "📋 CONFIGURAÇÃO:\n";
echo "Base URI: {$baseUri}\n";
echo "Token: " . (empty($token) ? 'VAZIO ❌' : substr($token, 0, 20) . '... ✅') . "\n\n";

if (empty($token)) {
    echo "❌ Token não configurado!\n";
    exit(1);
}

$payload = [
    'amount' => 10.00,
    'customer' => [
        'name' => 'Teste Cliente',
        'email' => 'teste@teste.com',
        'document' => '12345678900',
    ],
    'external_id' => 'TEST-' . time(),
    'notification_url' => 'https://betgeniusbr.com/api/arkama/webhook',
];

// Testar diferentes endpoints
$endpoints = [
    '/orders',
    '/order',
    '/pix/orders',
    '/pix/order',
    '/v1/orders',
    '/v1/order',
    '/api/orders',
    '/api/order',
];

$headers = [
    'Content-Type' => 'application/json',
    'Authorization' => 'Bearer ' . $token,
    'User-Agent' => 'BetGenius/1.0',
    'Accept' => 'application/json',
];

foreach ($endpoints as $endpoint) {
    $url = $baseUri . $endpoint;
    
    echo "🔍 Testando: {$url}\n";
    
    try {
        $response = \Illuminate\Support\Facades\Http::withHeaders($headers)
            ->timeout(10)
            ->post($url, $payload);
        
        $status = $response->status();
        $contentType = $response->header('Content-Type') ?? 'não informado';
        $body = $response->body();
        
        echo "  Status: {$status}\n";
        echo "  Content-Type: {$contentType}\n";
        
        if (strpos($contentType, 'application/json') !== false) {
            $data = $response->json();
            if ($data) {
                echo "  ✅ SUCESSO! JSON recebido!\n";
                echo "  Campos: " . implode(', ', array_keys($data)) . "\n";
                echo "\n  Resposta completa:\n";
                echo json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) . "\n";
                echo "\n🎉 ENDPOINT CORRETO ENCONTRADO: {$url}\n";
                break;
            }
        } else if (strpos($body, '<html') !== false) {
            echo "  ❌ HTML recebido (redirecionamento para login)\n";
        } else if ($status >= 400) {
            $errorData = $response->json();
            if ($errorData) {
                echo "  ⚠️  Erro: " . json_encode($errorData, JSON_UNESCAPED_UNICODE) . "\n";
            } else {
                echo "  ⚠️  Erro: " . substr($body, 0, 100) . "\n";
            }
        } else {
            echo "  ⚠️  Resposta inesperada\n";
        }
    } catch (\Exception $e) {
        echo "  ❌ Exceção: " . $e->getMessage() . "\n";
    }
    
    echo "\n";
}

echo "\n📝 TESTE CONCLUÍDO\n";

