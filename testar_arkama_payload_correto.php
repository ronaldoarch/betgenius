<?php

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

echo "🧪 TESTANDO PAYLOAD CORRETO - ARKAMA\n";
echo "====================================\n\n";

$gw = \App\Models\Gateway::first();
$uri = rtrim($gw->arkama_uri ?? 'https://app.arkama.com.br/api/v1', '/');
$token = $gw->arkama_api_token ?? '';

echo "📋 CONFIGURAÇÃO:\n";
echo "URI: {$uri}\n";
echo "Token: " . (empty($token) ? 'VAZIO ❌' : substr($token, 0, 20) . '... ✅') . "\n\n";

if (empty($token)) {
    echo "❌ Token não configurado!\n";
    exit(1);
}

// CPF válido formatado (111.444.777-35 é um CPF válido para testes)
$cpf = '11144477735';
$document = substr($cpf, 0, 3) . '.' . substr($cpf, 3, 3) . '.' . substr($cpf, 6, 3) . '-' . substr($cpf, 9, 2);

// Payload correto conforme API Arkama
$payload = [
    'value' => 10.00,
    'paymentMethod' => 'pix',
    'customer' => [
        'name' => 'Teste Cliente',
        'email' => 'teste@teste.com',
        'document' => $document, // CPF formatado: 111.444.777-35
    ],
    'shipping' => [
        'address' => [
            'street' => 'Rua Teste',
            'number' => '123',
            'neighborhood' => 'Centro',
            'city' => 'São Paulo',
            'state' => 'SP',
            'zipCode' => '01000000',
            'country' => 'BR',
        ]
    ],
    'items' => [
        [
            'title' => 'Depósito PIX',
            'quantity' => 1,
            'unitPrice' => 10.00,
            'isDigital' => true,
        ]
    ],
    'external_id' => 'TEST-' . time(),
    'notification_url' => 'https://betgeniusbr.com/api/arkama/webhook',
    'ip' => '127.0.0.1',
];

$url = $uri . '/orders';

echo "📤 ENVIANDO REQUISIÇÃO:\n";
echo "URL: {$url}\n";
echo "Payload: " . json_encode($payload, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) . "\n\n";

$response = \Illuminate\Support\Facades\Http::withHeaders([
    'Content-Type' => 'application/json',
    'Authorization' => 'Bearer ' . $token,
    'User-Agent' => 'BetGenius/1.0',
    'Accept' => 'application/json',
])->timeout(30)->post($url, $payload);

$status = $response->status();
$contentType = $response->header('Content-Type') ?? 'não informado';
$body = $response->body();

echo "📥 RESPOSTA:\n";
echo "Status: {$status}\n";
echo "Content-Type: {$contentType}\n\n";

if ($status === 200 || $status === 201) {
    $data = $response->json();
    if ($data) {
        echo "✅ SUCESSO! Pedido criado!\n\n";
        echo "📋 Dados do pedido:\n";
        echo json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) . "\n";
        echo "\n🎉 PAYLOAD CORRETO! Verifique os campos disponíveis acima.\n";
    } else {
        echo "⚠️  Status OK mas resposta não é JSON válido:\n";
        echo substr($body, 0, 500) . "\n";
    }
} else if ($status === 422) {
    $errorData = $response->json();
    echo "❌ Erro de validação:\n";
    echo json_encode($errorData, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) . "\n";
} else {
    $errorData = $response->json();
    echo "❌ Erro {$status}:\n";
    echo json_encode($errorData, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) . "\n";
}

