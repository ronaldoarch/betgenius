#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 VERIFICANDO LOGO E ERRO 500 EM JOGOS"
echo "═══════════════════════════════════════════════════════════════"
echo ""

LOGO_PATH="uploads/Nx72GR0pqlAV4i7TGLzp7ltgEP55R8raNB0pBI1q.png"

echo "1️⃣ Verificando se o logo existe:"
echo "───────────────────────────────────────────────────────────────"
if [ -f "public/storage/$LOGO_PATH" ]; then
    echo "   ✅ Logo existe em: public/storage/$LOGO_PATH"
    ls -lh "public/storage/$LOGO_PATH"
else
    echo "   ❌ Logo NÃO existe em: public/storage/$LOGO_PATH"
    echo "   Buscando arquivo..."
    find . -name "Nx72GR0pqlAV4i7TGLzp7ltgEP55R8raNB0pBI1q.png" 2>/dev/null | head -3
fi
echo ""

echo "2️⃣ Testando URL do logo:"
echo "───────────────────────────────────────────────────────────────"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "https://betgeniusbr.com/storage/$LOGO_PATH")
CONTENT_TYPE=$(curl -s -I "https://betgeniusbr.com/storage/$LOGO_PATH" | grep -i "content-type" | head -1)
echo "   HTTP Code: $HTTP_CODE"
echo "   Content-Type: $CONTENT_TYPE"
if [ "$HTTP_CODE" = "200" ]; then
    echo "   ✅ Logo acessível"
else
    echo "   ❌ Logo NÃO acessível (HTTP $HTTP_CODE)"
fi
echo ""

echo "3️⃣ Testando rota /api/games/single/1500:"
echo "───────────────────────────────────────────────────────────────"
curl -s -H "Accept: application/json" https://betgeniusbr.com/api/games/single/1500 | head -c 500
echo ""
echo ""

echo "4️⃣ Verificando se o jogo ID 1500 existe:"
echo "───────────────────────────────────────────────────────────────"
php artisan tinker --execute="echo \App\Models\Game::find(1500) ? 'Jogo existe' : 'Jogo NÃO existe';" 2>/dev/null || echo "Erro ao verificar jogo"
echo ""
echo ""

echo "5️⃣ Verificando últimos erros no log:"
echo "───────────────────────────────────────────────────────────────"
tail -50 storage/logs/laravel.log | grep -i "games/single\|1500\|error\|exception" | tail -10
echo ""

echo "═══════════════════════════════════════════════════════════════"

