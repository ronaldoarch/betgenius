#!/bin/bash

echo "🔍 VERIFICANDO E TESTANDO ARKAMA"
echo "================================="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando se ArkamaTrait tem as melhorias:"
if grep -q "Tentar diferentes formatos de QR Code" app/Traits/Gateways/ArkamaTrait.php; then
    echo "✅ ArkamaTrait TEM as melhorias"
else
    echo "❌ ArkamaTrait NÃO TEM as melhorias (precisa fazer upload!)"
fi
echo ""

echo "2️⃣ Verificando configuração:"
php artisan tinker --execute="
\$gw = \App\Models\Gateway::first();
echo 'URI: ' . (\$gw->arkama_uri ?? 'VAZIO') . PHP_EOL;
echo 'Token: ' . (empty(\$gw->arkama_api_token) ? 'VAZIO ❌' : 'OK ✅') . PHP_EOL;
echo 'Ativo: ' . (\$gw->arkama_ativo ?? 0) . PHP_EOL;
"
echo ""

echo "3️⃣ Testando API Arkama diretamente:"
php artisan tinker --execute="
\$gw = \App\Models\Gateway::first();
\$uri = \$gw->arkama_uri ?? 'https://app.arkama.com.br/api/v1';
\$token = \$gw->arkama_api_token ?? '';

if (empty(\$token)) {
    echo '❌ Token não configurado!' . PHP_EOL;
    exit;
}

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

echo '📤 Testando API...' . PHP_EOL;
\$response = \Illuminate\Support\Facades\Http::withHeaders([
    'Content-Type' => 'application/json',
    'Authorization' => 'Bearer ' . \$token,
])->timeout(30)->post(\$uri . '/orders', \$payload);

echo 'Status: ' . \$response->status() . PHP_EOL;
if (\$response->successful()) {
    \$data = \$response->json();
    echo '✅ Sucesso! Campos disponíveis:' . PHP_EOL;
    foreach (array_keys(\$data ?? []) as \$key) {
        echo '  - ' . \$key . PHP_EOL;
    }
    echo PHP_EOL;
    echo 'QR Code encontrado em:' . PHP_EOL;
    echo '  - pix_qrcode: ' . (isset(\$data['pix_qrcode']) ? '✅' : '❌') . PHP_EOL;
    echo '  - qrcode: ' . (isset(\$data['qrcode']) ? '✅' : '❌') . PHP_EOL;
    echo '  - pix.qrcode: ' . (isset(\$data['pix']['qrcode']) ? '✅' : '❌') . PHP_EOL;
} else {
    echo '❌ Erro: ' . \$response->status() . PHP_EOL;
    echo 'Body: ' . \$response->body() . PHP_EOL;
}
"
echo ""

echo "✅ Verificação completa!"

