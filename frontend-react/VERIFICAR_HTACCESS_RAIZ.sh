#!/bin/bash

# ============================================================
# ✅ VERIFICAR .HTACCESS NA RAIZ (public_html/)
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 VERIFICANDO .HTACCESS NA RAIZ"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando se .htaccess existe na raiz..."
if [ -f ".htaccess" ]; then
    echo "✅ .htaccess existe na raiz"
    echo ""
    echo "Conteúdo atual:"
    cat .htaccess
    echo ""
else
    echo "❌ .htaccess NÃO existe na raiz!"
    echo "   Criando..."
fi
echo ""

echo "2️⃣ Verificando estrutura..."
echo "Arquivos na raiz:"
ls -la | grep -E "index\.|\.htaccess" | head -5
echo ""

echo "3️⃣ Verificando se public/ existe..."
if [ -d "public" ]; then
    echo "✅ Diretório public/ existe"
    echo "Conteúdo de public/:"
    ls -la public/ | grep -E "index\.|\.htaccess" | head -5
else
    echo "❌ Diretório public/ NÃO existe!"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "📋 DIAGNÓSTICO"
echo "═══════════════════════════════════════════════════════════════"
echo ""

if [ -f ".htaccess" ]; then
    if grep -q "RewriteRule.*public" .htaccess; then
        echo "✅ .htaccess na raiz redireciona para public/"
    else
        echo "⚠️  .htaccess na raiz pode não estar redirecionando corretamente"
    fi
else
    echo "❌ .htaccess na raiz não existe - precisa ser criado"
fi

echo ""
echo "═══════════════════════════════════════════════════════════════"

