#!/bin/bash

echo "🔍 VERIFICANDO E MONITORANDO ARKAMA"
echo "===================================="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando se ArkamaTrait tem as correções:"
if grep -q "pix\['payload'\]" app/Traits/Gateways/ArkamaTrait.php; then
    echo "✅ ArkamaTrait TEM a correção do pix.payload"
else
    echo "❌ ArkamaTrait NÃO TEM a correção (precisa fazer upload!)"
fi
echo ""

echo "2️⃣ Verificando se tem shipping.address:"
if grep -q "shipping.*address" app/Traits/Gateways/ArkamaTrait.php; then
    echo "✅ Tem shipping.address"
else
    echo "❌ NÃO tem shipping.address (precisa fazer upload!)"
fi
echo ""

echo "3️⃣ Verificando se tem items[].title:"
if grep -q "'title'" app/Traits/Gateways/ArkamaTrait.php; then
    echo "✅ Tem items[].title"
else
    echo "❌ NÃO tem items[].title (precisa fazer upload!)"
fi
echo ""

echo "4️⃣ Limpando cache:"
php artisan config:clear
php artisan cache:clear
php artisan route:clear
echo "✅ Cache limpo"
echo ""

echo "5️⃣ Monitorando logs (pressione Ctrl+C para parar):"
echo "   Tente fazer um depósito agora e veja os logs aparecerem..."
echo ""

tail -f storage/logs/laravel.log | grep -i "arkama\|error\|exception" --line-buffered

