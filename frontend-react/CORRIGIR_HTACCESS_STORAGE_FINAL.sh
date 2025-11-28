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

# SEGUNDO: Storage → Verificar se arquivo existe em public/storage/ e servir diretamente
RewriteCond %{REQUEST_URI} ^/storage/(.+)$ [NC]
RewriteCond %{DOCUMENT_ROOT}/public/storage/%1 -f
RewriteRule ^storage/(.+)$ public/storage/$1 [L]

# TERCEIRO: API, Admin (zirigui) ou Storage (arquivo não existe) → index.php na raiz
RewriteCond %{REQUEST_URI} ^/(api|zirigui|storage) [NC]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^ index.php [L]

# QUARTO: Redirecionar tudo mais para public/
RewriteRule ^(.*)$ public/$1 [L]
EOF

echo "✅ .htaccess na raiz atualizado"
echo ""

# Verificar conteúdo
echo "=== Conteúdo do .htaccess ==="
cat .htaccess
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

