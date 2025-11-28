#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "=== Corrigindo .htaccess para servir /storage/ corretamente ==="

# Corrigir .htaccess na raiz
cat > .htaccess << 'EOF'
DirectoryIndex index.php index.html
Options +FollowSymLinks +SymLinksIfOwnerMatch
RewriteEngine On
RewriteBase /

# PRIMEIRO: Servir arquivos e diretórios existentes diretamente
RewriteCond %{REQUEST_FILENAME} -f
RewriteRule ^ - [L]

RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]

# SEGUNDO: Storage → Servir diretamente (IMPORTANTE: antes de qualquer outra regra)
RewriteCond %{REQUEST_URI} ^/storage/ [NC]
RewriteCond %{REQUEST_FILENAME} -f
RewriteRule ^ - [L]

# TERCEIRO: API, Admin (zirigui) ou Storage → index.php na raiz (que roteia para Laravel)
RewriteCond %{REQUEST_URI} ^/(api|zirigui|storage) [NC]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^ index.php [L]

# QUARTO: Redirecionar tudo mais para public/
RewriteRule ^(.*)$ public/$1 [L]
EOF

# Corrigir .htaccess em public/
cat > public/.htaccess << 'EOF'
<IfModule mod_rewrite.c>
    <IfModule mod_negotiation.c>
        Options -MultiViews -Indexes
    </IfModule>

    RewriteEngine On
    RewriteBase /

    # Handle Authorization Header
    RewriteCond %{HTTP:Authorization} .
    RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]

    # PRIMEIRO: Servir arquivos e diretórios existentes diretamente
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteRule ^ - [L]

    RewriteCond %{REQUEST_FILENAME} -d
    RewriteRule ^ - [L]

    # SEGUNDO: Storage → Servir diretamente se arquivo existir
    RewriteCond %{REQUEST_URI} ^/storage/ [NC]
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteRule ^ - [L]

    # TERCEIRO: Admin (zirigui) → Laravel index.php
    RewriteCond %{REQUEST_URI} ^/zirigui [NC]
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule ^ index.php [L]

    # QUARTO: API → Laravel index.php
    RewriteCond %{REQUEST_URI} ^/api [NC]
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule ^ index.php [L]

    # QUINTO: Redirect Trailing Slashes
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_URI} ^(.+)/$
    RewriteRule ^ %1 [L,R=301]

    # ÚLTIMO: Tudo mais → Laravel index.php (para outras rotas do Laravel)
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^ index.php [L]
</IfModule>
EOF

echo "✅ .htaccess atualizados"
echo ""

# Testar se o banner agora retorna imagem
echo "=== Testando banner ID 44 ==="
curl -s -I "https://betgeniusbr.com/storage/01KB5DHBYFVPQ63F10K40F1V40.jpg" | head -5
echo ""

# Limpar cache
php artisan config:clear
php artisan cache:clear
php artisan route:clear

echo "✅ Correção concluída!"

