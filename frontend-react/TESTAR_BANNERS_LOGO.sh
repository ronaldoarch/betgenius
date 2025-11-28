#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 TESTANDO APIs DE BANNERS E LOGO"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Testando /api/settings/banners:"
echo "───────────────────────────────────────────────────────────────"
RESPONSE_BANNERS=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/banners)
echo "$RESPONSE_BANNERS" | head -c 500
echo ""
echo ""

if [[ "$RESPONSE_BANNERS" == "{"* ]]; then
    echo "   ✅ Retornou JSON"
    # Verificar se tem banners
    BANNER_COUNT=$(echo "$RESPONSE_BANNERS" | grep -o '"banners"' | wc -l)
    if [ "$BANNER_COUNT" -gt 0 ]; then
        echo "   ✅ Estrutura de banners encontrada"
    else
        echo "   ⚠️  Estrutura de banners pode estar vazia"
    fi
else
    echo "   ❌ Não retornou JSON (pode ser HTML)"
fi

echo ""
echo "2️⃣ Testando /api/settings/data:"
echo "───────────────────────────────────────────────────────────────"
RESPONSE_SETTINGS=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/data)
echo "$RESPONSE_SETTINGS" | head -c 500
echo ""
echo ""

if [[ "$RESPONSE_SETTINGS" == "{"* ]]; then
    echo "   ✅ Retornou JSON"
    # Verificar se tem logo
    LOGO_COUNT=$(echo "$RESPONSE_SETTINGS" | grep -o 'software_logo' | wc -l)
    if [ "$LOGO_COUNT" -gt 0 ]; then
        echo "   ✅ Campo de logo encontrado"
    else
        echo "   ⚠️  Campo de logo não encontrado"
    fi
else
    echo "   ❌ Não retornou JSON (pode ser HTML)"
fi

echo ""
echo "3️⃣ Verificando rotas no Laravel:"
echo "───────────────────────────────────────────────────────────────"
php artisan route:list | grep -E "settings|banners" | head -10
echo ""

echo "═══════════════════════════════════════════════════════════════"

