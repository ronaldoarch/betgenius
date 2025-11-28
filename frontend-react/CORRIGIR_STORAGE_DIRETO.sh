#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO .htaccess - Servir Storage Diretamente"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Verificando .htaccess atual:"
echo "───────────────────────────────────────────────────────────────"
cat .htaccess
echo ""
echo ""

echo "2️⃣ Corrigindo .htaccess para servir storage diretamente:"
echo "───────────────────────────────────────────────────────────────"
cp .htaccess .htaccess.backup.$(date +%Y%m%d_%H%M%S) 2>/dev/null

cat > .htaccess << 'EOF'
DirectoryIndex index.php index.html

Options +FollowSymLinks +SymLinksIfOwnerMatch
RewriteEngine On
RewriteBase /

# Arquivos e diretórios existentes → Servir diretamente (PRIMEIRO!)
RewriteCond %{REQUEST_FILENAME} -f
RewriteRule ^ - [L]

RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]

# API → Executar index.php na raiz
RewriteCond %{REQUEST_URI} ^/api [NC]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^ index.php [L]

# Admin → Executar index.php na raiz
RewriteCond %{REQUEST_URI} ^/admin [NC]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^ index.php [L]

# Storage (apenas se não for arquivo) → Executar index.php na raiz
RewriteCond %{REQUEST_URI} ^/storage [NC]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^ index.php [L]

# Redirecionar tudo mais para public/
RewriteRule ^(.*)$ public/$1 [L]
EOF

chmod 644 .htaccess
echo "✅ .htaccess corrigido!"
echo ""
echo ""

echo "3️⃣ Verificando .htaccess em public/:"
echo "───────────────────────────────────────────────────────────────"
cat public/.htaccess | head -20
echo ""
echo ""

echo "4️⃣ Aguardando 3 segundos..."
sleep 3
echo ""

echo "5️⃣ Testando arquivo de imagem:"
echo "───────────────────────────────────────────────────────────────"
curl -s -I https://betgeniusbr.com/storage/Games/Pragmatic_Oficial/vs10amm.webp | head -5
echo ""

echo "═══════════════════════════════════════════════════════════════"

