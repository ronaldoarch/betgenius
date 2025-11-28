#!/bin/bash

echo "🔍 VERIFICANDO DepositController NO SERVIDOR"
echo "============================================="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando se tem auto-detecção:"
if grep -q "Auto-detectar gateway" app/Http/Controllers/Api/Wallet/DepositController.php; then
    echo "✅ Auto-detecção encontrada"
else
    echo "❌ Auto-detecção NÃO encontrada"
fi
echo ""

echo "2️⃣ Verificando se tem case 'arkama':"
if grep -q "case 'arkama':" app/Http/Controllers/Api/Wallet/DepositController.php; then
    echo "✅ Case 'arkama' encontrado"
    grep -n "case 'arkama'" app/Http/Controllers/Api/Wallet/DepositController.php
else
    echo "❌ Case 'arkama' NÃO encontrado"
fi
echo ""

echo "3️⃣ Verificando se tem default case:"
if grep -q "default:" app/Http/Controllers/Api/Wallet/DepositController.php; then
    echo "✅ Default case encontrado"
    grep -A 2 "default:" app/Http/Controllers/Api/Wallet/DepositController.php | head -3
else
    echo "❌ Default case NÃO encontrado"
fi
echo ""

echo "4️⃣ Verificando se tem ArkamaTrait:"
if grep -q "ArkamaTrait" app/Http/Controllers/Api/Wallet/DepositController.php; then
    echo "✅ ArkamaTrait encontrado"
    grep -n "ArkamaTrait" app/Http/Controllers/Api/Wallet/DepositController.php | head -2
else
    echo "❌ ArkamaTrait NÃO encontrado"
fi
echo ""

echo "5️⃣ Verificando método submitPayment:"
grep -A 40 "public function submitPayment" app/Http/Controllers/Api/Wallet/DepositController.php | head -45
echo ""

echo "✅ Verificação completa!"

