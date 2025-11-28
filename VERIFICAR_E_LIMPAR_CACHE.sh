#!/bin/bash

echo "✅ VERIFICANDO E LIMPANDO CACHE"
echo "================================"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando se tem auto-detecção:"
if grep -q "Auto-detectar gateway" app/Http/Controllers/Api/Wallet/DepositController.php; then
    echo "✅ Auto-detecção encontrada"
else
    echo "❌ Auto-detecção NÃO encontrada"
fi
echo ""

echo "2️⃣ Verificando se tem default case:"
if grep -q "default:" app/Http/Controllers/Api/Wallet/DepositController.php; then
    echo "✅ Default case encontrado"
    grep -n "default:" app/Http/Controllers/Api/Wallet/DepositController.php
else
    echo "❌ Default case NÃO encontrado"
fi
echo ""

echo "3️⃣ Verificando se tem logs:"
if grep -q "Log::info.*DepositController.*submitPayment" app/Http/Controllers/Api/Wallet/DepositController.php; then
    echo "✅ Logs encontrados"
else
    echo "❌ Logs NÃO encontrados"
fi
echo ""

echo "4️⃣ Limpando cache:"
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
echo "✅ Cache limpo"
echo ""

echo "5️⃣ Verificando sintaxe:"
php -l app/Http/Controllers/Api/Wallet/DepositController.php
php -l app/Traits/Gateways/ArkamaTrait.php
echo ""

echo "6️⃣ Verificando gateway ativo:"
php artisan tinker --execute="
\$gw = \App\Models\Gateway::first();
echo 'Arkama ativo: ' . (\$gw->arkama_ativo ?? 0) . PHP_EOL;
echo 'Token: ' . (empty(\$gw->arkama_api_token) ? 'VAZIO ❌' : 'OK ✅') . PHP_EOL;
echo 'URI: ' . (\$gw->arkama_uri ?? 'VAZIO') . PHP_EOL;
"
echo ""

echo "📝 PRÓXIMOS PASSOS:"
echo "1. Tente fazer um depósito no site"
echo "2. Execute em outro terminal para monitorar logs:"
echo "   tail -f storage/logs/laravel.log | grep -i 'DepositController\|Arkama'"
echo ""

