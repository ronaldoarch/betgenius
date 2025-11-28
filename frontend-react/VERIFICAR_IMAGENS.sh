#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 VERIFICANDO IMAGENS DE BANNERS E LOGO"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Verificando estrutura de storage:"
echo "───────────────────────────────────────────────────────────────"
ls -la public/storage 2>/dev/null | head -5 || echo "   ⚠️  public/storage não existe ou não é acessível"
echo ""

echo "2️⃣ Verificando se storage é symlink:"
echo "───────────────────────────────────────────────────────────────"
if [ -L public/storage ]; then
    echo "   ✅ public/storage é um symlink"
    ls -la public/storage | head -1
    echo "   Destino: $(readlink -f public/storage)"
else
    echo "   ⚠️  public/storage não é um symlink"
fi
echo ""

echo "3️⃣ Buscando logo na API e verificando se existe:"
echo "───────────────────────────────────────────────────────────────"
LOGO_PATH=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/data | grep -o '"software_logo_white":"[^"]*' | cut -d'"' -f4)
if [ -n "$LOGO_PATH" ]; then
    echo "   Logo path da API: $LOGO_PATH"
    echo "   URL completa seria: https://betgeniusbr.com/storage/$LOGO_PATH"
    
    # Verificar se existe em storage/app/public
    if [ -f "storage/app/public/$LOGO_PATH" ]; then
        echo "   ✅ Arquivo existe em: storage/app/public/$LOGO_PATH"
    else
        echo "   ❌ Arquivo NÃO existe em: storage/app/public/$LOGO_PATH"
    fi
    
    # Verificar se existe em public/storage
    if [ -f "public/storage/$LOGO_PATH" ]; then
        echo "   ✅ Arquivo existe em: public/storage/$LOGO_PATH"
    else
        echo "   ❌ Arquivo NÃO existe em: public/storage/$LOGO_PATH"
    fi
else
    echo "   ⚠️  Não foi possível obter o logo path da API"
fi
echo ""

echo "4️⃣ Buscando primeiro banner na API e verificando se existe:"
echo "───────────────────────────────────────────────────────────────"
BANNER_IMAGE=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/banners | grep -o '"image":"[^"]*' | head -1 | cut -d'"' -f4)
if [ -n "$BANNER_IMAGE" ]; then
    echo "   Banner image da API: $BANNER_IMAGE"
    echo "   URL completa seria: https://betgeniusbr.com/storage/$BANNER_IMAGE"
    
    # Verificar se existe em storage/app/public
    if [ -f "storage/app/public/$BANNER_IMAGE" ]; then
        echo "   ✅ Arquivo existe em: storage/app/public/$BANNER_IMAGE"
    else
        echo "   ❌ Arquivo NÃO existe em: storage/app/public/$BANNER_IMAGE"
        echo "   Buscando em outros locais..."
        find storage -name "$BANNER_IMAGE" 2>/dev/null | head -3
    fi
    
    # Verificar se existe em public/storage
    if [ -f "public/storage/$BANNER_IMAGE" ]; then
        echo "   ✅ Arquivo existe em: public/storage/$BANNER_IMAGE"
    else
        echo "   ❌ Arquivo NÃO existe em: public/storage/$BANNER_IMAGE"
    fi
else
    echo "   ⚠️  Não foi possível obter o banner image da API"
fi
echo ""

echo "5️⃣ Listando arquivos em storage/app/public/uploads:"
echo "───────────────────────────────────────────────────────────────"
ls -la storage/app/public/uploads 2>/dev/null | head -10 || echo "   ⚠️  Diretório não existe"
echo ""

echo "6️⃣ Listando arquivos em public/storage (se existir):"
echo "───────────────────────────────────────────────────────────────"
ls -la public/storage 2>/dev/null | head -10 || echo "   ⚠️  Diretório não existe"
echo ""

echo "═══════════════════════════════════════════════════════════════"

