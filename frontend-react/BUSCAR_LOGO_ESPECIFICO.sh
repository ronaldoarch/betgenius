#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

LOGO_FILE="Nx72GR0pqlAV4i7TGLzp7ltgEP55R8raNB0pBI1q.png"

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 BUSCANDO LOGO ESPECÍFICO"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Buscando arquivo específico em todo o servidor:"
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

echo "3️⃣ Listando todos os PNGs em uploads para referência:"
echo "───────────────────────────────────────────────────────────────"
ls -lh storage/app/public/uploads/*.png 2>/dev/null | head -10
echo ""

echo "4️⃣ Testando URL após cópia (se existir):"
echo "───────────────────────────────────────────────────────────────"
if [ -f "public/storage/uploads/$LOGO_FILE" ]; then
    sleep 2
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "https://betgeniusbr.com/storage/uploads/$LOGO_FILE")
    CONTENT_TYPE=$(curl -s -I "https://betgeniusbr.com/storage/uploads/$LOGO_FILE" | grep -i "content-type" | head -1)
    echo "   HTTP Code: $HTTP_CODE"
    echo "   Content-Type: $CONTENT_TYPE"
    if [ "$HTTP_CODE" = "200" ] && echo "$CONTENT_TYPE" | grep -qi "image"; then
        echo "   ✅ Logo acessível e com Content-Type correto!"
    else
        echo "   ⚠️  Logo acessível mas Content-Type pode estar incorreto"
    fi
else
    echo "   ⚠️  Logo não foi copiado (arquivo não existe)"
    echo ""
    echo "   💡 SOLUÇÃO:"
    echo "   Você precisa fazer upload do logo via painel admin:"
    echo "   1. Acesse: https://betgeniusbr.com/admin"
    echo "   2. Vá em Settings/Configurações"
    echo "   3. Faça upload do logo branco (software_logo_white)"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"

