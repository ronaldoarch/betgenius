#!/bin/bash

# ============================================================
# ✅ VERIFICAR ASSETS E API
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 VERIFICANDO ASSETS E API"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando assets em public/assets/..."
if [ -d "public/assets" ]; then
    echo "✅ Diretório assets/ existe"
    echo "Arquivos:"
    ls -lh public/assets/ | head -10
    echo ""
    echo "Testando acesso HTTP:"
    echo "  /assets/index-DrMwNlRZ.js:"
    curl -s -o /dev/null -w "    Status: %{http_code}\n" https://betgeniusbr.com/assets/index-DrMwNlRZ.js
    echo "  /assets/index-R46pBGYW.css:"
    curl -s -o /dev/null -w "    Status: %{http_code}\n" https://betgeniusbr.com/assets/index-R46pBGYW.css
else
    echo "❌ Diretório assets/ NÃO existe!"
fi
echo ""

echo "2️⃣ Verificando index.html..."
if [ -f "public/index.html" ]; then
    echo "✅ index.html existe"
    echo ""
    echo "Verificando referências aos assets:"
    grep -E "assets/|index-DrMwNlRZ|index-R46pBGYW" public/index.html
else
    echo "❌ index.html NÃO existe!"
fi
echo ""

echo "3️⃣ Verificando se index.php na raiz está servindo corretamente..."
if [ -f "index.php" ]; then
    echo "✅ index.php existe na raiz"
    echo ""
    echo "Conteúdo:"
    cat index.php
else
    echo "❌ index.php NÃO existe na raiz!"
fi
echo ""

echo "4️⃣ Testando API..."
echo "  /api/games:"
API_STATUS=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/api/games)
echo "    Status: $API_STATUS"
if [ "$API_STATUS" = "200" ]; then
    echo "    ✅ API está funcionando"
elif [ "$API_STATUS" = "404" ]; then
    echo "    ⚠️  API retorna 404 - rota pode não existir"
else
    echo "    ⚠️  Status: $API_STATUS"
fi
echo ""

echo "5️⃣ Verificando .htaccess em public/..."
if [ -f "public/.htaccess" ]; then
    echo "✅ .htaccess existe em public/"
    echo ""
    echo "Verificando se está configurado para servir assets:"
    grep -E "assets|RewriteCond.*-f" public/.htaccess | head -5
else
    echo "❌ .htaccess NÃO existe em public/"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "📋 DIAGNÓSTICO"
echo "═══════════════════════════════════════════════════════════════"
echo ""

if [ -f "public/assets/index-DrMwNlRZ.js" ]; then
    ASSET_STATUS=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/assets/index-DrMwNlRZ.js)
    if [ "$ASSET_STATUS" != "200" ]; then
        echo "⚠️  PROBLEMA: Assets não estão acessíveis via HTTP"
        echo "   Status: $ASSET_STATUS"
        echo ""
        echo "   Possíveis causas:"
        echo "   - .htaccess não está servindo assets corretamente"
        echo "   - Caminho dos assets está incorreto"
    else
        echo "✅ Assets estão acessíveis"
    fi
else
    echo "❌ Arquivo JavaScript não encontrado em public/assets/"
fi

echo ""
echo "═══════════════════════════════════════════════════════════════"

