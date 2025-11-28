<?php

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

echo "🧪 TESTANDO API ARKAMA\n";
echo "======================\n\n";

$gw = \App\Models\Gateway::first();
$uri = $gw->arkama_uri ?? 'https://app.arkama.com.br/api/v1';
$token = $gw->arkama_api_token ?? '';

echo "URI: {$uri}\n";
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

echo "📤 Enviando requisição...\n";
echo "URL: {$uri}/orders\n\n";

$response = \Illuminate\Support\Facades\Http::withHeaders([
    'Content-Type' => 'application/json',
    'Authorization' => 'Bearer ' . $token,
])->timeout(30)->post($uri . '/orders', $payload);

echo "📥 Resposta:\n";
echo "Status: {$response->status()}\n";
echo "Body:\n";
echo $response->body() . "\n\n";

if ($response->successful()) {
    $data = $response->json();
    echo "✅ Campos na resposta:\n";
    foreach (array_keys($data ?? []) as $key) {
        echo "  - {$key}\n";
    }
    
    // Verificar campos esperados
    echo "\n🔍 Verificando campos esperados:\n";
    echo "  - id: " . (isset($data['id']) ? '✅' : '❌') . "\n";
    echo "  - pix_qrcode: " . (isset($data['pix_qrcode']) ? '✅' : '❌') . "\n";
    echo "  - pix_code: " . (isset($data['pix_code']) ? '✅' : '❌') . "\n";
    
    // Mostrar estrutura completa
    echo "\n📋 Estrutura completa:\n";
    print_r($data);
} else {
    echo "❌ Erro na API!\n";
    $error = $response->json();
    if ($error) {
        print_r($error);
    }
}

