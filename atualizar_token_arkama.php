<?php

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

echo "🔐 ATUALIZANDO TOKEN ARKAMA\n";
echo "===========================\n\n";

$novoToken = 'D2OUFflOrpUAyoTXt4IEGEHi0xB7SZaBt8mqevBrnM3LWEJY2YnSJO1WbdBD';

$gw = \App\Models\Gateway::first();

if (!$gw) {
    echo "❌ Gateway não encontrado!\n";
    exit(1);
}

echo "📋 Token atual:\n";
echo "   " . ($gw->arkama_api_token ? substr($gw->arkama_api_token, 0, 30) . '... (tamanho: ' . strlen($gw->arkama_api_token) . ')' : 'VAZIO') . "\n\n";

echo "📝 Atualizando para novo token...\n";
$gw->arkama_api_token = $novoToken;
$gw->save();

echo "✅ Token atualizado com sucesso!\n";
echo "   Novo token: " . substr($novoToken, 0, 30) . '... (tamanho: ' . strlen($novoToken) . ')' . "\n\n";

// Testar imediatamente
echo "🧪 TESTANDO NOVO TOKEN...\n";
echo "==========================\n\n";

$uri = rtrim($gw->arkama_uri ?? 'https://app.arkama.com.br/api/v1', '/');
$url = $uri . '/orders';

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

$response = \Illuminate\Support\Facades\Http::withHeaders([
    'Content-Type' => 'application/json',
    'Authorization' => 'Bearer ' . $novoToken,
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
    if ($data && isset($data['id'])) {
        echo "✅ SUCESSO! Pedido criado com sucesso!\n\n";
        echo "📋 Dados do pedido:\n";
        echo json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) . "\n";
        echo "\n🎉 TOKEN FUNCIONANDO CORRETAMENTE!\n";
    } else {
        echo "⚠️  Status OK mas resposta inesperada:\n";
        echo $body . "\n";
    }
} else if ($status === 401) {
    $errorData = $response->json();
    echo "❌ Ainda não autenticado: " . ($errorData['message'] ?? 'Token inválido') . "\n";
    echo "\n💡 Verifique:\n";
    echo "1. Se o token foi copiado corretamente\n";
    echo "2. Se o token tem permissões para criar pedidos\n";
    echo "3. Se há espaços extras no token\n";
} else {
    $errorData = $response->json();
    echo "⚠️  Erro {$status}:\n";
    echo json_encode($errorData, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) . "\n";
}

