#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "🔍 VERIFICAÇÃO RÁPIDA"
echo "====================="
echo ""

# 1. Verificar se middleware foi atualizado
echo "1️⃣ Middleware atualizado?"
if grep -q "Log::info.*JWTMiddleware.*Verificando" app/Http/Middleware/JwtMiddleWare.php 2>/dev/null; then
    echo "   ✅ SIM"
else
    echo "   ❌ NÃO - Faça upload do arquivo JwtMiddleWare.php"
    exit 1
fi
echo ""

# 2. Verificar se DepositController foi atualizado
echo "2️⃣ DepositController atualizado?"
if grep -q "Classe instanciada" app/Http/Controllers/Api/Wallet/DepositController.php 2>/dev/null; then
    echo "   ✅ SIM"
else
    echo "   ❌ NÃO - Faça upload do arquivo DepositController.php"
    exit 1
fi
echo ""

# 3. Limpar caches
echo "3️⃣ Limpando caches..."
php artisan config:clear > /dev/null 2>&1
php artisan cache:clear > /dev/null 2>&1
php artisan route:clear > /dev/null 2>&1
php artisan view:clear > /dev/null 2>&1
php artisan optimize:clear > /dev/null 2>&1
echo "   ✅ Caches limpos"
echo ""

# 4. Forçar purge LiteSpeed
echo "4️⃣ Purge LiteSpeed..."
echo "Purge: *" > public/.litespeed_purge
killall -9 lsphp 2>/dev/null || true
echo "   ✅ LiteSpeed purgado"
echo ""

# 5. Testar requisição direta
echo "5️⃣ Testando requisição (sem token - deve retornar 401)..."
RESPONSE=$(curl -X POST http://localhost/api/carteira_wallet/deposit/payment \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{"amount":30,"cpf":"70206292295"}' \
  -w "\n%{http_code}" \
  -s 2>&1)

HTTP_CODE=$(echo "$RESPONSE" | tail -1)
BODY=$(echo "$RESPONSE" | head -n -1)

echo "   HTTP Status: $HTTP_CODE"
echo "   Response: $BODY"
echo ""

# 6. Verificar logs
echo "6️⃣ Verificando logs..."
if tail -20 storage/logs/laravel.log 2>/dev/null | grep -q "JWTMiddleware\|DepositController"; then
    echo "   ✅ Logs encontrados!"
    echo "   Últimas linhas relevantes:"
    tail -20 storage/logs/laravel.log | grep -i "JWTMiddleware\|DepositController" | tail -5
else
    echo "   ❌ Nenhum log encontrado"
    echo "   Últimas 5 linhas do log:"
    tail -5 storage/logs/laravel.log 2>/dev/null
fi
echo ""

echo "✅ VERIFICAÇÃO COMPLETA!"
echo ""
echo "📝 INTERPRETAÇÃO:"
if [ "$HTTP_CODE" = "401" ]; then
    echo "   ✅ Requisição chegou no Laravel (middleware bloqueou)"
    echo "   ⚠️  Se não apareceu log, verifique permissões do arquivo de log"
elif [ "$HTTP_CODE" = "500" ]; then
    echo "   ⚠️  Erro 500 - Verifique logs do servidor web"
elif [ "$HTTP_CODE" = "404" ]; then
    echo "   ❌ Rota não encontrada - Verifique routes/api.php"
else
    echo "   ⚠️  Status inesperado: $HTTP_CODE"
fi
