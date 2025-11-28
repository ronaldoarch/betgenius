#!/bin/bash

echo "🧪 TESTANDO API ARKAMA COMPLETO"
echo "==============================="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

php artisan tinker --execute="
\$gw = \App\Models\Gateway::first();
\$uri = \$gw->arkama_uri ?? 'https://app.arkama.com.br/api/v1';
\$token = \$gw->arkama_api_token ?? '';

echo '🔍 Configuração:' . PHP_EOL;
echo 'URI: ' . \$uri . PHP_EOL;
echo 'Token: ' . (empty(\$token) ? 'VAZIO ❌' : substr(\$token, 0, 20) . '... ✅') . PHP_EOL;
echo PHP_EOL;

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
echo 'Headers: ' . json_encode(\$response->headers(), JSON_PRETTY_PRINT) . PHP_EOL;
echo 'Body completo:' . PHP_EOL;
echo \$response->body() . PHP_EOL;
echo PHP_EOL;

if (\$response->successful()) {
    \$data = \$response->json();
    echo '✅ API respondeu com sucesso!' . PHP_EOL;
    echo PHP_EOL;
    echo '📋 Estrutura completa da resposta:' . PHP_EOL;
    print_r(\$data);
    echo PHP_EOL;
    echo '🔍 Campos esperados:' . PHP_EOL;
    echo '  - id: ' . (isset(\$data['id']) ? '✅ Encontrado: ' . \$data['id'] : '❌ NÃO encontrado') . PHP_EOL;
    echo '  - pix_qrcode: ' . (isset(\$data['pix_qrcode']) ? '✅ Encontrado' : '❌ NÃO encontrado') . PHP_EOL;
    echo '  - pix_code: ' . (isset(\$data['pix_code']) ? '✅ Encontrado' : '❌ NÃO encontrado') . PHP_EOL;
    echo PHP_EOL;
    echo '🔍 Todos os campos disponíveis:' . PHP_EOL;
    foreach (array_keys(\$data ?? []) as \$key) {
        echo '  - ' . \$key . PHP_EOL;
    }
} else {
    echo '❌ Erro na API!' . PHP_EOL;
    echo 'Status: ' . \$response->status() . PHP_EOL;
    \$error = \$response->json();
    if (\$error) {
        echo 'Erro detalhado:' . PHP_EOL;
        print_r(\$error);
    } else {
        echo 'Body: ' . \$response->body() . PHP_EOL;
    }
}
"

