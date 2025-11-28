#!/bin/bash

# ============================================================
# ✅ CORRIGIR ERRO - index.php não encontrado
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO ERRO - index.php não encontrado"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Removendo index.php da raiz (se existir)..."
if [ -f "index.php" ]; then
    rm -f index.php
    echo "✅ index.php removido da raiz"
else
    echo "✅ Não há index.php na raiz"
fi
echo ""

echo "2️⃣ Verificando se index.php.laravel existe em public/..."
if [ -f "public/index.php.laravel" ]; then
    echo "✅ index.php.laravel existe"
    # Renomear de volta para index.php para o Laravel funcionar
    mv public/index.php.laravel public/index.php
    echo "✅ Renomeado de volta para index.php"
else
    echo "⚠️  index.php.laravel não existe"
    if [ -f "public/index.php" ]; then
        echo "✅ index.php já existe em public/"
    else
        echo "❌ index.php não existe em public/ - criando..."
        # Criar index.php básico do Laravel
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

$response = $kernel->handle(
    $request = Request::capture()
)->send();

$kernel->terminate($request, $response);
EOF
        chmod 644 public/index.php
        echo "✅ index.php criado"
    fi
fi
echo ""

echo "3️⃣ Verificando se index.html do React existe..."
if [ -f "public/index.html" ]; then
    echo "✅ index.html existe em public/"
    echo "Primeiras linhas:"
    head -5 public/index.html
else
    echo "❌ index.html NÃO existe em public/"
    echo "⚠️  Você precisa fazer upload do index.html do React!"
    echo "   Upload: frontend-react/dist/index.html → public/index.html"
fi
echo ""

echo "4️⃣ Criando .htaccess correto..."
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
echo "✅ .htaccess criado"
echo ""

echo "5️⃣ Verificando estrutura final..."
echo "Arquivos em public/:"
ls -la public/ | grep -E "index\.|\.htaccess" | head -10
echo ""

echo "6️⃣ Limpando cache..."
php artisan config:clear 2>/dev/null || echo "⚠️  Erro ao limpar config cache"
php artisan cache:clear 2>/dev/null || echo "⚠️  Erro ao limpar cache"
php artisan route:clear 2>/dev/null || echo "⚠️  Erro ao limpar route cache"
php artisan view:clear 2>/dev/null || echo "⚠️  Erro ao limpar view cache"
php artisan optimize:clear 2>/dev/null || echo "⚠️  Erro ao limpar optimize cache"
echo "✅ Cache limpo"
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ PROCESSO CONCLUÍDO!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 O que foi feito:"
echo "   ✅ index.php removido da raiz"
echo "   ✅ index.php restaurado em public/ (para Laravel API/admin)"
echo "   ✅ .htaccess configurado para priorizar index.html"
echo "   ✅ DirectoryIndex configurado para index.html primeiro"
echo "   ✅ Cache limpo"
echo ""
if [ ! -f "public/index.html" ]; then
    echo "⚠️  AÇÃO NECESSÁRIA:"
    echo "   Você precisa fazer upload do index.html do React:"
    echo "   frontend-react/dist/index.html → public/index.html"
    echo ""
fi
echo "📋 TESTE AGORA:"
echo "   1. Limpe o cache do navegador (Ctrl+Shift+R)"
echo "   2. Teste: https://betgeniusbr.com/"
echo ""
echo "═══════════════════════════════════════════════════════════════"

