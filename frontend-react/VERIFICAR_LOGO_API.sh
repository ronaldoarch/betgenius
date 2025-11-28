#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 VERIFICANDO LOGO VIA API"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Buscando logo path na API:"
echo "───────────────────────────────────────────────────────────────"
LOGO_PATH=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/data | grep -o '"software_logo_white":"[^"]*' | cut -d'"' -f4 | sed 's/\\//g')
echo "   Logo path da API: $LOGO_PATH"
echo ""

echo "2️⃣ Procurando o arquivo no servidor:"
echo "───────────────────────────────────────────────────────────────"
LOGO_NAME=$(basename "$LOGO_PATH")
echo "   Nome do arquivo: $LOGO_NAME"
echo ""

echo "   Procurando em storage/app/public/uploads/:"
find storage/app/public/uploads -name "$LOGO_NAME" 2>/dev/null | head -3
echo ""

echo "   Procurando em public/storage/uploads/:"
find public/storage/uploads -name "$LOGO_NAME" 2>/dev/null | head -3
echo ""

echo "   Procurando em qualquer lugar:"
find . -name "$LOGO_NAME" 2>/dev/null | head -5
echo ""

echo "3️⃣ Listando arquivos PNG em uploads:"
echo "───────────────────────────────────────────────────────────────"
echo "   Em storage/app/public/uploads/:"
ls -1 storage/app/public/uploads/*.png 2>/dev/null | head -5
echo ""

echo "   Em public/storage/uploads/:"
ls -1 public/storage/uploads/*.png 2>/dev/null | head -5
echo ""

echo "4️⃣ Testando URL do logo:"
echo "───────────────────────────────────────────────────────────────"
LOGO_URL="https://betgeniusbr.com/storage/$LOGO_PATH"
echo "   URL: $LOGO_URL"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -I "$LOGO_URL")
CONTENT_TYPE=$(curl -s -o /dev/null -w "%{content_type}" -I "$LOGO_URL")
echo "   HTTP Code: $HTTP_CODE"
echo "   Content-Type: $CONTENT_TYPE"
echo ""

if [ "$HTTP_CODE" = "200" ] && [[ "$CONTENT_TYPE" == *"image"* ]]; then
    echo "   ✅ Logo está sendo servido corretamente"
else
    echo "   ❌ Logo NÃO está sendo servido corretamente"
    echo "   Resposta completa:"
    curl -s -I "$LOGO_URL" | head -5
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ VERIFICAÇÃO CONCLUÍDA"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "💡 CONCLUSÃO:"
if [ -z "$(find . -name "$LOGO_NAME" 2>/dev/null)" ]; then
    echo "   ❌ Logo não encontrado no servidor"
    echo "   📋 AÇÃO NECESSÁRIA:"
    echo "      1. Acesse: https://betgeniusbr.com/zirigui"
    echo "      2. Vá em: Settings → Upload logo"
    echo "      3. Faça upload do logo novamente"
else
    echo "   ✅ Logo encontrado!"
    echo "   📍 Localização: $(find . -name "$LOGO_NAME" 2>/dev/null | head -1)"
fi
echo ""

