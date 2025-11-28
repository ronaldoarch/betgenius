#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "🔍 VERIFICANDO LOGS DO MIDDLEWARE"
echo "=================================="
echo ""

# 1. Limpar logs antigos (opcional, só para facilitar)
echo "1️⃣ Últimas 30 linhas do log (antes do teste)..."
tail -30 storage/logs/laravel.log | tail -10
echo ""

# 2. Fazer requisição e verificar logs IMEDIATAMENTE
echo "2️⃣ Fazendo requisição e verificando logs..."
curl -X POST https://betgeniusbr.com/api/carteira_wallet/deposit/payment \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{"amount":30,"cpf":"70206292295"}' \
  -s > /dev/null 2>&1

sleep 1

echo "   Últimas 10 linhas do log (após requisição):"
tail -10 storage/logs/laravel.log | grep -i "JWTMiddleware\|DepositController\|TESTE" || echo "   ⚠️  Nenhum log encontrado"
echo ""

# 3. Verificar se o middleware tem os logs
echo "3️⃣ Verificando se o middleware tem os logs adicionados..."
if grep -q "Log::info.*JWTMiddleware.*Verificando" app/Http/Middleware/JwtMiddleWare.php; then
    echo "   ✅ Middleware tem logs adicionados"
else
    echo "   ❌ Middleware NÃO tem logs adicionados!"
    echo "   Faça upload do arquivo JwtMiddleWare.php atualizado"
fi
echo ""

# 4. Verificar permissões do log
echo "4️⃣ Verificando permissões do log..."
ls -la storage/logs/laravel.log
echo ""

# 5. Tentar escrever diretamente no log
echo "5️⃣ Testando escrita direta no log..."
php -r "
file_put_contents('storage/logs/laravel.log', '[' . date('Y-m-d H:i:s') . '] TESTE_DIRETO: Escrita OK' . PHP_EOL, FILE_APPEND);
echo '✅ Escrita OK' . PHP_EOL;
" 2>&1

tail -1 storage/logs/laravel.log
echo ""

echo "✅ VERIFICAÇÃO COMPLETA!"
echo ""
echo "📝 INTERPRETAÇÃO:"
echo "   - Se apareceu log do JWTMiddleware: ✅ Logs funcionando"
echo "   - Se NÃO apareceu log: ⚠️  Verifique se o middleware foi atualizado"
echo "   - Se apareceu TESTE_DIRETO: ✅ Permissões OK"
