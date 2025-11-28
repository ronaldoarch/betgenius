#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 VERIFICANDO URL DO ADMIN"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Verificando variável FILAMENT_BASE_URL no .env:"
echo "───────────────────────────────────────────────────────────────"
grep "FILAMENT_BASE_URL" .env 2>/dev/null || echo "   ⚠️  Variável não encontrada no .env"
echo ""

echo "2️⃣ Verificando configuração no AdminPanelProvider:"
echo "───────────────────────────────────────────────────────────────"
grep -A 2 "path(env" app/Providers/Filament/AdminPanelProvider.php | head -5
echo ""

echo "3️⃣ Testando URL /admin:"
echo "───────────────────────────────────────────────────────────────"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/admin)
echo "   HTTP Code: $HTTP_CODE"
if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ] || [ "$HTTP_CODE" = "301" ]; then
    echo "   ✅ /admin está acessível"
else
    echo "   ❌ /admin NÃO está acessível (HTTP $HTTP_CODE)"
fi
echo ""

echo "4️⃣ Testando URL /admin/login:"
echo "───────────────────────────────────────────────────────────────"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/admin/login)
echo "   HTTP Code: $HTTP_CODE"
if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ] || [ "$HTTP_CODE" = "301" ]; then
    echo "   ✅ /admin/login está acessível"
else
    echo "   ❌ /admin/login NÃO está acessível (HTTP $HTTP_CODE)"
fi
echo ""

echo "5️⃣ Verificando rotas do Filament:"
echo "───────────────────────────────────────────────────────────────"
php artisan route:list | grep -i "admin\|filament" | head -10
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "💡 O admin deveria estar em: https://betgeniusbr.com/admin"
echo "═══════════════════════════════════════════════════════════════"

