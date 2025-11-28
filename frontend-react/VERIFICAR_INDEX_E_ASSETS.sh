#!/bin/bash

# ============================================================
# ✅ VERIFICAR INDEX.HTML E ASSETS
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 VERIFICANDO INDEX.HTML E ASSETS"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando se index.html existe em public/..."
if [ -f "public/index.html" ]; then
    echo "✅ index.html existe!"
    ls -lh public/index.html
    echo ""
    echo "Conteúdo:"
    cat public/index.html
else
    echo "❌ index.html NÃO existe em public/"
fi
echo ""

echo "2️⃣ Verificando se index.php existe em public/..."
if [ -f "public/index.php" ]; then
    echo "✅ index.php existe!"
    ls -lh public/index.php
else
    echo "❌ index.php NÃO existe em public/"
fi
echo ""

echo "3️⃣ Verificando assets do React..."
echo "Procurando por index-DrMwNlRZ.js..."
find public/ -name "index-DrMwNlRZ.js" 2>/dev/null
echo ""
echo "Procurando por index-R46pBGYW.css..."
find public/ -name "index-R46pBGYW.css" 2>/dev/null
echo ""

echo "4️⃣ Verificando estrutura de assets..."
echo "Conteúdo de public/assets/ (se existir):"
if [ -d "public/assets" ]; then
    ls -la public/assets/ | head -10
    echo ""
    echo "Verificando se é symlink:"
    ls -ld public/assets/
else
    echo "❌ public/assets/ não existe"
fi
echo ""

echo "5️⃣ Verificando public/app/assets/ (se existir)..."
if [ -d "public/app/assets" ]; then
    echo "✅ public/app/assets/ existe"
    ls -la public/app/assets/ | head -10
else
    echo "❌ public/app/assets/ não existe"
fi
echo ""

echo "6️⃣ Verificando todos os arquivos .js e .css em public/..."
echo "Arquivos .js:"
find public/ -name "*.js" -type f | head -5
echo ""
echo "Arquivos .css:"
find public/ -name "*.css" -type f | head -5
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "📋 RESUMO"
echo "═══════════════════════════════════════════════════════════════"
echo ""

if [ -f "public/index.html" ]; then
    echo "✅ index.html existe"
    if grep -q "index-DrMwNlRZ.js" public/index.html; then
        echo "✅ index.html referencia index-DrMwNlRZ.js"
        if [ -f "public/assets/index-DrMwNlRZ.js" ] || [ -f "public/app/assets/index-DrMwNlRZ.js" ]; then
            echo "✅ Arquivo JavaScript encontrado"
        else
            echo "❌ Arquivo JavaScript NÃO encontrado!"
        fi
    fi
    if grep -q "index-R46pBGYW.css" public/index.html; then
        echo "✅ index.html referencia index-R46pBGYW.css"
        if [ -f "public/assets/index-R46pBGYW.css" ] || [ -f "public/app/assets/index-R46pBGYW.css" ]; then
            echo "✅ Arquivo CSS encontrado"
        else
            echo "❌ Arquivo CSS NÃO encontrado!"
        fi
    fi
else
    echo "❌ index.html NÃO existe - precisa ser criado"
fi

echo ""
echo "═══════════════════════════════════════════════════════════════"

