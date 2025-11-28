<?php

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

echo "🔐 TESTANDO AUTENTICAÇÃO ARKAMA\n";
echo "================================\n\n";

$gw = \App\Models\Gateway::first();
$uri = rtrim($gw->arkama_uri ?? 'https://app.arkama.com.br/api/v1', '/');
$token = $gw->arkama_api_token ?? '';

echo "📋 CONFIGURAÇÃO:\n";
echo "URI: {$uri}\n";
echo "Token completo: " . ($token ? substr($token, 0, 50) . '... (tamanho: ' . strlen($token) . ')' : 'VAZIO ❌') . "\n\n";

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

$url = $uri . '/orders';

// Testar diferentes formatos de autenticação
$authFormats = [
    'Bearer ' . $token,
    'Bearer ' . trim($token),
    $token,
    'Token ' . $token,
    'API-Key ' . $token,
];

foreach ($authFormats as $index => $authHeader) {
    echo "🔍 Teste " . ($index + 1) . ": Authorization: " . substr($authHeader, 0, 30) . "...\n";
    
    try {
        $response = \Illuminate\Support\Facades\Http::withHeaders([
            'Content-Type' => 'application/json',
            'Authorization' => $authHeader,
            'User-Agent' => 'BetGenius/1.0',
            'Accept' => 'application/json',
        ])->timeout(10)->post($url, $payload);
        
        $status = $response->status();
        $contentType = $response->header('Content-Type') ?? 'não informado';
        $body = $response->body();
        
        echo "  Status: {$status}\n";
        echo "  Content-Type: {$contentType}\n";
        
        if ($status === 200 || $status === 201) {
            $data = $response->json();
            if ($data && isset($data['id'])) {
                echo "  ✅ SUCESSO! Pedido criado!\n";
                echo "  ID: " . ($data['id'] ?? 'N/A') . "\n";
                echo "  Campos disponíveis: " . implode(', ', array_keys($data)) . "\n";
                echo "\n  Resposta completa:\n";
                echo json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) . "\n";
                echo "\n🎉 FORMATO CORRETO ENCONTRADO: Authorization: " . substr($authHeader, 0, 30) . "...\n";
                break;
            } else {
                echo "  ⚠️  Status OK mas resposta inesperada\n";
                echo "  Body: " . substr($body, 0, 200) . "\n";
            }
        } else if ($status === 401) {
            $errorData = $response->json();
            echo "  ❌ Não autenticado: " . ($errorData['message'] ?? 'Token inválido') . "\n";
        } else if ($status === 422) {
            $errorData = $response->json();
            echo "  ⚠️  Erro de validação: " . json_encode($errorData, JSON_UNESCAPED_UNICODE) . "\n";
        } else {
            $errorData = $response->json();
            echo "  ⚠️  Erro {$status}: " . ($errorData['message'] ?? substr($body, 0, 100)) . "\n";
        }
    } catch (\Exception $e) {
        echo "  ❌ Exceção: " . $e->getMessage() . "\n";
    }
    
    echo "\n";
}

echo "\n📝 TESTE CONCLUÍDO\n";
echo "\n💡 DICAS:\n";
echo "1. Se todos os formatos retornarem 401, o token pode estar incorreto ou expirado\n";
echo "2. Verifique se o token foi gerado corretamente na dashboard da Arkama\n";
echo "3. Verifique se o token tem as permissões necessárias para criar pedidos\n";
echo "4. Tente gerar um novo token na dashboard da Arkama\n";

