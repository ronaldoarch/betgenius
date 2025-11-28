#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO STORAGE SYMLINK E MOVENDO ARQUIVOS"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Verificando se public/storage é symlink ou diretório:"
echo "───────────────────────────────────────────────────────────────"
if [ -L "public/storage" ]; then
    echo "   ✅ É symlink"
    ls -la public/storage | head -1
elif [ -d "public/storage" ]; then
    echo "   ⚠️  É um diretório real (não é symlink!)"
    echo "   Isso está causando o problema"
    echo "   Vamos mover os arquivos e recriar o symlink"
else
    echo "   ❌ Não existe"
fi
echo ""

echo "2️⃣ Buscando paths dos logos na API:"
echo "───────────────────────────────────────────────────────────────"
LOGO_WHITE=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/data | grep -o '"software_logo_white":"[^"]*' | cut -d'"' -f4 | sed 's/\\//g')
LOGO_BLACK=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/data | grep -o '"software_logo_black":"[^"]*' | cut -d'"' -f4 | sed 's/\\//g')
echo "   Logo White: $LOGO_WHITE"
echo "   Logo Black: $LOGO_BLACK"
echo ""

echo "3️⃣ Movendo arquivos de public/storage para storage/app/public:"
echo "───────────────────────────────────────────────────────────────"
if [ -d "public/storage" ] && [ ! -L "public/storage" ]; then
    echo "   public/storage é um diretório real, vamos mover os arquivos..."
    
    # Criar diretório de destino se não existir
    mkdir -p "storage/app/public/uploads"
    
    # Mover todos os arquivos de public/storage para storage/app/public
    if [ -d "public/storage/uploads" ]; then
        echo "   Movendo arquivos de public/storage/uploads para storage/app/public/uploads..."
        cp -r public/storage/uploads/* storage/app/public/uploads/ 2>/dev/null
        echo "   ✅ Arquivos copiados"
    fi
    
    # Mover outros diretórios também
    for dir in public/storage/*/; do
        if [ -d "$dir" ] && [ "$(basename "$dir")" != "uploads" ]; then
            DIR_NAME=$(basename "$dir")
            echo "   Movendo $DIR_NAME..."
            mkdir -p "storage/app/public/$DIR_NAME"
            cp -r "$dir"* "storage/app/public/$DIR_NAME/" 2>/dev/null
        fi
    done
    
    echo "   ✅ Arquivos movidos"
else
    echo "   public/storage já é symlink ou não existe"
fi
echo ""

echo "4️⃣ Removendo public/storage e criando symlink correto:"
echo "───────────────────────────────────────────────────────────────"
if [ -d "public/storage" ] && [ ! -L "public/storage" ]; then
    echo "   Fazendo backup de public/storage..."
    mv public/storage public/storage.backup.$(date +%Y%m%d_%H%M%S)
    echo "   ✅ Backup criado"
fi

# Remover se existir (symlink ou diretório)
rm -rf public/storage

# Criar symlink
echo "   Criando symlink..."
php artisan storage:link 2>&1 | grep -v "namespace\|class\|protected\|public\|function\|this->call\|INFO\|ERROR" || true

if [ -L "public/storage" ]; then
    echo "   ✅ Symlink criado com sucesso"
    ls -la public/storage | head -1
else
    echo "   ⚠️  Erro ao criar symlink via artisan, tentando manualmente..."
    ln -s ../storage/app/public public/storage
    if [ -L "public/storage" ]; then
        echo "   ✅ Symlink criado manualmente"
    else
        echo "   ❌ Erro ao criar symlink"
    fi
fi
echo ""

echo "5️⃣ Verificando se os logos existem agora:"
echo "───────────────────────────────────────────────────────────────"
if [ ! -z "$LOGO_WHITE" ]; then
    if [ -f "storage/app/public/$LOGO_WHITE" ]; then
        echo "   ✅ Logo White existe: storage/app/public/$LOGO_WHITE"
        ls -lh "storage/app/public/$LOGO_WHITE"
    else
        echo "   ❌ Logo White ainda não existe"
    fi
fi

if [ ! -z "$LOGO_BLACK" ]; then
    if [ -f "storage/app/public/$LOGO_BLACK" ]; then
        echo "   ✅ Logo Black existe: storage/app/public/$LOGO_BLACK"
        ls -lh "storage/app/public/$LOGO_BLACK"
    else
        echo "   ❌ Logo Black ainda não existe"
    fi
fi
echo ""

echo "6️⃣ Verificando se são acessíveis via symlink:"
echo "───────────────────────────────────────────────────────────────"
if [ -L "public/storage" ]; then
    if [ ! -z "$LOGO_WHITE" ] && [ -f "public/storage/$LOGO_WHITE" ]; then
        echo "   ✅ Logo White acessível via symlink"
    else
        echo "   ❌ Logo White NÃO acessível via symlink"
    fi
    
    if [ ! -z "$LOGO_BLACK" ] && [ -f "public/storage/$LOGO_BLACK" ]; then
        echo "   ✅ Logo Black acessível via symlink"
    else
        echo "   ❌ Logo Black NÃO acessível via symlink"
    fi
fi
echo ""

echo "7️⃣ Ajustando permissões:"
echo "───────────────────────────────────────────────────────────────"
chmod -R 755 storage/app/public
chmod -R 644 storage/app/public/uploads/*.png 2>/dev/null || true
echo "   ✅ Permissões ajustadas"
echo ""

echo "8️⃣ Testando URLs dos logos:"
echo "───────────────────────────────────────────────────────────────"
if [ ! -z "$LOGO_WHITE" ]; then
    LOGO_WHITE_URL="https://betgeniusbr.com/storage/$LOGO_WHITE"
    echo "   Testando: $LOGO_WHITE_URL"
    sleep 2
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -I "$LOGO_WHITE_URL")
    CONTENT_TYPE=$(curl -s -o /dev/null -w "%{content_type}" -I "$LOGO_WHITE_URL")
    echo "   HTTP: $HTTP_CODE | Content-Type: $CONTENT_TYPE"
    if [ "$HTTP_CODE" = "200" ] && [[ "$CONTENT_TYPE" == *"image"* ]]; then
        echo "   ✅ Logo White está sendo servido corretamente!"
    else
        echo "   ❌ Logo White ainda não está sendo servido como imagem"
    fi
fi

if [ ! -z "$LOGO_BLACK" ]; then
    LOGO_BLACK_URL="https://betgeniusbr.com/storage/$LOGO_BLACK"
    echo "   Testando: $LOGO_BLACK_URL"
    sleep 2
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -I "$LOGO_BLACK_URL")
    CONTENT_TYPE=$(curl -s -o /dev/null -w "%{content_type}" -I "$LOGO_BLACK_URL")
    echo "   HTTP: $HTTP_CODE | Content-Type: $CONTENT_TYPE"
    if [ "$HTTP_CODE" = "200" ] && [[ "$CONTENT_TYPE" == *"image"* ]]; then
        echo "   ✅ Logo Black está sendo servido corretamente!"
    else
        echo "   ❌ Logo Black ainda não está sendo servido como imagem"
    fi
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ CORREÇÃO CONCLUÍDA"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "💡 Se ainda não funcionar:"
echo "   1. Limpe o cache do navegador (Ctrl+Shift+R)"
echo "   2. Verifique o Console do navegador (F12) para erros"
echo "   3. Aguarde 1-2 minutos e tente novamente"
echo ""

