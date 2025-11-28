#!/bin/bash

echo "🧪 TESTE DETALHADO - API ARKAMA"
echo "==============================="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

php artisan tinker --execute="
\$gw = \App\Models\Gateway::first();
\$uri = \$gw->arkama_uri ?? 'https://app.arkama.com.br/api/v1';
\$token = \$gw->arkama_api_token ?? '';

echo '📋 CONFIGURAÇÃO:' . PHP_EOL;
echo 'URI: ' . \$uri . PHP_EOL;
echo 'Token: ' . (empty(\$token) ? 'VAZIO ❌' : substr(\$token, 0, 20) . '... ✅') . PHP_EOL;
echo PHP_EOL;

if (empty(\$token)) {
    echo '❌ Token não configurado!' . PHP_EOL;
    exit;
}

// Verificar se a URI termina com /api/v1
if (!preg_match('/\/api\/v1$/', \$uri)) {
    echo '⚠️  ATENÇÃO: URI pode estar incorreta!' . PHP_EOL;
    echo '   Esperado: https://app.arkama.com.br/api/v1' . PHP_EOL;
    echo '   Atual: ' . \$uri . PHP_EOL;
    echo PHP_EOL;
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

\$url = rtrim(\$uri, '/') . '/orders';

echo '📤 ENVIANDO REQUISIÇÃO:' . PHP_EOL;
echo 'URL: ' . \$url . PHP_EOL;
echo 'Method: POST' . PHP_EOL;
echo 'Headers:' . PHP_EOL;
echo '  Content-Type: application/json' . PHP_EOL;
echo '  Authorization: Bearer ' . substr(\$token, 0, 20) . '...' . PHP_EOL;
echo 'Payload: ' . json_encode(\$payload, JSON_PRETTY_PRINT) . PHP_EOL;
echo PHP_EOL;

\$response = \Illuminate\Support\Facades\Http::withHeaders([
    'Content-Type' => 'application/json',
    'Authorization' => 'Bearer ' . \$token,
    'User-Agent' => 'BetGenius/1.0',
])->timeout(30)->post(\$url, \$payload);

echo '📥 RESPOSTA:' . PHP_EOL;
echo 'Status Code: ' . \$response->status() . PHP_EOL;
echo 'Headers:' . PHP_EOL;
foreach (\$response->headers() as \$key => \$values) {
    echo '  ' . \$key . ': ' . implode(', ', \$values) . PHP_EOL;
}
echo PHP_EOL;

\$body = \$response->body();
echo 'Body (primeiros 500 caracteres):' . PHP_EOL;
echo substr(\$body, 0, 500) . PHP_EOL;
echo PHP_EOL;

if (\$response->successful()) {
    \$data = \$response->json();
    if (\$data) {
        echo '✅ JSON válido recebido!' . PHP_EOL;
        echo 'Campos na resposta:' . PHP_EOL;
        foreach (array_keys(\$data) as \$key) {
            echo '  - ' . \$key . PHP_EOL;
        }
        echo PHP_EOL;
        echo 'Resposta completa:' . PHP_EOL;
        echo json_encode(\$data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) . PHP_EOL;
    } else {
        echo '⚠️  Status 200 mas resposta não é JSON válido!' . PHP_EOL;
    }
} else {
    echo '❌ Erro na requisição!' . PHP_EOL;
    \$errorData = \$response->json();
    if (\$errorData) {
        echo 'Erro (JSON):' . PHP_EOL;
        echo json_encode(\$errorData, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) . PHP_EOL;
    } else {
        echo 'Erro (texto):' . PHP_EOL;
        echo \$body . PHP_EOL;
    }
}
"

