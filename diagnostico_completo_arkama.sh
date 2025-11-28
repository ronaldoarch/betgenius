#!/bin/bash

echo "🔍 DIAGNÓSTICO COMPLETO ARKAMA"
echo "================================"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando sintaxe PHP..."
echo ""

php -l app/Traits/Gateways/ArkamaTrait.php
php -l app/Http/Controllers/Api/Wallet/DepositController.php
php -l app/Filament/Pages/GatewayPage.php

echo ""
echo "2️⃣ Verificando configuração no banco..."
echo ""

php artisan tinker --execute="
\$gw = \App\Models\Gateway::first();
if (\$gw) {
    echo 'Arkama Ativo: ' . (\$gw->arkama_ativo ? 'SIM ✅' : 'NÃO ❌') . PHP_EOL;
    echo 'Arkama URI: ' . (\$gw->arkama_uri ?? 'NÃO CONFIGURADO ❌') . PHP_EOL;
    echo 'Arkama Token: ' . (empty(\$gw->arkama_api_token) ? 'NÃO CONFIGURADO ❌' : 'CONFIGURADO ✅') . PHP_EOL;
    echo 'Token (primeiros 20 chars): ' . substr(\$gw->arkama_api_token ?? '', 0, 20) . '...' . PHP_EOL;
} else {
    echo '❌ Nenhum gateway encontrado!' . PHP_EOL;
}
"

echo ""
echo "3️⃣ Verificando se métodos existem no DepositController..."
echo ""

if grep -q "requestQrcodeArkama" app/Http/Controllers/Api/Wallet/DepositController.php; then
    echo "✅ Método requestQrcodeArkama existe no DepositController"
else
    echo "❌ Método requestQrcodeArkama NÃO existe no DepositController"
fi

if grep -q "arkamaWebhook" app/Http/Controllers/Api/Wallet/DepositController.php; then
    echo "✅ Método arkamaWebhook existe no DepositController"
else
    echo "❌ Método arkamaWebhook NÃO existe no DepositController"
fi

echo ""
echo "4️⃣ Verificando rotas..."
echo ""

php artisan route:list | grep -i arkama || echo "⚠️  Nenhuma rota Arkama encontrada"

echo ""
echo "5️⃣ Últimos erros do log (últimas 30 linhas com 'error' ou 'exception')..."
echo ""

tail -n 500 storage/logs/laravel.log | grep -i "error\|exception" | tail -n 30

echo ""
echo "================================"
echo "✅ DIAGNÓSTICO CONCLUÍDO!"

