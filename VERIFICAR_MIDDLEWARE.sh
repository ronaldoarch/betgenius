#!/bin/bash

echo "🔍 VERIFICANDO MIDDLEWARE E ROTAS"
echo "=================================="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando rotas registradas:"
php artisan route:list | grep -i "deposit\|payment" | head -10
echo ""

echo "2️⃣ Verificando se a rota está correta:"
php artisan route:list | grep -i "carteira_wallet.*deposit.*payment"
echo ""

echo "3️⃣ Verificando middleware:"
php artisan route:list | grep -i "carteira_wallet" | head -5
echo ""

echo "4️⃣ Verificando se há erro no middleware JWT:"
grep -r "auth.jwt" app/Http/Kernel.php routes/api.php 2>/dev/null | head -5
echo ""

echo "5️⃣ Verificando logs de erro do Laravel (últimas 50 linhas):"
tail -50 storage/logs/laravel.log | grep -i "error\|exception" | tail -10
echo ""

echo "6️⃣ Verificando se há cache do LiteSpeed:"
if [ -f "public/.litespeed_purge" ]; then
    echo "✅ Arquivo .litespeed_purge existe"
    cat public/.litespeed_purge
else
    echo "⚠️  Arquivo .litespeed_purge não existe"
fi
echo ""

echo "7️⃣ Criando arquivo para forçar purge do LiteSpeed:"
echo "Purge: *" > public/.litespeed_purge
echo "✅ Arquivo criado"
echo ""

echo "📝 PRÓXIMOS PASSOS:"
echo "1. Verifique se a rota está registrada corretamente"
echo "2. Tente fazer depósito novamente"
echo "3. Verifique os logs em tempo real:"
echo "   tail -f storage/logs/laravel.log"

