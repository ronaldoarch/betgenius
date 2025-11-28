#!/bin/bash

echo "🔍 DIAGNÓSTICO DO ERRO DE DEPÓSITO"
echo "==================================="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando se o método requestQrcodeArkama existe..."
if grep -q "requestQrcodeArkama" app/Http/Controllers/Api/Wallet/DepositController.php; then
    echo "✅ Método encontrado"
    grep -n "requestQrcodeArkama" app/Http/Controllers/Api/Wallet/DepositController.php
else
    echo "❌ Método NÃO encontrado!"
fi

echo ""
echo "2️⃣ Verificando auto-detecção do gateway..."
if grep -q "arkama_ativo" app/Http/Controllers/Api/Wallet/DepositController.php; then
    echo "✅ Auto-detecção encontrada"
    grep -A 5 "arkama_ativo" app/Http/Controllers/Api/Wallet/DepositController.php | head -10
else
    echo "❌ Auto-detecção NÃO encontrada!"
fi

echo ""
echo "3️⃣ Verificando se o case 'arkama' existe no switch..."
if grep -q "case 'arkama':" app/Http/Controllers/Api/Wallet/DepositController.php; then
    echo "✅ Case 'arkama' encontrado"
    grep -A 2 "case 'arkama':" app/Http/Controllers/Api/Wallet/DepositController.php
else
    echo "❌ Case 'arkama' NÃO encontrado!"
fi

echo ""
echo "4️⃣ Verificando configuração no banco..."
php artisan tinker --execute="
\$gw = \App\Models\Gateway::first();
if (\$gw) {
    echo 'Arkama Ativo: ' . (\$gw->arkama_ativo ? 'SIM ✅' : 'NÃO ❌') . PHP_EOL;
    echo 'Arkama URI: ' . (\$gw->arkama_uri ?? 'VAZIO') . PHP_EOL;
    echo 'Arkama Token: ' . (empty(\$gw->arkama_api_token) ? 'VAZIO ❌' : 'OK ✅') . PHP_EOL;
} else {
    echo '❌ Nenhum gateway encontrado!' . PHP_EOL;
}
"

echo ""
echo "5️⃣ Verificando últimos erros no log..."
tail -n 50 storage/logs/laravel.log | grep -i "arkama\|error\|exception" | tail -10

echo ""
echo "6️⃣ Verificando se o trait está sendo usado..."
if grep -q "use.*ArkamaTrait" app/Http/Controllers/Api/Wallet/DepositController.php; then
    echo "✅ ArkamaTrait está sendo usado"
    grep "ArkamaTrait" app/Http/Controllers/Api/Wallet/DepositController.php
else
    echo "❌ ArkamaTrait NÃO está sendo usado!"
fi

echo ""
echo "============================"
echo "✅ DIAGNÓSTICO CONCLUÍDO!"

