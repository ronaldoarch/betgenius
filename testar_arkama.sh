#!/bin/bash

echo "🧪 TESTE DE INTEGRAÇÃO ARKAMA"
echo "=============================="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando arquivos..."
echo ""

# Verificar ArkamaTrait
if [ -f "app/Traits/Gateways/ArkamaTrait.php" ]; then
    echo "✅ ArkamaTrait.php existe"
else
    echo "❌ ArkamaTrait.php NÃO EXISTE"
fi

# Verificar DepositController
if grep -q "ArkamaTrait" app/Http/Controllers/Api/Wallet/DepositController.php; then
    echo "✅ DepositController tem ArkamaTrait"
else
    echo "❌ DepositController NÃO TEM ArkamaTrait"
fi

if grep -q "case 'arkama':" app/Http/Controllers/Api/Wallet/DepositController.php; then
    echo "✅ DepositController tem case 'arkama'"
else
    echo "❌ DepositController NÃO TEM case 'arkama'"
fi

# Verificar GatewayPage
if grep -q "arkama_api_token" app/Filament/Pages/GatewayPage.php; then
    echo "✅ GatewayPage tem campos Arkama"
else
    echo "❌ GatewayPage NÃO TEM campos Arkama"
fi

# Verificar rotas
if grep -q "arkama/webhook" routes/api.php; then
    echo "✅ Rotas Arkama existem"
else
    echo "❌ Rotas Arkama NÃO EXISTEM"
fi

echo ""
echo "2️⃣ Verificando configuração no banco..."
php artisan tinker --execute="
\$gw = \App\Models\Gateway::first();
if (\$gw) {
    echo 'Gateway ID: ' . \$gw->id . PHP_EOL;
    echo 'Arkama Ativo: ' . (\$gw->arkama_ativo ? 'SIM ✅' : 'NÃO ❌') . PHP_EOL;
    echo 'Arkama URI: ' . (\$gw->arkama_uri ?? 'NÃO CONFIGURADO') . PHP_EOL;
    echo 'Arkama Token: ' . (empty(\$gw->arkama_api_token) ? 'NÃO CONFIGURADO ❌' : 'CONFIGURADO ✅ (' . substr(\$gw->arkama_api_token, 0, 10) . '...)') . PHP_EOL;
    echo 'Cartwavehub Ativo: ' . (\$gw->cartwavehub_ativo ?? 0) . PHP_EOL;
    echo 'AgilizePay Ativo: ' . (\$gw->agilizepay_ativo ?? 0) . PHP_EOL;
    echo 'BsPay Ativo: ' . (\$gw->bspay_ativo ?? 0) . PHP_EOL;
} else {
    echo '❌ Nenhum gateway encontrado!' . PHP_EOL;
}
"

echo ""
echo "3️⃣ Verificando sintaxe PHP..."
php -l app/Traits/Gateways/ArkamaTrait.php
php -l app/Http/Controllers/Api/Wallet/DepositController.php
php -l app/Filament/Pages/GatewayPage.php

echo ""
echo "=============================="
echo "✅ TESTE CONCLUÍDO!"
echo ""
echo "📋 Se todos os itens estão ✅, o sistema está pronto!"
echo "   Agora teste fazendo um depósito no site."

