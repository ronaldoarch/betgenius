#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CRIANDO SYMLINK CORRETO"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Verificando se public/storage é diretório ou symlink:"
echo "───────────────────────────────────────────────────────────────"
if [ -L public/storage ]; then
    echo "   ✅ É symlink"
    echo "   Destino: $(readlink -f public/storage)"
elif [ -d public/storage ]; then
    echo "   ⚠️  É um diretório real (não é symlink)"
    echo "   Verificando se tem arquivos importantes..."
    FILE_COUNT=$(find public/storage -type f | wc -l)
    echo "   Arquivos encontrados: $FILE_COUNT"
    echo ""
    echo "   Como o logo está acessível, vamos manter o diretório"
    echo "   mas garantir que o symlink também funcione..."
else
    echo "   ❌ Não existe - Criando symlink..."
    php artisan storage:link
    echo "   ✅ Symlink criado"
fi
echo ""

echo "2️⃣ Testando URLs das imagens:"
echo "───────────────────────────────────────────────────────────────"
echo "Logo:"
LOGO_URL="https://betgeniusbr.com/storage/uploads/Nx72GR0pqlAV4i7TGLzp7ltgEP55R8raNB0pBI1q.png"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$LOGO_URL")
if [ "$HTTP_CODE" = "200" ]; then
    echo "   ✅ Logo acessível (HTTP 200): $LOGO_URL"
else
    echo "   ❌ Logo NÃO acessível (HTTP $HTTP_CODE): $LOGO_URL"
fi
echo ""

echo "Banner:"
BANNER_URL="https://betgeniusbr.com/storage/01KA9S09Z85AV3205AQ8C71B6T.JPG"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$BANNER_URL")
if [ "$HTTP_CODE" = "200" ]; then
    echo "   ✅ Banner acessível (HTTP 200): $BANNER_URL"
else
    echo "   ❌ Banner NÃO acessível (HTTP $HTTP_CODE): $BANNER_URL"
    echo "   Buscando banner em public/storage..."
    find public/storage -name "*01KA9S09Z85AV3205AQ8C71B6T*" 2>/dev/null | head -3
fi
echo ""

echo "3️⃣ Verificando se há banners em public/storage:"
echo "───────────────────────────────────────────────────────────────"
find public/storage -type f \( -name "*.jpg" -o -name "*.JPG" -o -name "*.png" -o -name "*.PNG" \) 2>/dev/null | head -10
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ Verificação concluída!"
echo ""
echo "Se o logo está acessível mas não aparece no site,"
echo "pode ser um problema de cache do navegador."
echo "═══════════════════════════════════════════════════════════════"

