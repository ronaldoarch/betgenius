#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 DIAGNOSTICANDO ERROS DO CONSOLE"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Verificando logo no storage:"
echo "───────────────────────────────────────────────────────────────"
LOGO_FILE="public/storage/uploads/Nx72GR0pqlAV417TGLzp7ltgEP55R8raNB0pBI1q.png"
if [ -f "$LOGO_FILE" ]; then
    echo "   ✅ Logo encontrado: $LOGO_FILE"
    ls -lh "$LOGO_FILE"
else
    echo "   ❌ Logo NÃO encontrado: $LOGO_FILE"
    echo "   Procurando em storage/app/public/uploads/:"
    find storage/app/public/uploads -name "*Nx72GR0pqlAV*" 2>/dev/null | head -5
    echo "   Procurando em public/storage/uploads/:"
    find public/storage/uploads -name "*Nx72GR0pqlAV*" 2>/dev/null | head -5
fi
echo ""

echo "2️⃣ Verificando symlink do storage:"
echo "───────────────────────────────────────────────────────────────"
if [ -L "public/storage" ]; then
    echo "   ✅ Symlink existe"
    ls -la public/storage | head -1
    echo "   Aponta para: $(readlink public/storage)"
else
    echo "   ⚠️  Symlink NÃO existe, criando..."
    php artisan storage:link 2>/dev/null || echo "   ❌ Erro ao criar symlink"
fi
echo ""

echo "3️⃣ Verificando permissões do storage:"
echo "───────────────────────────────────────────────────────────────"
ls -ld storage/app/public public/storage 2>/dev/null | head -2
echo ""

echo "4️⃣ Verificando últimos erros do Laravel (API 500):"
echo "───────────────────────────────────────────────────────────────"
if [ -f "storage/logs/laravel.log" ]; then
    echo "   Últimos erros relacionados a /api/games/single/:"
    tail -100 storage/logs/laravel.log | grep -i "games/single\|error\|exception" | tail -10
else
    echo "   ⚠️  Arquivo de log não encontrado"
fi
echo ""

echo "5️⃣ Testando API /api/games/single/1422:"
echo "───────────────────────────────────────────────────────────────"
HTTP_CODE=$(curl -s -o /tmp/api_test.json -w "%{http_code}" https://betgeniusbr.com/api/games/single/1422)
echo "   HTTP Code: $HTTP_CODE"
if [ "$HTTP_CODE" = "500" ]; then
    echo "   ❌ Erro 500 detectado"
    echo "   Resposta:"
    cat /tmp/api_test.json | head -20
    rm -f /tmp/api_test.json
else
    echo "   ✅ API retornou HTTP $HTTP_CODE"
    rm -f /tmp/api_test.json
fi
echo ""

echo "6️⃣ Verificando se o jogo ID 1422 existe no banco:"
echo "───────────────────────────────────────────────────────────────"
php artisan tinker --execute="echo \App\Models\Game::find(1422) ? 'Jogo encontrado' : 'Jogo NÃO encontrado';" 2>/dev/null || echo "   ⚠️  Erro ao verificar banco"
echo ""

echo "7️⃣ Verificando URL do logo:"
echo "───────────────────────────────────────────────────────────────"
LOGO_URL="https://betgeniusbr.com/storage/uploads/Nx72GR0pqlAV417TGLzp7ltgEP55R8raNB0pBI1q.png"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -I "$LOGO_URL")
CONTENT_TYPE=$(curl -s -o /dev/null -w "%{content_type}" "$LOGO_URL")
echo "   HTTP Code: $HTTP_CODE"
echo "   Content-Type: $CONTENT_TYPE"
if [ "$HTTP_CODE" = "200" ] && [[ "$CONTENT_TYPE" == *"image"* ]]; then
    echo "   ✅ Logo está sendo servido corretamente"
else
    echo "   ❌ Logo NÃO está sendo servido corretamente"
    echo "   (Deve retornar HTTP 200 e Content-Type: image/png)"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ DIAGNÓSTICO CONCLUÍDO"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "💡 PRÓXIMOS PASSOS:"
echo "   1. Se o logo não existe, faça upload via admin panel"
echo "   2. Se o symlink não existe, execute: php artisan storage:link"
echo "   3. Se a API retorna 500, verifique os logs acima"
echo "   4. Os placeholders dos banners (via.placeholder.com) falham por DNS"
echo "      - Isso é normal se o domínio não resolver"
echo "      - O código deve usar imagens locais ou remover o placeholder"
echo ""

