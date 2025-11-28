#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "🔍 TESTANDO MIDDLEWARE auth.jwt"
echo "================================"
echo ""

# 1. Verificar se o middleware está registrado
echo "1️⃣ Verificando middleware..."
php artisan tinker --execute="
\$middleware = app('router')->getMiddleware();
if (isset(\$middleware['auth.jwt'])) {
    echo '✅ Middleware auth.jwt registrado: ' . \$middleware['auth.jwt'] . PHP_EOL;
} else {
    echo '❌ Middleware auth.jwt NÃO registrado!' . PHP_EOL;
    foreach (\$middleware as \$key => \$value) {
        if (strpos(\$key, 'jwt') !== false || strpos(\$key, 'auth') !== false) {
            echo '   Encontrado: ' . \$key . ' => ' . \$value . PHP_EOL;
        }
    }
}
" 2>&1
echo ""

# 2. Verificar a rota e seus middlewares
echo "2️⃣ Verificando rota e middlewares..."
php artisan route:list | grep -i "deposit/payment" | head -3
echo ""

# 3. Testar requisição sem token (deve retornar 401)
echo "3️⃣ Testando requisição SEM token..."
curl -X POST http://localhost/api/carteira_wallet/deposit/payment \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{"amount":30,"cpf":"70206292295"}' \
  -w "\nHTTP Status: %{http_code}\n" \
  2>&1 | tail -5
echo ""

# 4. Verificar logs recentes
echo "4️⃣ Últimas 10 linhas do log..."
tail -10 storage/logs/laravel.log 2>/dev/null | grep -i "middleware\|auth\|jwt\|error\|exception" || echo "   Nenhum log relacionado encontrado"
echo ""

echo "✅ TESTE COMPLETO!"
echo ""
echo "📝 INTERPRETAÇÃO:"
echo "   - Se retornou 401: Middleware está funcionando (bloqueou sem token)"
echo "   - Se retornou 500: Pode haver erro no middleware"
echo "   - Se retornou 404: Rota não encontrada"
echo "   - Se não apareceu log do DepositController: Middleware bloqueou antes do controller"
