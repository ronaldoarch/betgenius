#!/bin/bash

echo "🧪 TESTANDO API ARKAMA DIRETAMENTE"
echo "==================================="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

php artisan tinker --execute="
\$gw = \App\Models\Gateway::first();
\$uri = \$gw->arkama_uri ?? 'https://app.arkama.com.br/api/v1';
\$token = \$gw->arkama_api_token ?? '';

echo '🔍 Testando API Arkama...' . PHP_EOL;
echo 'URI: ' . \$uri . PHP_EOL;
echo 'Token: ' . substr(\$token, 0, 20) . '...' . PHP_EOL;
echo PHP_EOL;

// Testar endpoint de criação de pedido
\$payload = [
    'amount' => 10.00,
    'customer' => [
        'name' => 'Teste Cliente',
        'email' => 'teste@teste.com',
        'document' => '12345678900',
    ],
    'external_id' => 'TEST-' . time(),
    'notification_url' => 'https://betgeniusbr.com/api/arkama/webhook',
];

echo '📤 Enviando requisição para: ' . \$uri . '/orders' . PHP_EOL;
echo 'Payload: ' . json_encode(\$payload, JSON_PRETTY_PRINT) . PHP_EOL;
echo PHP_EOL;

\$response = \Illuminate\Support\Facades\Http::withHeaders([
    'Content-Type' => 'application/json',
    'Authorization' => 'Bearer ' . \$token,
    'User-Agent' => 'BetGenius/1.0',
])->timeout(30)->post(\$uri . '/orders', \$payload);

echo '📥 Resposta:' . PHP_EOL;
echo 'Status: ' . \$response->status() . PHP_EOL;
echo 'Body: ' . \$response->body() . PHP_EOL;
echo PHP_EOL;

if (\$response->successful()) {
    echo '✅ API respondeu com sucesso!' . PHP_EOL;
    \$data = \$response->json();
    if (isset(\$data['pix_qrcode'])) {
        echo '✅ QR Code recebido!' . PHP_EOL;
    } else {
        echo '⚠️  QR Code não encontrado na resposta' . PHP_EOL;
        echo 'Campos disponíveis: ' . implode(', ', array_keys(\$data ?? [])) . PHP_EOL;
    }
} else {
    echo '❌ Erro na API!' . PHP_EOL;
    echo 'Status: ' . \$response->status() . PHP_EOL;
    echo 'Erro: ' . \$response->body() . PHP_EOL;
}
"

