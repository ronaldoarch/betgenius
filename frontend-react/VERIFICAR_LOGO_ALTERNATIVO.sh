#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 VERIFICANDO LOGOS DISPONÍVEIS"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Listando arquivos PNG em storage/app/public/uploads:"
echo "───────────────────────────────────────────────────────────────"
find storage/app/public/uploads -name "*.png" -type f 2>/dev/null | head -10
echo ""

echo "2️⃣ Listando arquivos PNG em public/storage:"
echo "───────────────────────────────────────────────────────────────"
find public/storage -name "*.png" -type f 2>/dev/null | head -10
echo ""

echo "3️⃣ Verificando se o diretório uploads existe:"
echo "───────────────────────────────────────────────────────────────"
if [ -d "public/storage/uploads" ]; then
    echo "   ✅ Diretório existe"
    ls -la public/storage/uploads | head -10
else
    echo "   ❌ Diretório não existe - Criando..."
    mkdir -p public/storage/uploads
    chmod 755 public/storage/uploads
    echo "   ✅ Diretório criado"
fi
echo ""

echo "4️⃣ Verificando se há logos em storage/app/public/uploads:"
echo "───────────────────────────────────────────────────────────────"
ls -la storage/app/public/uploads/*.png 2>/dev/null | head -5 || echo "   Nenhum PNG encontrado"
echo ""

echo "5️⃣ Verificando o que a API retorna para o logo:"
echo "───────────────────────────────────────────────────────────────"
LOGO_PATH=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/data | grep -o '"software_logo_white":"[^"]*' | cut -d'"' -f4)
echo "   Logo path da API: $LOGO_PATH"
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "💡 SOLUÇÃO:"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "Se o logo não existe, você precisa:"
echo "1. Fazer upload do logo via painel admin (Filament)"
echo "2. Ou copiar um logo existente para o caminho correto"
echo ""
echo "O caminho esperado é: public/storage/uploads/Nx72GR0pqlAV4i7TGLzp7ltgEP55R8raNB0pBI1q.png"
echo "═══════════════════════════════════════════════════════════════"

