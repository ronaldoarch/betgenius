#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 BUSCANDO LOGO E CORRIGINDO"
echo "═══════════════════════════════════════════════════════════════"
echo ""

LOGO_FILE="Nx72GR0pqlAV4i7TGLzp7ltgEP55R8raNB0pBI1q.png"

echo "1️⃣ Buscando arquivo do logo em todo o servidor:"
echo "───────────────────────────────────────────────────────────────"
find . -name "$LOGO_FILE" 2>/dev/null
echo ""

echo "2️⃣ Verificando se existe em storage/app/public/uploads:"
echo "───────────────────────────────────────────────────────────────"
if [ -f "storage/app/public/uploads/$LOGO_FILE" ]; then
    echo "   ✅ Logo existe em: storage/app/public/uploads/$LOGO_FILE"
    echo "   Copiando para public/storage/uploads/..."
    mkdir -p public/storage/uploads
    cp "storage/app/public/uploads/$LOGO_FILE" "public/storage/uploads/$LOGO_FILE"
    chmod 644 "public/storage/uploads/$LOGO_FILE"
    echo "   ✅ Logo copiado!"
else
    echo "   ❌ Logo NÃO existe em: storage/app/public/uploads/$LOGO_FILE"
fi
echo ""

echo "3️⃣ Verificando se existe em public/storage/uploads:"
echo "───────────────────────────────────────────────────────────────"
if [ -f "public/storage/uploads/$LOGO_FILE" ]; then
    echo "   ✅ Logo existe em: public/storage/uploads/$LOGO_FILE"
    ls -lh "public/storage/uploads/$LOGO_FILE"
else
    echo "   ❌ Logo NÃO existe em: public/storage/uploads/$LOGO_FILE"
fi
echo ""

echo "4️⃣ Testando URL do logo:"
echo "───────────────────────────────────────────────────────────────"
sleep 2
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "https://betgeniusbr.com/storage/uploads/$LOGO_FILE")
CONTENT_TYPE=$(curl -s -I "https://betgeniusbr.com/storage/uploads/$LOGO_FILE" | grep -i "content-type" | head -1)
echo "   HTTP Code: $HTTP_CODE"
echo "   Content-Type: $CONTENT_TYPE"
if [ "$HTTP_CODE" = "200" ] && echo "$CONTENT_TYPE" | grep -qi "image"; then
    echo "   ✅ Logo acessível e com Content-Type correto!"
else
    echo "   ❌ Logo ainda não está correto"
fi
echo ""

echo "5️⃣ Verificando erro do jogo 1500:"
echo "───────────────────────────────────────────────────────────────"
RESPONSE=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/games/single/1500)
echo "$RESPONSE"
if echo "$RESPONSE" | grep -q '"status":false'; then
    echo "   ⚠️  Jogo não encontrado (isso é normal se o jogo não existir)"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"

