#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "🔍 DIAGNÓSTICO: Rota retornando 404"
echo "===================================="
echo ""

# 1. Verificar se a rota está registrada
echo "1️⃣ Verificando rotas registradas..."
php artisan route:list 2>&1 | grep -i "deposit\|payment" | head -10
echo ""

# 2. Verificar se a rota específica existe
echo "2️⃣ Procurando rota específica..."
php artisan route:list 2>&1 | grep -i "carteira_wallet.*deposit.*payment"
echo ""

# 3. Verificar arquivo de rotas
echo "3️⃣ Verificando arquivo de rotas..."
if [ -f "routes/groups/api/wallet/deposit.php" ]; then
    echo "   ✅ Arquivo existe"
    cat routes/groups/api/wallet/deposit.php
else
    echo "   ❌ Arquivo NÃO existe!"
fi
echo ""

# 4. Verificar se está incluído no api.php
echo "4️⃣ Verificando inclusão no api.php..."
grep -A 5 "carteira_wallet" routes/api.php | head -10
echo ""

# 5. Verificar .htaccess
echo "5️⃣ Verificando .htaccess..."
if [ -f "public/.htaccess" ]; then
    echo "   ✅ Arquivo existe"
    head -20 public/.htaccess
else
    echo "   ❌ Arquivo NÃO existe!"
fi
echo ""

# 6. Testar URL completa
echo "6️⃣ Testando URL completa..."
curl -X POST https://betgeniusbr.com/api/carteira_wallet/deposit/payment \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{"amount":30,"cpf":"70206292295"}' \
  -w "\nHTTP Status: %{http_code}\n" \
  -s 2>&1 | head -20
echo ""

echo "✅ DIAGNÓSTICO COMPLETO!"
