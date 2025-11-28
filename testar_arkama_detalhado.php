<?php

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

echo "🧪 TESTE DETALHADO - API ARKAMA\n";
echo "===============================\n\n";

$gw = \App\Models\Gateway::first();
$uri = $gw->arkama_uri ?? 'https://app.arkama.com.br/api/v1';
$token = $gw->arkama_api_token ?? '';

echo "📋 CONFIGURAÇÃO:\n";
echo "URI: {$uri}\n";
echo "Token: " . (empty($token) ? 'VAZIO ❌' : substr($token, 0, 20) . '... ✅') . "\n\n";

if (empty($token)) {
    echo "❌ Token não configurado!\n";
    exit(1);
}

// Verificar se a URI termina com /api/v1
if (!preg_match('/\/api\/v1$/', $uri)) {
    echo "⚠️  ATENÇÃO: URI pode estar incorreta!\n";
    echo "   Esperado: https://app.arkama.com.br/api/v1\n";
    echo "   Atual: {$uri}\n\n";
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

$url = rtrim($uri, '/') . '/orders';

echo "📤 ENVIANDO REQUISIÇÃO:\n";
echo "URL: {$url}\n";
echo "Method: POST\n";
echo "Payload: " . json_encode($payload, JSON_PRETTY_PRINT) . "\n\n";

$response = \Illuminate\Support\Facades\Http::withHeaders([
    'Content-Type' => 'application/json',
    'Authorization' => 'Bearer ' . $token,
    'User-Agent' => 'BetGenius/1.0',
])->timeout(30)->post($url, $payload);

echo "📥 RESPOSTA:\n";
echo "Status Code: " . $response->status() . "\n";

$body = $response->body();
$contentType = $response->header('Content-Type') ?? 'não informado';
echo "Content-Type: {$contentType}\n\n";

if (strpos($contentType, 'application/json') === false && strpos($body, '<html') !== false) {
    echo "❌ PROBLEMA: Resposta é HTML ao invés de JSON!\n";
    echo "   Isso indica que a URL pode estar errada ou o token não está sendo aceito.\n\n";
    echo "Body (primeiros 300 caracteres):\n";
    echo substr($body, 0, 300) . "\n";
} else if ($response->successful()) {
    $data = $response->json();
    if ($data) {
        echo "✅ JSON válido recebido!\n";
        echo "Campos na resposta:\n";
        foreach (array_keys($data) as $key) {
            echo "  - {$key}\n";
        }
        echo "\nResposta completa:\n";
        echo json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) . "\n";
    } else {
        echo "⚠️  Status 200 mas resposta não é JSON válido!\n";
        echo "Body: " . substr($body, 0, 500) . "\n";
    }
} else {
    echo "❌ Erro na requisição!\n";
    $errorData = $response->json();
    if ($errorData) {
        echo "Erro (JSON):\n";
        echo json_encode($errorData, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) . "\n";
    } else {
        echo "Erro (texto):\n";
        echo substr($body, 0, 500) . "\n";
    }
}

