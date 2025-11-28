#!/bin/bash

# ============================================================
# ✅ VERIFICAR E CORRIGIR .HTACCESS EM PUBLIC/
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 VERIFICANDO E CORRIGINDO .HTACCESS EM PUBLIC/"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html/public

echo "1️⃣ Verificando .htaccess atual..."
if [ -f ".htaccess" ]; then
    echo "✅ .htaccess existe"
    echo ""
    echo "Conteúdo atual:"
    cat .htaccess
    echo ""
else
    echo "❌ .htaccess não existe"
fi
echo ""

echo "2️⃣ Verificando se DirectoryIndex está configurado..."
if grep -q "DirectoryIndex index.html" .htaccess 2>/dev/null; then
    echo "✅ DirectoryIndex index.html encontrado"
else
    echo "⚠️  DirectoryIndex index.html NÃO encontrado"
    echo "   Adicionando..."
fi
echo ""

echo "3️⃣ Criando .htaccess correto..."
cat > .htaccess << 'EOF'
Options +FollowSymLinks -Indexes
DirectoryIndex index.html index.php

RewriteEngine On
RewriteBase /

# Permitir acesso direto a arquivos estáticos
RewriteCond %{REQUEST_FILENAME} -f
RewriteRule ^ - [L]

RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]

# API do Laravel
RewriteCond %{REQUEST_URI} ^/api [NC]
RewriteRule ^ index.php [L]

# Admin do Laravel
RewriteCond %{REQUEST_URI} ^/admin [NC]
RewriteRule ^ index.php [L]

# Storage do Laravel
RewriteCond %{REQUEST_URI} ^/storage [NC]
RewriteRule ^ index.php [L]

# Tudo mais vai para index.html (React)
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^ index.html [L]
EOF

chmod 644 .htaccess
echo "✅ .htaccess atualizado"
echo ""

echo "4️⃣ Verificando permissões de index.html..."
chmod 644 index.html
ls -lh index.html
echo ""

echo "5️⃣ Verificando se index.html é legível..."
if [ -r "index.html" ]; then
    echo "✅ index.html é legível"
else
    echo "❌ index.html NÃO é legível!"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ VERIFICAÇÃO CONCLUÍDA!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 TESTE AGORA:"
echo "   1. Limpe o cache do navegador (Ctrl+Shift+R)"
echo "   2. Teste: https://betgeniusbr.com/"
echo ""
echo "⚠️  Se ainda der 403:"
echo "   O problema é o Document Root. Ele precisa estar em public_html"
echo "   (não em public_html/public). Contate o suporte do Hostinger."
echo ""
echo "═══════════════════════════════════════════════════════════════"

