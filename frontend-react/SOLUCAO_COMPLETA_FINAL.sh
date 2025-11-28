#!/bin/bash

# ============================================================
# ✅ SOLUÇÃO COMPLETA FINAL - TUDO DE UMA VEZ
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 SOLUÇÃO COMPLETA FINAL"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Removendo index.php da raiz..."
rm -f index.php
echo "✅ index.php removido da raiz"
echo ""

echo "2️⃣ Verificando/restaurando index.php em public/..."
if [ ! -f "public/index.php" ]; then
    if [ -f "public/index.php.laravel" ]; then
        mv public/index.php.laravel public/index.php
        echo "✅ index.php restaurado de index.php.laravel"
    else
        echo "⚠️  Criando index.php do Laravel..."
        cat > public/index.php << 'EOF'
<?php
use Illuminate\Contracts\Http\Kernel;
use Illuminate\Http\Request;
define('LARAVEL_START', microtime(true));
if (file_exists($maintenance = __DIR__.'/../storage/framework/maintenance.php')) {
    require $maintenance;
}
require __DIR__.'/../vendor/autoload.php';
$app = require_once __DIR__.'/../bootstrap/app.php';
$kernel = $app->make(Kernel::class);
$response = $kernel->handle($request = Request::capture())->send();
$kernel->terminate($request, $response);
EOF
        chmod 644 public/index.php
        echo "✅ index.php criado"
    fi
else
    echo "✅ index.php já existe em public/"
fi
echo ""

echo "3️⃣ Verificando index.html do React..."
if [ -f "public/index.html" ]; then
    echo "✅ index.html existe"
    if grep -q "id=\"root\"" public/index.html; then
        echo "✅ É o index.html do React!"
    else
        echo "⚠️  Não parece ser o index.html do React"
    fi
else
    echo "❌ index.html NÃO existe"
    echo "⚠️  Você precisa fazer upload do index.html do React!"
fi
echo ""

echo "4️⃣ Criando .htaccess na raiz..."
cat > .htaccess << 'EOF'
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteBase /

    # Permitir acesso direto a arquivos e diretórios existentes
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteRule ^ - [L]

    RewriteCond %{REQUEST_FILENAME} -d
    RewriteRule ^ - [L]

    # Redirecionar tudo para public/ (apenas se não for arquivo/diretório)
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule ^(.*)$ public/$1 [L]
</IfModule>

# Configurar MIME types
<IfModule mod_mime.c>
    AddType application/javascript js
    AddType application/javascript mjs
    AddType text/javascript js
    AddType text/css css
</IfModule>

# Impede acesso ao .env
<Files .env>
    Order allow,deny
    Deny from all
</Files>
EOF
chmod 644 .htaccess
echo "✅ .htaccess criado na raiz"
echo ""

echo "5️⃣ Criando .htaccess em public/..."
cat > public/.htaccess << 'EOF'
<IfModule mod_rewrite.c>
    <IfModule mod_negotiation.c>
        Options -MultiViews -Indexes
    </IfModule>

    RewriteEngine On

    # Handle Authorization Header
    RewriteCond %{HTTP:Authorization} .
    RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]

    # CRÍTICO: Permitir acesso direto a arquivos estáticos PRIMEIRO
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteRule ^ - [L]

    RewriteCond %{REQUEST_FILENAME} -d
    RewriteRule ^ - [L]

    # Permitir acesso à API do Laravel
    RewriteCond %{REQUEST_URI} ^/api
    RewriteRule ^ index.php [L]

    # Permitir acesso ao admin (Filament)
    RewriteCond %{REQUEST_URI} ^/admin
    RewriteRule ^ index.php [L]

    # Permitir acesso ao storage
    RewriteCond %{REQUEST_URI} ^/storage
    RewriteRule ^ index.php [L]

    # Redirect Trailing Slashes If Not A Folder...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_URI} ^(.+)/$
    RewriteRule ^ %1 [L,R=301]

    # Se não for arquivo/diretório e não for API/admin/storage, servir index.html (React)
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_URI} !^/api
    RewriteCond %{REQUEST_URI} !^/admin
    RewriteCond %{REQUEST_URI} !^/storage
    RewriteRule ^ index.html [L]
