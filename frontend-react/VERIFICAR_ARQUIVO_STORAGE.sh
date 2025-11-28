#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 VERIFICANDO ONDE ESTÁ O ARQUIVO DE STORAGE"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Verificando se o arquivo existe em public/storage:"
echo "───────────────────────────────────────────────────────────────"
if [ -f "public/storage/Games/Pragmatic_Oficial/vs10amm.webp" ]; then
    echo "   ✅ Arquivo existe em: public/storage/Games/Pragmatic_Oficial/vs10amm.webp"
    ls -lh "public/storage/Games/Pragmatic_Oficial/vs10amm.webp"
else
    echo "   ❌ Arquivo NÃO existe em: public/storage/Games/Pragmatic_Oficial/vs10amm.webp"
fi
echo ""

echo "2️⃣ Verificando se o diretório Games existe:"
echo "───────────────────────────────────────────────────────────────"
find public/storage -type d -name "Games" 2>/dev/null | head -3
echo ""

echo "3️⃣ Listando arquivos em public/storage:"
echo "───────────────────────────────────────────────────────────────"
ls -la public/storage | head -10
echo ""

echo "4️⃣ Verificando se public/storage é symlink:"
echo "───────────────────────────────────────────────────────────────"
if [ -L public/storage ]; then
    echo "   ✅ É symlink"
    echo "   Destino: $(readlink -f public/storage)"
    echo "   Verificando se o destino tem o arquivo:"
    DEST=$(readlink -f public/storage)
    if [ -f "$DEST/Games/Pragmatic_Oficial/vs10amm.webp" ]; then
        echo "   ✅ Arquivo existe no destino do symlink"
    else
        echo "   ❌ Arquivo NÃO existe no destino do symlink"
    fi
else
    echo "   ⚠️  NÃO é symlink (é diretório real)"
fi
echo ""

echo "5️⃣ Testando acesso direto ao arquivo:"
echo "───────────────────────────────────────────────────────────────"
if [ -f "public/storage/Games/Pragmatic_Oficial/vs10amm.webp" ]; then
    file "public/storage/Games/Pragmatic_Oficial/vs10amm.webp"
    echo "   Tamanho: $(stat -f%z public/storage/Games/Pragmatic_Oficial/vs10amm.webp 2>/dev/null || stat -c%s public/storage/Games/Pragmatic_Oficial/vs10amm.webp 2>/dev/null) bytes"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"

