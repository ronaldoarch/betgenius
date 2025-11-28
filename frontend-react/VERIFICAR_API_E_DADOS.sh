#!/bin/bash

# ============================================================
# ✅ VERIFICAR API E DADOS
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 VERIFICANDO API E DADOS"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Testando rotas da API..."
echo ""

echo "  /api/games:"
API_GAMES=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/api/games)
echo "    Status: $API_GAMES"
if [ "$API_GAMES" = "200" ]; then
    echo "    ✅ API de jogos está funcionando"
    echo "    Resposta:"
    curl -s https://betgeniusbr.com/api/games | head -20
elif [ "$API_GAMES" = "404" ]; then
    echo "    ❌ Rota /api/games não existe"
elif [ "$API_GAMES" = "500" ]; then
    echo "    ❌ Erro 500 - problema no servidor"
else
    echo "    ⚠️  Status: $API_GAMES"
fi
echo ""

echo "  /api/banners:"
API_BANNERS=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/api/banners)
echo "    Status: $API_BANNERS"
if [ "$API_BANNERS" = "200" ]; then
    echo "    ✅ API de banners está funcionando"
    echo "    Resposta:"
    curl -s https://betgeniusbr.com/api/banners | head -20
elif [ "$API_BANNERS" = "404" ]; then
    echo "    ❌ Rota /api/banners não existe"
else
    echo "    ⚠️  Status: $API_BANNERS"
fi
echo ""

echo "  /api/categories:"
API_CATEGORIES=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/api/categories)
echo "    Status: $API_CATEGORIES"
if [ "$API_CATEGORIES" = "200" ]; then
    echo "    ✅ API de categorias está funcionando"
elif [ "$API_CATEGORIES" = "404" ]; then
    echo "    ❌ Rota /api/categories não existe"
else
    echo "    ⚠️  Status: $API_CATEGORIES"
fi
echo ""

echo "2️⃣ Verificando se o Laravel está funcionando..."
if [ -f "public/index.php" ]; then
    echo "✅ index.php do Laravel existe"
    echo "  Testando se o Laravel responde:"
    LARAVEL_TEST=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/api/test 2>/dev/null || echo "000")
    echo "    Status: $LARAVEL_TEST"
else
    echo "❌ index.php do Laravel NÃO existe"
fi
echo ""

echo "3️⃣ Verificando rotas do Laravel..."
if [ -f "routes/api.php" ]; then
    echo "✅ routes/api.php existe"
    echo "  Rotas definidas:"
    grep -E "Route::(get|post|put|delete)" routes/api.php | head -10
else
    echo "⚠️  routes/api.php não encontrado"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "📋 DIAGNÓSTICO"
echo "═══════════════════════════════════════════════════════════════"
echo ""

if [ "$API_GAMES" != "200" ] && [ "$API_BANNERS" != "200" ]; then
    echo "⚠️  PROBLEMA: APIs não estão respondendo"
    echo ""
    echo "   Possíveis causas:"
    echo "   1. Rotas da API não estão definidas"
    echo "   2. Laravel não está processando as rotas corretamente"
    echo "   3. Problema com o .htaccess não redirecionando /api para index.php"
    echo ""
    echo "   Verifique o console do navegador (F12) para ver erros específicos"
else
    echo "✅ APIs estão funcionando"
fi

echo ""
echo "═══════════════════════════════════════════════════════════════"