</IfModule>

# CRÍTICO: Priorizar index.html sobre index.php
DirectoryIndex index.html index.php

# Configurar MIME types
<IfModule mod_mime.c>
    AddType application/javascript js
    AddType application/javascript mjs
    AddType text/javascript js
    AddType text/css css
    AddType image/svg+xml svg svgz
    AddType application/json json
    AddType application/wasm wasm
    AddType font/woff2 woff2
    AddType font/woff woff
    AddType font/ttf ttf
</IfModule>

# Headers para forçar MIME type correto
<FilesMatch "\.(js|mjs)$">
    <IfModule mod_headers.c>
        Header set Content-Type "application/javascript; charset=utf-8"
    </IfModule>
</FilesMatch>
EOF
chmod 644 public/.htaccess
echo "✅ .htaccess criado em public/"
echo ""

echo "6️⃣ Ajustando permissões..."
chmod 755 . 2>/dev/null
chmod 755 public/ 2>/dev/null
chmod 644 public/index.php 2>/dev/null
chmod 644 public/index.html 2>/dev/null
chmod 644 .htaccess 2>/dev/null
chmod 644 public/.htaccess 2>/dev/null
chmod -R 755 public/build/ 2>/dev/null
chmod -R 644 public/assets/*.js 2>/dev/null
chmod -R 644 public/assets/*.css 2>/dev/null
echo "✅ Permissões ajustadas"
echo ""

echo "7️⃣ Limpando cache..."
php artisan config:clear 2>/dev/null || echo "⚠️  Erro ao limpar config cache"
php artisan cache:clear 2>/dev/null || echo "⚠️  Erro ao limpar cache"
php artisan route:clear 2>/dev/null || echo "⚠️  Erro ao limpar route cache"
php artisan view:clear 2>/dev/null || echo "⚠️  Erro ao limpar view cache"
php artisan optimize:clear 2>/dev/null || echo "⚠️  Erro ao limpar optimize cache"
echo "✅ Cache limpo"
echo ""

echo "8️⃣ Verificando estrutura final..."
echo "Estrutura:"
ls -la | grep -E "index\.|\.htaccess" || echo "Nenhum arquivo encontrado na raiz"
ls -la public/ | grep -E "index\.|\.htaccess" | head -5
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ PROCESSO CONCLUÍDO!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 O que foi feito:"
echo "   ✅ index.php removido da raiz"
echo "   ✅ index.php verificado/criado em public/"
echo "   ✅ .htaccess criado na raiz"
echo "   ✅ .htaccess criado em public/ (prioriza index.html)"
echo "   ✅ DirectoryIndex configurado para index.html primeiro"
echo "   ✅ Permissões ajustadas"
echo "   ✅ Cache limpo"
echo ""
if [ ! -f "public/index.html" ]; then
    echo "⚠️  AÇÃO NECESSÁRIA:"
    echo "   Você precisa fazer upload do index.html do React:"
    echo "   frontend-react/dist/index.html → public/index.html"
    echo "   frontend-react/dist/assets/* → public/assets/*"
    echo ""
fi
echo "📋 TESTE AGORA:"
echo "   1. Limpe o cache do navegador (Ctrl+Shift+R)"
echo "   2. Teste: https://betgeniusbr.com/"
echo ""
echo "⚠️  Se ainda houver erro 403:"
echo "   Verifique o Document Root no hPanel:"
echo "   - Deve estar: public_html"
echo "   - NÃO deve estar: public_html/public"
echo ""
echo "═══════════════════════════════════════════════════════════════"

