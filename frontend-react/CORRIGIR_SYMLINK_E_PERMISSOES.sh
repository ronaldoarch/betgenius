#!/bin/bash

# ============================================================
# ✅ CORRIGIR SYMLINK E PERMISSÕES FINAIS
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO SYMLINK E PERMISSÕES"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando symlink assets..."
if [ -L "public/assets" ]; then
    echo "✅ public/assets é um symlink"
    ls -ld public/assets
    echo "Apontando para:"
    readlink public/assets
    echo ""
    echo "Removendo symlink antigo..."
    rm -f public/assets
    echo "✅ Symlink removido"
fi
echo ""

echo "2️⃣ Garantindo que public/assets/ existe como diretório..."
if [ ! -d "public/assets" ]; then
    echo "Criando diretório public/assets/..."
    mkdir -p public/assets
    echo "✅ Diretório criado"
fi
echo ""

echo "3️⃣ Copiando arquivos de app/assets para assets (se necessário)..."
if [ -f "public/app/assets/index-DrMwNlRZ.js" ] && [ ! -f "public/assets/index-DrMwNlRZ.js" ]; then
    echo "Copiando arquivos..."
    cp -r public/app/assets/* public/assets/ 2>/dev/null
    echo "✅ Arquivos copiados"
elif [ -f "public/assets/index-DrMwNlRZ.js" ]; then
    echo "✅ Arquivos já existem em public/assets/"
fi
echo ""

echo "4️⃣ Ajustando permissões finais..."
chmod 755 .
chmod 755 public/
chmod 644 public/index.html
chmod 644 public/index.php 2>/dev/null
chmod 755 public/assets/ 2>/dev/null
chmod 644 public/assets/*.js 2>/dev/null
chmod 644 public/assets/*.css 2>/dev/null
chmod 644 .htaccess
chmod 644 public/.htaccess
echo "✅ Permissões ajustadas"
echo ""

echo "5️⃣ Verificando estrutura final..."
echo "public/index.html:"
ls -lh public/index.html
echo ""
echo "public/assets/:"
ls -lh public/assets/ | head -5
echo ""

echo "6️⃣ Testando acesso aos arquivos..."
if [ -r "public/index.html" ]; then
    echo "✅ public/index.html é legível"
else
    echo "❌ public/index.html NÃO é legível!"
fi

if [ -r "public/assets/index-DrMwNlRZ.js" ]; then
    echo "✅ public/assets/index-DrMwNlRZ.js é legível"
else
    echo "❌ public/assets/index-DrMwNlRZ.js NÃO é legível!"
fi

if [ -r "public/assets/index-R46pBGYW.css" ]; then
    echo "✅ public/assets/index-R46pBGYW.css é legível"
else
    echo "❌ public/assets/index-R46pBGYW.css NÃO é legível!"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ CORREÇÃO CONCLUÍDA!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 TESTE AGORA:"
echo "   1. Limpe o cache do navegador (Ctrl+Shift+R)"
echo "   2. Acesse: https://betgeniusbr.com/"
echo ""
echo "⚠️  Se ainda der erro 403:"
echo "   O problema é CERTAMENTE o Document Root no hPanel."
echo "   Document Root DEVE estar: public_html"
echo "   Document Root NÃO deve estar: public_html/public"
echo ""
echo "═══════════════════════════════════════════════════════════════"

