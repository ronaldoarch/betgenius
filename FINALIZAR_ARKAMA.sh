#!/bin/bash

echo "🚀 FINALIZAÇÃO ARKAMA"
echo "====================="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando sintaxe do arquivo..."
php -l routes/groups/gateways/arkama.php

echo ""
echo "2️⃣ Verificando se o método existe no DepositController..."
if grep -q "arkamaWebhook" app/Http/Controllers/Api/Wallet/DepositController.php; then
    echo "✅ Método encontrado no DepositController"
    grep -n "arkamaWebhook" app/Http/Controllers/Api/Wallet/DepositController.php | head -3
else
    echo "❌ Método NÃO encontrado - está no trait?"
    if grep -q "ArkamaTrait" app/Http/Controllers/Api/Wallet/DepositController.php; then
        echo "✅ ArkamaTrait está sendo usado"
    else
        echo "❌ ArkamaTrait NÃO está sendo usado!"
    fi
fi

echo ""
echo "3️⃣ Limpando TODOS os caches..."
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
php artisan optimize:clear
php artisan config:cache 2>/dev/null || true
php artisan route:cache 2>/dev/null || true

# Reiniciar PHP
killall -9 lsphp 2>/dev/null || echo "⚠️  lsphp não encontrado"

echo "✅ Cache limpo!"

echo ""
echo "4️⃣ Verificando rotas..."
php artisan route:list | grep -i arkama

if [ $? -ne 0 ]; then
    echo ""
    echo "⚠️  Rotas ainda não aparecem. Verificando se há erros..."
    php artisan route:list 2>&1 | grep -i "error\|exception" | head -5
fi

echo ""
echo "5️⃣ Verificando configuração final..."
php artisan tinker --execute="
\$gw = \App\Models\Gateway::first();
echo 'Arkama Ativo: ' . (\$gw->arkama_ativo ? 'SIM ✅' : 'NÃO ❌') . PHP_EOL;
echo 'Arkama URI: ' . (\$gw->arkama_uri ?? 'VAZIO') . PHP_EOL;
echo 'Arkama Token: ' . (empty(\$gw->arkama_api_token) ? 'VAZIO ❌' : 'OK ✅') . PHP_EOL;
"

echo ""
echo "============================"
echo "✅ FINALIZAÇÃO CONCLUÍDA!"
echo ""
echo "📋 Se as rotas ainda não aparecem, pode ser que o método precise estar"
echo "   diretamente no DepositController, não apenas no trait."

