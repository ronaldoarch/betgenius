#!/bin/bash

echo "🔍 DEBUG COMPLETO - ARKAMA"
echo "=========================="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Testando API e mostrando resposta COMPLETA:"
php artisan tinker --execute="
\$gw = \App\Models\Gateway::first();
\$uri = \$gw->arkama_uri;
\$token = \$gw->arkama_api_token;

\$payload = [
    'amount' => 10.00,
    'customer' => [
        'name' => 'Teste',
        'email' => 'teste@teste.com',
        'document' => '12345678900',
    ],
    'external_id' => 'TEST-' . time(),
    'notification_url' => 'https://betgeniusbr.com/api/arkama/webhook',
];

\$response = \Illuminate\Support\Facades\Http::withHeaders([
    'Content-Type' => 'application/json',
    'Authorization' => 'Bearer ' . \$token,
])->timeout(30)->post(\$uri . '/orders', \$payload);

echo 'Status: ' . \$response->status() . PHP_EOL;
echo 'Body completo (raw):' . PHP_EOL;
echo \$response->body() . PHP_EOL;
echo PHP_EOL;
echo 'JSON decodificado:' . PHP_EOL;
\$data = \$response->json();
var_dump(\$data);
echo PHP_EOL;
echo 'Campos disponíveis:' . PHP_EOL;
if (\$data) {
    foreach (array_keys(\$data) as \$key) {
        echo '  - ' . \$key . PHP_EOL;
    }
} else {
    echo '  (resposta vazia ou inválida)' . PHP_EOL;
}
"
echo ""

echo "2️⃣ Verificando logs recentes de erro:"
tail -100 storage/logs/laravel.log | grep -i "arkama\|error\|exception" | tail -20
echo ""

echo "3️⃣ Limpando logs antigos e preparando monitoramento:"
echo "   Execute em OUTRO terminal:"
echo "   tail -f storage/logs/laravel.log | grep -i arkama --line-buffered"
echo ""

echo "✅ Agora tente fazer um depósito e me mostre os logs!"

