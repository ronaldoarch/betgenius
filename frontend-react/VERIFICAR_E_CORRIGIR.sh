#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html/public

echo "🔍 Verificando .htaccess atual..."
echo ""
cat .htaccess
echo ""
echo "═══════════════════════════════════════════════════════════════"
echo ""

# Verificar se o arquivo foi criado corretamente
if [ -f .htaccess ]; then
    echo "✅ .htaccess existe"
    LINES=$(wc -l < .htaccess)
    echo "   Linhas: $LINES"
    echo ""
    
    # Verificar se contém as regras da API
    if grep -q "^/api" .htaccess || grep -q "REQUEST_URI.*api" .htaccess; then
        echo "✅ Contém regras para API"
    else
        echo "❌ NÃO contém regras para API - Vou corrigir..."
        echo ""
        
        # Backup
        cp .htaccess .htaccess.backup.$(date +%Y%m%d_%H%M%S) 2>/dev/null
        
        # Criar novo .htaccess
        cat > .htaccess << 'EOF'
<IfModule mod_rewrite.c>
    <IfModule mod_negotiation.c>
        Options -MultiViews -Indexes
    </IfModule>

    RewriteEngine On
    RewriteBase /

    # Handle Authorization Header
    RewriteCond %{HTTP:Authorization} .
    RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]

    # API/Admin/Storage PRIMEIRO → Laravel (index.php)
    RewriteCond %{REQUEST_URI} ^/api [NC,OR]
    RewriteCond %{REQUEST_URI} ^/admin [NC,OR]
    RewriteCond %{REQUEST_URI} ^/storage [NC]
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
    RewriteRule ^ index.html [L]
</IfModule>

DirectoryIndex index.html index.php
EOF
        
        chmod 644 .htaccess
        echo "✅ .htaccess corrigido!"
    fi
else
    echo "❌ .htaccess NÃO existe - Criando..."
    cat > .htaccess << 'EOF'
<IfModule mod_rewrite.c>
    <IfModule mod_negotiation.c>
        Options -MultiViews -Indexes
    </IfModule>

    RewriteEngine On
    RewriteBase /

    # Handle Authorization Header
    RewriteCond %{HTTP:Authorization} .
    RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]

    # API/Admin/Storage PRIMEIRO → Laravel (index.php)
    RewriteCond %{REQUEST_URI} ^/api [NC,OR]
    RewriteCond %{REQUEST_URI} ^/admin [NC,OR]
    RewriteCond %{REQUEST_URI} ^/storage [NC]
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
    RewriteRule ^ index.html [L]
</IfModule>

DirectoryIndex index.html index.php
EOF
    
    chmod 644 .htaccess
    echo "✅ .htaccess criado!"
fi

echo ""
echo "═══════════════════════════════════════════════════════════════"
echo "🧪 Testando APIs..."
echo "═══════════════════════════════════════════════════════════════"
echo ""

sleep 2

echo "1. /api/games/all:"
RESPONSE1=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/games/all | head -c 200)
echo "$RESPONSE1"
echo ""

if [[ "$RESPONSE1" == "{"* ]] || [[ "$RESPONSE1" == "["* ]]; then
    echo "   ✅ Retornou JSON!"
else
    echo "   ❌ Retornou HTML (problema)"
fi

echo ""
echo "2. /api/settings/banners:"
RESPONSE2=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/banners | head -c 200)
echo "$RESPONSE2"
echo ""

if [[ "$RESPONSE2" == "{"* ]] || [[ "$RESPONSE2" == "["* ]]; then
    echo "   ✅ Retornou JSON!"
else
    echo "   ❌ Retornou HTML (problema)"
fi

echo ""
echo "3. /api/categories:"
RESPONSE3=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/categories | head -c 200)
echo "$RESPONSE3"
echo ""

if [[ "$RESPONSE3" == "{"* ]] || [[ "$RESPONSE3" == "["* ]]; then
    echo "   ✅ Retornou JSON!"
else
    echo "   ❌ Retornou HTML (problema)"
fi

echo ""
echo "═══════════════════════════════════════════════════════════════"

