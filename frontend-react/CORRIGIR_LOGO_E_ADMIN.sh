#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO LOGO E VERIFICANDO ADMIN"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Verificando FILAMENT_BASE_URL:"
echo "───────────────────────────────────────────────────────────────"
FILAMENT_URL=$(grep "FILAMENT_BASE_URL" .env | cut -d'=' -f2)
echo "   FILAMENT_BASE_URL=$FILAMENT_URL"
echo "   💡 O admin está em: https://betgeniusbr.com/$FILAMENT_URL"
echo ""

echo "2️⃣ Verificando se o logo existe no banco (via API):"
echo "───────────────────────────────────────────────────────────────"
LOGO_PATH=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/data | grep -o '"software_logo_white":"[^"]*' | cut -d'"' -f4 | sed 's/\\//g')
echo "   Logo path da API: $LOGO_PATH"
echo ""

echo "3️⃣ Procurando o logo no servidor:"
echo "───────────────────────────────────────────────────────────────"
LOGO_NAME=$(basename "$LOGO_PATH")
echo "   Procurando: $LOGO_NAME"
find storage/app/public/uploads -name "$LOGO_NAME" 2>/dev/null | head -3
echo ""

echo "4️⃣ Verificando symlink do storage:"
echo "───────────────────────────────────────────────────────────────"
if [ -L "public/storage" ]; then
    echo "   ✅ Symlink existe"
    ls -la public/storage | head -1
else
    echo "   ⚠️  Symlink NÃO existe"
    echo "   Tentando criar..."
    php artisan storage:link 2>&1
    if [ -L "public/storage" ]; then
        echo "   ✅ Symlink criado com sucesso!"
    else
        echo "   ❌ Erro ao criar symlink"
        echo "   Tentando criar manualmente..."
        rm -rf public/storage
        ln -s ../storage/app/public public/storage
        if [ -L "public/storage" ]; then
            echo "   ✅ Symlink criado manualmente!"
        else
            echo "   ❌ Falha ao criar symlink manualmente"
        fi
    fi
fi
echo ""

echo "5️⃣ Verificando se o diretório public/storage/uploads existe:"
echo "───────────────────────────────────────────────────────────────"
if [ -d "public/storage/uploads" ]; then
    echo "   ✅ Diretório existe"
else
    echo "   ⚠️  Diretório não existe, criando..."
    mkdir -p public/storage/uploads
    chmod 755 public/storage/uploads
    echo "   ✅ Diretório criado"
fi
echo ""

echo "6️⃣ Verificando .htaccess em public/storage:"
echo "───────────────────────────────────────────────────────────────"
if [ -f "public/storage/.htaccess" ]; then
    echo "   ✅ .htaccess existe"
    cat public/storage/.htaccess
else
    echo "   ⚠️  .htaccess não existe, criando..."
    cat > public/storage/.htaccess << 'EOF'
<IfModule mod_rewrite.c>
    RewriteEngine Off
</IfModule>
EOF
    echo "   ✅ .htaccess criado"
fi
echo ""

echo "7️⃣ Testando URL do logo:"
echo "───────────────────────────────────────────────────────────────"
LOGO_URL="https://betgeniusbr.com/storage/$LOGO_PATH"
echo "   URL: $LOGO_URL"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -I "$LOGO_URL")
CONTENT_TYPE=$(curl -s -o /dev/null -w "%{content_type}" -I "$LOGO_URL")
echo "   HTTP Code: $HTTP_CODE"
echo "   Content-Type: $CONTENT_TYPE"
if [ "$HTTP_CODE" = "200" ] && [[ "$CONTENT_TYPE" == *"image"* ]]; then
    echo "   ✅ Logo está sendo servido corretamente"
else
    echo "   ❌ Logo NÃO está sendo servido corretamente"
    echo "   (Deve retornar HTTP 200 e Content-Type: image/png)"
    echo ""
    echo "   Verificando resposta completa:"
    curl -s -I "$LOGO_URL" | head -5
fi
echo ""

echo "8️⃣ Verificando .htaccess na raiz (regras para /storage):"
echo "───────────────────────────────────────────────────────────────"
if grep -q "storage" .htaccess; then
    echo "   ✅ Regras para /storage encontradas"
    grep -A 2 -B 2 "storage" .htaccess | head -10
else
    echo "   ⚠️  Nenhuma regra específica para /storage"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ VERIFICAÇÃO CONCLUÍDA"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 RESUMO:"
echo "   • Admin está em: https://betgeniusbr.com/$FILAMENT_URL"
echo "   • Logo path: $LOGO_PATH"
echo "   • Logo URL: $LOGO_URL"
echo ""
echo "💡 SE O LOGO AINDA NÃO FUNCIONAR:"
echo "   1. O arquivo pode não existir no servidor"
echo "   2. Faça upload do logo via admin panel em:"
echo "      https://betgeniusbr.com/$FILAMENT_URL"
echo "   3. Ou copie manualmente para: storage/app/public/uploads/"
echo ""

