#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "=== Corrigindo .htaccess na raiz ==="
cat > .htaccess << 'EOF'
Options +FollowSymLinks +SymLinksIfOwnerMatch
RewriteEngine On
RewriteBase /

# PRIMEIRO: Servir arquivos e diretórios existentes diretamente
RewriteCond %{REQUEST_FILENAME} -f
RewriteRule ^ - [L]

RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]

# SEGUNDO: Admin (zirigui) → public/ (Laravel)
RewriteCond %{REQUEST_URI} ^/zirigui [NC]
RewriteRule ^(.*)$ public/$1 [L]

# TERCEIRO: API → public/ (Laravel)
RewriteCond %{REQUEST_URI} ^/api [NC]
RewriteRule ^(.*)$ public/$1 [L]

# QUARTO: Storage → Servir diretamente se arquivo existir
RewriteCond %{REQUEST_URI} ^/storage/ [NC]
RewriteCond %{REQUEST_FILENAME} -f
RewriteRule ^ - [L]

# QUINTO: Tudo mais → public/
RewriteRule ^(.*)$ public/$1 [L]
EOF

echo "✅ .htaccess na raiz atualizado"
echo ""

echo "=== Verificando .htaccess em public/ ==="
cat public/.htaccess | head -20
echo ""

echo "=== Limpando cache ==="
php artisan config:clear
php artisan cache:clear
php artisan route:clear
echo ""

echo "=== Testando /zirigui ==="
curl -s -I "https://betgeniusbr.com/zirigui" | head -10
echo ""

echo "✅ Correção concluída!"

