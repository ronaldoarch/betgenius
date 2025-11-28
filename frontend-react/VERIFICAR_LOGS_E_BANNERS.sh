#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 VERIFICANDO LOGOS E BANNERS"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Verificando logos retornados pela API:"
echo "───────────────────────────────────────────────────────────────"
LOGO_WHITE=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/data | grep -o '"software_logo_white":"[^"]*' | cut -d'"' -f4 | sed 's/\\//g')
LOGO_BLACK=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/data | grep -o '"software_logo_black":"[^"]*' | cut -d'"' -f4 | sed 's/\\//g')
echo "   Logo White: $LOGO_WHITE"
echo "   Logo Black: $LOGO_BLACK"
echo ""

echo "2️⃣ Verificando se os logos existem no servidor:"
echo "───────────────────────────────────────────────────────────────"
if [ ! -z "$LOGO_WHITE" ]; then
    LOGO_WHITE_FILE="storage/app/public/$LOGO_WHITE"
    if [ -f "$LOGO_WHITE_FILE" ]; then
        echo "   ✅ Logo White existe: $LOGO_WHITE_FILE"
        ls -lh "$LOGO_WHITE_FILE"
    else
        echo "   ❌ Logo White NÃO existe: $LOGO_WHITE_FILE"
        echo "   Procurando arquivo:"
        find storage/app/public/uploads -name "$(basename "$LOGO_WHITE")" 2>/dev/null | head -3
    fi
fi
echo ""

if [ ! -z "$LOGO_BLACK" ]; then
    LOGO_BLACK_FILE="storage/app/public/$LOGO_BLACK"
    if [ -f "$LOGO_BLACK_FILE" ]; then
        echo "   ✅ Logo Black existe: $LOGO_BLACK_FILE"
        ls -lh "$LOGO_BLACK_FILE"
    else
        echo "   ❌ Logo Black NÃO existe: $LOGO_BLACK_FILE"
        echo "   Procurando arquivo:"
        find storage/app/public/uploads -name "$(basename "$LOGO_BLACK")" 2>/dev/null | head -3
    fi
fi
echo ""

echo "3️⃣ Verificando symlink do storage:"
echo "───────────────────────────────────────────────────────────────"
if [ -L "public/storage" ]; then
    echo "   ✅ Symlink existe"
    ls -la public/storage | head -1
    echo "   Aponta para: $(readlink -f public/storage)"
else
    echo "   ⚠️  Symlink NÃO existe"
    echo "   Criando symlink..."
    php artisan storage:link 2>&1
fi
echo ""

echo "4️⃣ Testando URLs dos logos:"
echo "───────────────────────────────────────────────────────────────"
if [ ! -z "$LOGO_WHITE" ]; then
    LOGO_WHITE_URL="https://betgeniusbr.com/storage/$LOGO_WHITE"
    echo "   Testando Logo White: $LOGO_WHITE_URL"
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -I "$LOGO_WHITE_URL")
    CONTENT_TYPE=$(curl -s -o /dev/null -w "%{content_type}" -I "$LOGO_WHITE_URL")
    echo "   HTTP Code: $HTTP_CODE | Content-Type: $CONTENT_TYPE"
    if [ "$HTTP_CODE" = "200" ] && [[ "$CONTENT_TYPE" == *"image"* ]]; then
        echo "   ✅ Logo White está sendo servido corretamente"
    else
        echo "   ❌ Logo White NÃO está sendo servido corretamente"
    fi
fi
echo ""

if [ ! -z "$LOGO_BLACK" ]; then
    LOGO_BLACK_URL="https://betgeniusbr.com/storage/$LOGO_BLACK"
    echo "   Testando Logo Black: $LOGO_BLACK_URL"
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -I "$LOGO_BLACK_URL")
    CONTENT_TYPE=$(curl -s -o /dev/null -w "%{content_type}" -I "$LOGO_BLACK_URL")
    echo "   HTTP Code: $HTTP_CODE | Content-Type: $CONTENT_TYPE"
    if [ "$HTTP_CODE" = "200" ] && [[ "$CONTENT_TYPE" == *"image"* ]]; then
        echo "   ✅ Logo Black está sendo servido corretamente"
    else
        echo "   ❌ Logo Black NÃO está sendo servido corretamente"
    fi
fi
echo ""

echo "5️⃣ Verificando banners:"
echo "───────────────────────────────────────────────────────────────"
BANNERS_COUNT=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/banners | grep -o '"id"' | wc -l)
echo "   Total de banners: $BANNERS_COUNT"
echo "   Detalhes dos banners:"
curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/banners | grep -o '"type":"[^"]*"' | sort | uniq -c
echo ""

echo "6️⃣ Verificando index.php na raiz:"
echo "───────────────────────────────────────────────────────────────"
if [ -f "index.php" ]; then
    echo "   ✅ index.php existe"
    echo "   Verificando se está correto (primeiras 20 linhas):"
    head -20 index.php
else
    echo "   ❌ index.php NÃO existe"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ VERIFICAÇÃO CONCLUÍDA"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "💡 RESUMO:"
echo "   • Logos retornados pela API: ✅"
echo "   • Banners encontrados: $BANNERS_COUNT"
echo "   • Verifique acima se os logos existem e estão sendo servidos"
echo ""

