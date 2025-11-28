#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 DIAGNOSTICANDO POR QUE OS LOGOS NÃO APARECEM"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Buscando paths dos logos na API:"
echo "───────────────────────────────────────────────────────────────"
LOGO_WHITE=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/data | grep -o '"software_logo_white":"[^"]*' | cut -d'"' -f4 | sed 's/\\//g')
LOGO_BLACK=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/data | grep -o '"software_logo_black":"[^"]*' | cut -d'"' -f4 | sed 's/\\//g')
echo "   Logo White: $LOGO_WHITE"
echo "   Logo Black: $LOGO_BLACK"
echo ""

echo "2️⃣ Procurando os arquivos no servidor:"
echo "───────────────────────────────────────────────────────────────"
if [ ! -z "$LOGO_WHITE" ]; then
    LOGO_WHITE_NAME=$(basename "$LOGO_WHITE")
    echo "   Procurando Logo White ($LOGO_WHITE_NAME):"
    find . -name "$LOGO_WHITE_NAME" -type f 2>/dev/null | head -5
    if [ -f "storage/app/public/$LOGO_WHITE" ]; then
        echo "   ✅ Encontrado em: storage/app/public/$LOGO_WHITE"
        ls -lh "storage/app/public/$LOGO_WHITE"
    else
        echo "   ❌ NÃO encontrado em: storage/app/public/$LOGO_WHITE"
    fi
fi
echo ""

if [ ! -z "$LOGO_BLACK" ]; then
    LOGO_BLACK_NAME=$(basename "$LOGO_BLACK")
    echo "   Procurando Logo Black ($LOGO_BLACK_NAME):"
    find . -name "$LOGO_BLACK_NAME" -type f 2>/dev/null | head -5
    if [ -f "storage/app/public/$LOGO_BLACK" ]; then
        echo "   ✅ Encontrado em: storage/app/public/$LOGO_BLACK"
        ls -lh "storage/app/public/$LOGO_BLACK"
    else
        echo "   ❌ NÃO encontrado em: storage/app/public/$LOGO_BLACK"
    fi
fi
echo ""

echo "3️⃣ Verificando symlink do storage:"
echo "───────────────────────────────────────────────────────────────"
if [ -L "public/storage" ]; then
    echo "   ✅ Symlink existe"
    SYMLINK_TARGET=$(readlink -f public/storage)
    echo "   Aponta para: $SYMLINK_TARGET"
    
    # Verificar se o caminho do symlink está correto
    if [ "$SYMLINK_TARGET" = "$(pwd)/storage/app/public" ] || [ "$SYMLINK_TARGET" = "../storage/app/public" ]; then
        echo "   ✅ Caminho do symlink está correto"
    else
        echo "   ⚠️  Caminho do symlink pode estar incorreto"
    fi
else
    echo "   ❌ Symlink NÃO existe"
    echo "   Criando symlink..."
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

echo "4️⃣ Verificando se os arquivos são acessíveis via symlink:"
echo "───────────────────────────────────────────────────────────────"
if [ ! -z "$LOGO_WHITE" ] && [ -L "public/storage" ]; then
    if [ -f "public/storage/$LOGO_WHITE" ]; then
        echo "   ✅ Logo White acessível via symlink: public/storage/$LOGO_WHITE"
    else
        echo "   ❌ Logo White NÃO acessível via symlink"
        echo "   Verificando se o diretório existe..."
        mkdir -p "public/storage/$(dirname "$LOGO_WHITE")"
        if [ -f "storage/app/public/$LOGO_WHITE" ]; then
            echo "   Copiando arquivo para public/storage..."
            cp "storage/app/public/$LOGO_WHITE" "public/storage/$LOGO_WHITE"
            chmod 644 "public/storage/$LOGO_WHITE"
        fi
    fi
fi

