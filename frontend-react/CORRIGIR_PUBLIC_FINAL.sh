#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "=== Corrigindo .htaccess em public/ com regra mais específica ==="

cat > public/.htaccess << 'EOF'
<IfModule mod_rewrite.c>
    <IfModule mod_negotiation.c>
        Options -MultiViews -Indexes
    </IfModule>

    RewriteEngine On

    # Handle Authorization Header
    RewriteCond %{HTTP:Authorization} .
    RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]

    # PRIMEIRO: Admin (zirigui) → Laravel index.php
    # Capturar QUALQUER requisição que comece com /zirigui
    RewriteCond %{REQUEST_URI} ^/zirigui [NC,OR]
    RewriteCond %{REQUEST_URI} ^/zirigui/ [NC]
    RewriteRule ^.*$ index.php [L]

    # SEGUNDO: API → Laravel index.php
    RewriteCond %{REQUEST_URI} ^/api [NC]
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule ^ index.php [L]

    # TERCEIRO: Servir arquivos e diretórios existentes diretamente
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteRule ^ - [L]

    RewriteCond %{REQUEST_FILENAME} -d
    RewriteRule ^ - [L]

    # QUARTO: Storage → Servir diretamente se arquivo existir
    RewriteCond %{REQUEST_URI} ^/storage/ [NC]
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteRule ^ - [L]

    # QUINTO: Redirect Trailing Slashes
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_URI} ^(.+)/$
    RewriteRule ^ %1 [L,R=301]

    # ÚLTIMO: Tudo mais → React index.html
    # Mas NÃO se for /zirigui ou /api
    RewriteCond %{REQUEST_URI} !^/zirigui [NC]
    RewriteCond %{REQUEST_URI} !^/api [NC]
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule ^ index.html [L]
</IfModule>
EOF

echo "✅ .htaccess atualizado"
echo ""

echo "=== Verificando conteúdo ==="
cat public/.htaccess | head -25
echo ""

echo "=== Limpando cache ==="
php artisan config:clear
php artisan cache:clear
php artisan route:clear
echo ""

echo "=== Testando /zirigui ==="
curl -s -I "https://betgeniusbr.com/zirigui" | head -10
echo ""

echo "=== Testando conteúdo ==="
curl -s "https://betgeniusbr.com/zirigui" | head -20
echo ""

echo "✅ Correção concluída!"

