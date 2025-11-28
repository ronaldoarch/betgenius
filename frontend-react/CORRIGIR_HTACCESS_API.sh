#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html/public

echo "🔧 CORRIGINDO .htaccess PARA ROTEAR API CORRETAMENTE..."
echo ""

# Backup
cp .htaccess .htaccess.backup.$(date +%Y%m%d_%H%M%S) 2>/dev/null
echo "✅ Backup criado"
echo ""

# Criar novo .htaccess
cat > .htaccess << 'HTACCESSEOF'
<IfModule mod_rewrite.c>
    <IfModule mod_negotiation.c>
        Options -MultiViews -Indexes
    </IfModule>

    RewriteEngine On
    RewriteBase /

    # Handle Authorization Header
    RewriteCond %{HTTP:Authorization} .
    RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]

    # API, Admin e Storage → Laravel (index.php)
    RewriteCond %{REQUEST_URI} ^/api [NC,OR]
    RewriteCond %{REQUEST_URI} ^/admin [NC,OR]
    RewriteCond %{REQUEST_URI} ^/storage [NC]
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule ^ index.php [L]

    # Arquivos estáticos → Servir diretamente
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteRule ^ - [L]

    RewriteCond %{REQUEST_FILENAME} -d
    RewriteRule ^ - [L]

    # Redirect Trailing Slashes If Not A Folder...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_URI} ^(.+)/$
    RewriteRule ^ %1 [L,R=301]

    # Tudo mais → React (index.html)
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_URI} !^/api
    RewriteCond %{REQUEST_URI} !^/admin
    RewriteCond %{REQUEST_URI} !^/storage
    RewriteRule ^ index.html [L]
</IfModule>

DirectoryIndex index.html index.php
HTACCESSEOF

chmod 644 .htaccess

echo "✅ .htaccess corrigido!"
echo ""
echo "═══════════════════════════════════════════════════════════════"
echo "🧪 TESTANDO APIs..."
echo "═══════════════════════════════════════════════════════════════"
echo ""

sleep 2

echo "1. /api/games/all:"
curl -s -H "Accept: application/json" https://betgeniusbr.com/api/games/all | head -c 200
echo ""
echo ""

echo "2. /api/settings/banners:"
curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/banners | head -c 200
echo ""
echo ""

echo "3. /api/categories:"
curl -s -H "Accept: application/json" https://betgeniusbr.com/api/categories | head -c 200
echo ""
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ Se aparecer JSON (começando com { ou [), está funcionando!"
echo "❌ Se aparecer HTML (começando com <!DOCTYPE), ainda há problema."
echo "═══════════════════════════════════════════════════════════════"
