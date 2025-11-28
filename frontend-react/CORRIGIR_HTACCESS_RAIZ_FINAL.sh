#!/bin/bash

# ============================================================
# ✅ CORRIGIR .HTACCESS NA RAIZ - SOLUÇÃO FINAL
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO .HTACCESS NA RAIZ - SOLUÇÃO FINAL"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Fazendo backup do .htaccess atual..."
cp .htaccess .htaccess.backup.$(date +%Y%m%d_%H%M%S)
echo "✅ Backup criado"
echo ""

echo "2️⃣ Criando .htaccess correto na raiz..."
cat > .htaccess << 'EOF'
Options +FollowSymLinks +SymLinksIfOwnerMatch
RewriteEngine On
RewriteBase /

# Permitir acesso direto a arquivos e diretórios existentes na raiz
RewriteCond %{REQUEST_FILENAME} -f
RewriteRule ^ - [L]

RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]

# Redirecionar tudo para public/ (incluindo a raiz /)
RewriteCond %{REQUEST_URI} !^/public/
RewriteRule ^(.*)$ public/$1 [L]
EOF

chmod 644 .htaccess
echo "✅ .htaccess atualizado"
echo ""

echo "3️⃣ Verificando permissões..."
chmod 755 .
chmod 755 public/
chmod 644 public/index.html
chmod 644 public/.htaccess
echo "✅ Permissões ajustadas"
echo ""

echo "4️⃣ Verificando .htaccess em public/..."
if grep -q "DirectoryIndex index.html" public/.htaccess; then
    echo "✅ DirectoryIndex index.html está configurado em public/"
else
    echo "⚠️  Atualizando .htaccess em public/..."
    cat > public/.htaccess << 'EOFPUBLIC'
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
EOFPUBLIC
    chmod 644 public/.htaccess
    echo "✅ .htaccess em public/ atualizado"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ CORREÇÃO CONCLUÍDA!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 TESTE AGORA:"
echo "   1. Limpe o cache do navegador (Ctrl+Shift+R)"
echo "   2. Teste: https://betgeniusbr.com/"
echo ""
echo "═══════════════════════════════════════════════════════════════"

