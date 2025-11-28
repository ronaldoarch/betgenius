#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "🔍 TESTANDO ROTA DIRETAMENTE"
echo "============================="
echo ""

# 1. Verificar se a rota está registrada
echo "1️⃣ Listando todas as rotas de deposit/payment..."
php artisan route:list 2>&1 | grep -E "deposit|payment" | grep -i "carteira\|wallet" | head -5
echo ""

# 2. Testar usando o caminho completo do Laravel
echo "2️⃣ Testando usando PHP diretamente..."
php -r "
require __DIR__ . '/vendor/autoload.php';
\$app = require_once __DIR__ . '/bootstrap/app.php';
\$kernel = \$app->make('Illuminate\Contracts\Console\Kernel');
\$kernel->bootstrap();

\$request = \Illuminate\Http\Request::create('/api/carteira_wallet/deposit/payment', 'POST', [
    'amount' => 30,
    'cpf' => '70206292295'
], [], [], [
    'HTTP_ACCEPT' => 'application/json',
    'CONTENT_TYPE' => 'application/json',
]);

try {
    \$route = \Illuminate\Support\Facades\Route::getRoutes()->match(\$request);
    echo '✅ Rota encontrada: ' . \$route->uri() . PHP_EOL;
    echo '   Controller: ' . \$route->getActionName() . PHP_EOL;
} catch (\Exception \$e) {
    echo '❌ Rota NÃO encontrada: ' . \$e->getMessage() . PHP_EOL;
}
" 2>&1
echo ""

# 3. Verificar se o arquivo de rotas está sendo carregado
echo "3️⃣ Verificando se o arquivo de rotas existe e está correto..."
if [ -f "routes/groups/api/wallet/deposit.php" ]; then
    echo "   ✅ Arquivo existe"
    echo "   Conteúdo:"
    cat routes/groups/api/wallet/deposit.php
else
    echo "   ❌ Arquivo NÃO existe!"
fi
echo ""

# 4. Verificar se está dentro do grupo auth.jwt
echo "4️⃣ Verificando estrutura no api.php..."
grep -B 10 -A 10 "carteira_wallet" routes/api.php | head -20
echo ""

echo "✅ TESTE COMPLETO!"
