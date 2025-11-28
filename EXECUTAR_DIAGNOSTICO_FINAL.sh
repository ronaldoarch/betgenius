#!/bin/bash

echo "🔍 DIAGNÓSTICO FINAL ARKAMA"
echo "============================"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando sintaxe PHP..."
php -l app/Traits/Gateways/ArkamaTrait.php && echo "✅ ArkamaTrait OK" || echo "❌ ERRO no ArkamaTrait"
php -l app/Http/Controllers/Api/Wallet/DepositController.php && echo "✅ DepositController OK" || echo "❌ ERRO no DepositController"

echo ""
echo "2️⃣ Verificando configuração..."
php artisan tinker --execute="
\$gw = \App\Models\Gateway::first();
echo 'Arkama Ativo: ' . (\$gw->arkama_ativo ?? 0) . PHP_EOL;
echo 'Arkama URI: ' . (\$gw->arkama_uri ?? 'VAZIO') . PHP_EOL;
echo 'Arkama Token: ' . (empty(\$gw->arkama_api_token) ? 'VAZIO ❌' : 'OK ✅') . PHP_EOL;
"

echo ""
echo "3️⃣ Verificando métodos no controller..."
grep -q "requestQrcodeArkama\|arkamaWebhook" app/Http/Controllers/Api/Wallet/DepositController.php && echo "✅ Métodos Arkama encontrados" || echo "❌ Métodos NÃO encontrados"

echo ""
echo "4️⃣ Verificando rotas..."
php artisan route:list | grep arkama || echo "⚠️  Rotas não encontradas (pode ser cache)"

echo ""
echo "5️⃣ Limpando cache..."
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
killall -9 lsphp 2>/dev/null
echo "✅ Cache limpo!"

echo ""
echo "6️⃣ Verificando rotas novamente (após limpar cache)..."
php artisan route:list | grep arkama || echo "❌ Rotas ainda não aparecem"

echo ""
echo "============================"
echo "✅ DIAGNÓSTICO CONCLUÍDO!"
echo ""
echo "📋 Se houver erros acima, me mostre a saída completa!"

