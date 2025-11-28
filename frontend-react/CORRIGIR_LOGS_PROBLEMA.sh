#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO PROBLEMA DOS LOGOS"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Buscando paths dos logos na API:"
echo "───────────────────────────────────────────────────────────────"
LOGO_WHITE=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/data | grep -o '"software_logo_white":"[^"]*' | cut -d'"' -f4 | sed 's/\\//g')
LOGO_BLACK=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/data | grep -o '"software_logo_black":"[^"]*' | cut -d'"' -f4 | sed 's/\\//g')
echo "   Logo White: $LOGO_WHITE"
echo "   Logo Black: $LOGO_BLACK"
echo ""

echo "2️⃣ Procurando os arquivos em todos os lugares:"
echo "───────────────────────────────────────────────────────────────"
if [ ! -z "$LOGO_WHITE" ]; then
    LOGO_WHITE_NAME=$(basename "$LOGO_WHITE")
    echo "   Procurando Logo White ($LOGO_WHITE_NAME):"
    find . -name "$LOGO_WHITE_NAME" -type f 2>/dev/null | head -5
    echo ""
fi

if [ ! -z "$LOGO_BLACK" ]; then
    LOGO_BLACK_NAME=$(basename "$LOGO_BLACK")
    echo "   Procurando Logo Black ($LOGO_BLACK_NAME):"
    find . -name "$LOGO_BLACK_NAME" -type f 2>/dev/null | head -5
    echo ""
fi

echo "3️⃣ Verificando se os arquivos existem no caminho esperado:"
echo "───────────────────────────────────────────────────────────────"
if [ ! -z "$LOGO_WHITE" ]; then
    if [ -f "storage/app/public/$LOGO_WHITE" ]; then
        echo "   ✅ Logo White existe em: storage/app/public/$LOGO_WHITE"
    else
        echo "   ❌ Logo White NÃO existe em: storage/app/public/$LOGO_WHITE"
        echo "   Criando diretório se não existir..."
        mkdir -p "storage/app/public/$(dirname "$LOGO_WHITE")"
    fi
fi

if [ ! -z "$LOGO_BLACK" ]; then
    if [ -f "storage/app/public/$LOGO_BLACK" ]; then
        echo "   ✅ Logo Black existe em: storage/app/public/$LOGO_BLACK"
    else
        echo "   ❌ Logo Black NÃO existe em: storage/app/public/$LOGO_BLACK"
        echo "   Criando diretório se não existir..."
        mkdir -p "storage/app/public/$(dirname "$LOGO_BLACK")"
    fi
fi
echo ""

echo "4️⃣ Verificando symlink do storage:"
echo "───────────────────────────────────────────────────────────────"
if [ -L "public/storage" ]; then
    echo "   ✅ Symlink existe"
    SYMLINK_TARGET=$(readlink -f public/storage)
    echo "   Aponta para: $SYMLINK_TARGET"
    if [ ! -d "$SYMLINK_TARGET" ]; then
        echo "   ⚠️  Mas o diretório de destino não existe!"
    fi
else
    echo "   ⚠️  Symlink NÃO existe, criando..."
    rm -rf public/storage
    php artisan storage:link 2>&1
    if [ -L "public/storage" ]; then
        echo "   ✅ Symlink criado"
    else
        echo "   ❌ Erro ao criar symlink, tentando manualmente..."
        ln -s ../storage/app/public public/storage
    fi
fi
echo ""

echo "5️⃣ Verificando .htaccess em public/storage:"
echo "───────────────────────────────────────────────────────────────"
if [ -f "public/storage/.htaccess" ]; then
    echo "   ✅ .htaccess existe"
else
    echo "   ⚠️  .htaccess não existe, criando..."
    mkdir -p public/storage
    cat > public/storage/.htaccess << 'EOF'
<IfModule mod_rewrite.c>
    RewriteEngine Off
</IfModule>
EOF
    echo "   ✅ .htaccess criado"
fi
echo ""

echo "6️⃣ Testando URLs dos logos:"
echo "───────────────────────────────────────────────────────────────"
if [ ! -z "$LOGO_WHITE" ]; then
    LOGO_WHITE_URL="https://betgeniusbr.com/storage/$LOGO_WHITE"
    echo "   Testando: $LOGO_WHITE_URL"
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -I "$LOGO_WHITE_URL")
    CONTENT_TYPE=$(curl -s -o /dev/null -w "%{content_type}" -I "$LOGO_WHITE_URL")
    echo "   HTTP: $HTTP_CODE | Content-Type: $CONTENT_TYPE"
    if [ "$HTTP_CODE" = "200" ] && [[ "$CONTENT_TYPE" == *"image"* ]]; then
        echo "   ✅ Logo White está sendo servido corretamente"
    else
        echo "   ❌ Logo White NÃO está sendo servido como imagem"
        echo "   (Retorna HTML ao invés de imagem - arquivo não existe ou roteamento incorreto)"
    fi
fi
echo ""

if [ ! -z "$LOGO_BLACK" ]; then
    LOGO_BLACK_URL="https://betgeniusbr.com/storage/$LOGO_BLACK"
    echo "   Testando: $LOGO_BLACK_URL"
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -I "$LOGO_BLACK_URL")
    CONTENT_TYPE=$(curl -s -o /dev/null -w "%{content_type}" -I "$LOGO_BLACK_URL")
    echo "   HTTP: $HTTP_CODE | Content-Type: $CONTENT_TYPE"
    if [ "$HTTP_CODE" = "200" ] && [[ "$CONTENT_TYPE" == *"image"* ]]; then
        echo "   ✅ Logo Black está sendo servido corretamente"
    else
        echo "   ❌ Logo Black NÃO está sendo servido como imagem"
        echo "   (Retorna HTML ao invés de imagem - arquivo não existe ou roteamento incorreto)"
    fi
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ VERIFICAÇÃO CONCLUÍDA"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "💡 CONCLUSÃO:"
echo "   Os logos NÃO existem fisicamente no servidor."
echo "   A API retorna os paths, mas os arquivos não foram encontrados."
echo ""
echo "📋 SOLUÇÃO:"
echo "   1. Acesse o admin: https://betgeniusbr.com/zirigui"
echo "   2. Vá em: Settings"
echo "   3. Faça upload dos logos novamente:"
echo "      - LOGOTIPO 1 (software_logo_white) - para o header"
echo "      - LOGOTIPO 2 (software_logo_black) - para o loading"
echo "   4. Depois de fazer upload, execute este script novamente"
echo ""

