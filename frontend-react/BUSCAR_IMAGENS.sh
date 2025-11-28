#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 BUSCANDO IMAGENS NO SERVIDOR"
echo "═══════════════════════════════════════════════════════════════"
echo ""

LOGO_PATH="uploads/Nx72GR0pqlAV4i7TGLzp7ltgEP55R8raNB0pBI1q.png"
BANNER_IMAGE="01KA9S09Z85AV3205AQ8C71B6T.JPG"

echo "1️⃣ Buscando logo: $LOGO_PATH"
echo "───────────────────────────────────────────────────────────────"
find . -name "Nx72GR0pqlAV4i7TGLzp7ltgEP55R8raNB0pBI1q.png" 2>/dev/null | head -5
echo ""

echo "2️⃣ Buscando banner: $BANNER_IMAGE"
echo "───────────────────────────────────────────────────────────────"
find . -name "$BANNER_IMAGE" 2>/dev/null | head -5
echo ""

echo "3️⃣ Verificando se public/storage é symlink:"
echo "───────────────────────────────────────────────────────────────"
if [ -L public/storage ]; then
    echo "   ✅ É symlink"
    echo "   Destino: $(readlink -f public/storage)"
else
    echo "   ❌ NÃO é symlink"
    echo "   Criando symlink..."
    php artisan storage:link 2>&1
    echo "   ✅ Symlink criado"
fi
echo ""

echo "4️⃣ Verificando estrutura de storage:"
echo "───────────────────────────────────────────────────────────────"
echo "storage/app/public:"
ls -la storage/app/public 2>/dev/null | head -10 || echo "   ⚠️  Diretório não existe"
echo ""
echo "public/storage:"
ls -la public/storage 2>/dev/null | head -10 || echo "   ⚠️  Diretório não existe"
echo ""

echo "5️⃣ Verificando se arquivos estão em storage/app/public/uploads:"
echo "───────────────────────────────────────────────────────────────"
if [ -d "storage/app/public/uploads" ]; then
    ls -la storage/app/public/uploads | grep -E "Nx72GR0pqlAV4i7TGLzp7ltgEP55R8raNB0pBI1q.png|01KA9S09Z85AV3205AQ8C71B6T.JPG" || echo "   ⚠️  Arquivos não encontrados"
else
    echo "   ⚠️  Diretório uploads não existe"
fi
echo ""

echo "6️⃣ Verificando se arquivos estão diretamente em public/storage:"
echo "───────────────────────────────────────────────────────────────"
if [ -d "public/storage" ]; then
    ls -la public/storage | grep -E "Nx72GR0pqlAV4i7TGLzp7ltgEP55R8raNB0pBI1q.png|01KA9S09Z85AV3205AQ8C71B6T.JPG" || echo "   ⚠️  Arquivos não encontrados"
else
    echo "   ⚠️  Diretório public/storage não existe"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"

