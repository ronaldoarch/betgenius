#!/bin/bash

echo "🧹 LIMPANDO CACHE PARA ARKAMA"
echo "=============================="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Limpando cache do Laravel..."
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
php artisan optimize:clear

echo ""
echo "2️⃣ Reiniciando PHP (LiteSpeed)..."
killall -9 lsphp 2>/dev/null || echo "⚠️  lsphp não encontrado (pode ser normal)"

echo ""
echo "3️⃣ Verificando se Arkama está ativo no banco..."
php artisan tinker --execute="
\$gw = \App\Models\Gateway::first();
if (\$gw) {
    echo 'Arkama Ativo: ' . (\$gw->arkama_ativo ? 'SIM ✅' : 'NÃO ❌') . PHP_EOL;
    echo 'Arkama URI: ' . (\$gw->arkama_uri ?? 'NÃO CONFIGURADO') . PHP_EOL;
    echo 'Arkama Token: ' . (empty(\$gw->arkama_api_token) ? 'NÃO CONFIGURADO ❌' : 'CONFIGURADO ✅') . PHP_EOL;
} else {
    echo '❌ Nenhum gateway encontrado!' . PHP_EOL;
}
"

echo ""
echo "✅ CACHE LIMPO COM SUCESSO!"
echo ""
echo "🎯 PRÓXIMOS PASSOS:"
echo "   1. Acesse: https://betgeniusbr.com/profile/deposit"
echo "   2. Tente fazer um depósito de teste"
echo "   3. Verifique se o QR Code aparece"
echo ""

