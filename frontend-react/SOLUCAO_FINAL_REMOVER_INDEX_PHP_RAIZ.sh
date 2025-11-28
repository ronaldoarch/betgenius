#!/bin/bash

# ============================================================
# ✅ SOLUÇÃO FINAL - REMOVER INDEX.PHP DA RAIZ
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 SOLUÇÃO FINAL - REMOVER INDEX.PHP DA RAIZ"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Fazendo backup do index.php na raiz..."
if [ -f "index.php" ]; then
    cp index.php index.php.backup.$(date +%Y%m%d_%H%M%S)
    echo "✅ Backup criado"
    echo ""
    echo "2️⃣ Removendo index.php da raiz..."
    rm -f index.php
    echo "✅ index.php removido da raiz"
    echo ""
    echo "   Agora o servidor vai usar apenas o .htaccess para redirecionar"
else
    echo "⚠️  index.php não existe na raiz (já foi removido)"
fi
echo ""

echo "3️⃣ Verificando .htaccess na raiz..."
if [ -f ".htaccess" ]; then
    echo "✅ .htaccess existe na raiz"
    echo "   Conteúdo:"
    cat .htaccess
else
    echo "❌ .htaccess não existe na raiz!"
fi
echo ""

echo "4️⃣ Verificando .htaccess em public/..."
if [ -f "public/.htaccess" ]; then
    echo "✅ .htaccess existe em public/"
    echo "   Verificando regras para /api:"
    grep -A 2 "REQUEST_URI.*api" public/.htaccess
else
    echo "❌ .htaccess não existe em public/"
fi
echo ""

echo "5️⃣ Testando se a API agora retorna JSON..."
echo "  Aguardando 3 segundos para o servidor processar..."
sleep 3
echo ""
echo "  GET /api/games/all:"
API_RESPONSE=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/games/all 2>&1 | head -c 500)
if echo "$API_RESPONSE" | grep -q "DOCTYPE\|html"; then
    echo "    ❌ Ainda retornando HTML"
    echo "    Primeiros caracteres:"
    echo "$API_RESPONSE" | head -c 200
    echo "..."
else
    echo "    ✅ Retornando JSON ou dados corretos"
    echo "    Primeiros caracteres:"
    echo "$API_RESPONSE"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ CORREÇÃO APLICADA!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 TESTE AGORA:"
echo "   1. Limpe o cache do navegador (Ctrl+Shift+R)"
echo "   2. Teste: https://betgeniusbr.com/"
echo "   3. Verifique se os dados estão carregando"
echo ""
echo "═══════════════════════════════════════════════════════════════"

