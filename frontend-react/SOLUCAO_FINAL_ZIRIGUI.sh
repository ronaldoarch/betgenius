#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "=== Verificando se há DirectoryIndex configurado ==="
grep -r "DirectoryIndex" .htaccess public/.htaccess 2>/dev/null || echo "Nenhum DirectoryIndex encontrado"
echo ""

echo "=== Verificando se index.html existe em public/ ==="
ls -la public/index.html
echo ""

echo "=== Corrigindo .htaccess em public/ com sintaxe correta ==="

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
    # Usar sintaxe correta para capturar /zirigui com ou sem barra
    RewriteCond %{REQUEST_URI} ^/zirigui
    RewriteRule ^ index.php [L]

    RewriteCond %{REQUEST_URI} ^/zirigui/
    RewriteRule ^ index.php [L]

    # SEGUNDO: API → Laravel index.php
    RewriteCond %{REQUEST_URI} ^/api
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule ^ index.php [L]

    # TERCEIRO: Servir arquivos e diretórios existentes diretamente
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteRule ^ - [L]

    RewriteCond %{REQUEST_FILENAME} -d
    RewriteRule ^ - [L]

    # QUARTO: Storage → Servir diretamente se arquivo existir
    RewriteCond %{REQUEST_URI} ^/storage/
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteRule ^ - [L]

    # QUINTO: Redirect Trailing Slashes
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_URI} ^(.+)/$
    RewriteRule ^ %1 [L,R=301]

    # ÚLTIMO: Tudo mais → React index.html
    # Mas NÃO se for /zirigui ou /api
    RewriteCond %{REQUEST_URI} !^/zirigui
    RewriteCond %{REQUEST_URI} !^/zirigui/
    RewriteCond %{REQUEST_URI} !^/api
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule ^ index.html [L]
</IfModule>
EOF

echo "✅ .htaccess atualizado"
echo ""

echo "=== Verificando conteúdo do .htaccess ==="
cat public/.htaccess | head -30
echo ""

echo "=== Testando se o problema é o cache do servidor ==="
echo "Tentando forçar recarregamento..."
touch public/.htaccess
echo ""

echo "=== Limpando cache Laravel ==="
php artisan config:clear
php artisan cache:clear
php artisan route:clear
echo ""

echo "=== Testando /zirigui ==="
curl -s -I "https://betgeniusbr.com/zirigui" -H "Cache-Control: no-cache" | head -10
echo ""

echo "=== Testando conteúdo retornado ==="
curl -s "https://betgeniusbr.com/zirigui" -H "Cache-Control: no-cache" | head -20
echo ""

echo "✅ Teste concluído!"

