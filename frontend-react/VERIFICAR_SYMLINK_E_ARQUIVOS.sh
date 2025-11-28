#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 VERIFICANDO SYMLINK E BUSCANDO ARQUIVOS"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Verificando symlink public/storage:"
echo "───────────────────────────────────────────────────────────────"
if [ -L public/storage ]; then
    echo "   ✅ É symlink"
    echo "   Destino: $(readlink -f public/storage)"
    echo "   Verificando se o destino existe:"
    if [ -d "$(readlink -f public/storage)" ]; then
        echo "   ✅ Destino existe"
    else
        echo "   ❌ Destino NÃO existe - Removendo symlink quebrado..."
        rm public/storage
        php artisan storage:link
        echo "   ✅ Symlink recriado"
    fi
else
    echo "   ❌ NÃO é symlink - Criando..."
    php artisan storage:link
    echo "   ✅ Symlink criado"
fi
echo ""

echo "2️⃣ Listando TODOS os arquivos em storage/app/public/uploads:"
echo "───────────────────────────────────────────────────────────────"
ls -la storage/app/public/uploads 2>/dev/null | head -20
echo ""

echo "3️⃣ Listando TODOS os arquivos em public/storage:"
echo "───────────────────────────────────────────────────────────────"
ls -la public/storage 2>/dev/null | head -20
echo ""

echo "4️⃣ Buscando arquivos PNG e JPG em storage/app/public:"
echo "───────────────────────────────────────────────────────────────"
find storage/app/public -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.JPG" -o -name "*.PNG" \) 2>/dev/null | head -10
echo ""

echo "5️⃣ Verificando se public/storage/uploads existe:"
echo "───────────────────────────────────────────────────────────────"
if [ -d "public/storage/uploads" ]; then
    echo "   ✅ Diretório existe"
    ls -la public/storage/uploads | head -10
else
    echo "   ❌ Diretório não existe"
    echo "   Criando diretório..."
    mkdir -p public/storage/uploads
    chmod 755 public/storage/uploads
    echo "   ✅ Diretório criado"
fi
echo ""

echo "6️⃣ Testando acesso via URL:"
echo "───────────────────────────────────────────────────────────────"
echo "Testando: https://betgeniusbr.com/storage/uploads/Nx72GR0pqlAV4i7TGLzp7ltgEP55R8raNB0pBI1q.png"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/storage/uploads/Nx72GR0pqlAV4i7TGLzp7ltgEP55R8raNB0pBI1q.png)
if [ "$HTTP_CODE" = "200" ]; then
    echo "   ✅ Arquivo acessível via URL (HTTP 200)"
elif [ "$HTTP_CODE" = "404" ]; then
    echo "   ❌ Arquivo NÃO encontrado (HTTP 404)"
else
    echo "   ⚠️  Código HTTP: $HTTP_CODE"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"