if [ ! -z "$LOGO_BLACK" ] && [ -L "public/storage" ]; then
    if [ -f "public/storage/$LOGO_BLACK" ]; then
        echo "   ✅ Logo Black acessível via symlink: public/storage/$LOGO_BLACK"
    else
        echo "   ❌ Logo Black NÃO acessível via symlink"
        echo "   Verificando se o diretório existe..."
        mkdir -p "public/storage/$(dirname "$LOGO_BLACK")"
        if [ -f "storage/app/public/$LOGO_BLACK" ]; then
            echo "   Copiando arquivo para public/storage..."
            cp "storage/app/public/$LOGO_BLACK" "public/storage/$LOGO_BLACK"
            chmod 644 "public/storage/$LOGO_BLACK"
        fi
    fi
fi
echo ""

echo "5️⃣ Testando URLs dos logos:"
echo "───────────────────────────────────────────────────────────────"
if [ ! -z "$LOGO_WHITE" ]; then
    LOGO_WHITE_URL="https://betgeniusbr.com/storage/$LOGO_WHITE"
    echo "   Testando: $LOGO_WHITE_URL"
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -I "$LOGO_WHITE_URL")
    CONTENT_TYPE=$(curl -s -o /dev/null -w "%{content_type}" -I "$LOGO_WHITE_URL")
    CONTENT_LENGTH=$(curl -s -o /dev/null -w "%{size_download}" -I "$LOGO_WHITE_URL")
    echo "   HTTP: $HTTP_CODE | Content-Type: $CONTENT_TYPE | Size: $CONTENT_LENGTH bytes"
    
    if [ "$HTTP_CODE" = "200" ] && [[ "$CONTENT_TYPE" == *"image"* ]]; then
        echo "   ✅ Logo White está sendo servido corretamente"
    else
        echo "   ❌ Logo White NÃO está sendo servido como imagem"
        echo "   Resposta completa:"
        curl -s -I "$LOGO_WHITE_URL" | head -5
    fi
fi
echo ""

if [ ! -z "$LOGO_BLACK" ]; then
    LOGO_BLACK_URL="https://betgeniusbr.com/storage/$LOGO_BLACK"
    echo "   Testando: $LOGO_BLACK_URL"
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -I "$LOGO_BLACK_URL")
    CONTENT_TYPE=$(curl -s -o /dev/null -w "%{content_type}" -I "$LOGO_BLACK_URL")
    CONTENT_LENGTH=$(curl -s -o /dev/null -w "%{size_download}" -I "$LOGO_BLACK_URL")
    echo "   HTTP: $HTTP_CODE | Content-Type: $CONTENT_TYPE | Size: $CONTENT_LENGTH bytes"
    
    if [ "$HTTP_CODE" = "200" ] && [[ "$CONTENT_TYPE" == *"image"* ]]; then
        echo "   ✅ Logo Black está sendo servido corretamente"
    else
        echo "   ❌ Logo Black NÃO está sendo servido como imagem"
        echo "   Resposta completa:"
        curl -s -I "$LOGO_BLACK_URL" | head -5
    fi
fi
echo ""

echo "6️⃣ Verificando permissões:"
echo "───────────────────────────────────────────────────────────────"
if [ ! -z "$LOGO_WHITE" ] && [ -f "storage/app/public/$LOGO_WHITE" ]; then
    ls -lh "storage/app/public/$LOGO_WHITE"
fi
if [ ! -z "$LOGO_BLACK" ] && [ -f "storage/app/public/$LOGO_BLACK" ]; then
    ls -lh "storage/app/public/$LOGO_BLACK"
fi
echo ""

echo "7️⃣ Limpando cache do Laravel:"
echo "───────────────────────────────────────────────────────────────"
php artisan config:clear 2>/dev/null
php artisan cache:clear 2>/dev/null
php artisan route:clear 2>/dev/null
echo "   ✅ Cache limpo"
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ DIAGNÓSTICO CONCLUÍDO"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "💡 PRÓXIMOS PASSOS:"
echo "   1. Se os arquivos não existem, faça upload novamente via admin"
echo "   2. Se os arquivos existem mas não são servidos, verifique o symlink"
echo "   3. Limpe o cache do navegador (Ctrl+Shift+R)"
echo ""

