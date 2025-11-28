#!/bin/bash

# ============================================================
# ✅ VERIFICAR CORS E TESTAR API
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 VERIFICANDO CORS E TESTANDO API"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Testando API de jogos com headers CORS..."
echo ""
echo "  GET /api/games:"
curl -s -H "Origin: https://betgeniusbr.com" \
     -H "Access-Control-Request-Method: GET" \
     -H "Access-Control-Request-Headers: Content-Type" \
     -X OPTIONS \
     https://betgeniusbr.com/api/games \
     -w "\n   Status: %{http_code}\n" \
     -o /dev/null
echo ""

echo "2️⃣ Testando resposta real da API de jogos..."
echo ""
RESPONSE=$(curl -s https://betgeniusbr.com/api/games)
if [ -n "$RESPONSE" ]; then
    echo "✅ API retornou dados"
    echo "   Primeiros 200 caracteres:"
    echo "$RESPONSE" | head -c 200
    echo "..."
    echo ""
    echo "   Verificando se é JSON válido:"
    echo "$RESPONSE" | jq . > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "   ✅ Resposta é JSON válido"
        echo "   Quantidade de itens:"
        echo "$RESPONSE" | jq 'length' 2>/dev/null || echo "$RESPONSE" | jq '.data | length' 2>/dev/null || echo "   (não foi possível contar)"
    else
        echo "   ⚠️  Resposta não é JSON válido"
        echo "   Conteúdo:"
        echo "$RESPONSE" | head -5
    fi
else
    echo "❌ API não retornou dados"
fi
echo ""

echo "3️⃣ Testando API de banners..."
echo ""
BANNERS_RESPONSE=$(curl -s https://betgeniusbr.com/api/banners)
if [ -n "$BANNERS_RESPONSE" ]; then
    echo "✅ API de banners retornou dados"
    echo "   Primeiros 200 caracteres:"
    echo "$BANNERS_RESPONSE" | head -c 200
    echo "..."
else
    echo "❌ API de banners não retornou dados"
fi
echo ""

echo "4️⃣ Verificando configuração CORS no Laravel..."
if [ -f "config/cors.php" ]; then
    echo "✅ config/cors.php existe"
    echo "   Configuração:"
    grep -E "allowed_origins|allowed_methods|allowed_headers" config/cors.php | head -5
else
    echo "⚠️  config/cors.php não encontrado"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "📋 DIAGNÓSTICO"
echo "═══════════════════════════════════════════════════════════════"
echo ""

if [ -z "$RESPONSE" ]; then
    echo "⚠️  PROBLEMA: API não está retornando dados"
    echo "   Verifique se as rotas estão configuradas corretamente"
elif echo "$RESPONSE" | jq . > /dev/null 2>&1; then
    echo "✅ API está retornando JSON válido"
    echo ""
    echo "   Se o React não está mostrando os dados, pode ser:"
    echo "   1. Erro no console do navegador (F12)"
    echo "   2. Problema de CORS"
    echo "   3. O React não está processando as respostas"
else
    echo "⚠️  API retornou dados, mas não é JSON válido"
    echo "   Verifique a resposta da API"
fi

echo ""
echo "═══════════════════════════════════════════════════════════════"

