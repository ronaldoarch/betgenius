#!/bin/bash

# ============================================================
# ✅ VERIFICAR E CONFIGURAR INDEX.HTML
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 VERIFICANDO E CONFIGURANDO INDEX.HTML"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando se index.html existe em public/..."
if [ -f "public/index.html" ]; then
    echo "✅ index.html existe!"
    echo "Tamanho:"
    ls -lh public/index.html
    echo ""
    echo "Primeiras linhas:"
    head -10 public/index.html
else
    echo "❌ index.html NÃO existe em public/"
    echo ""
    echo "⚠️  AÇÃO NECESSÁRIA:"
    echo "   Você precisa fazer upload do index.html do React:"
    echo "   frontend-react/dist/index.html → public_html/public/index.html"
    echo ""
fi
echo ""

echo "2️⃣ Verificando se index.php existe em public/..."
if [ -f "public/index.php" ]; then
    echo "✅ index.php existe (Laravel)"
else
    echo "⚠️  index.php não existe, criando..."
    cat > public/index.php << 'EOFINDEX'
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
EOFINDEX
    chmod 644 public/index.php
    echo "✅ index.php criado"
fi
echo ""

echo "3️⃣ Verificando .htaccess em public/..."
if [ -f "public/.htaccess" ]; then
    echo "✅ .htaccess existe"
    echo ""
    echo "Verificando se DirectoryIndex está configurado..."
    if grep -q "DirectoryIndex index.html" public/.htaccess; then
        echo "✅ DirectoryIndex já prioriza index.html"
    else
        echo "⚠️  DirectoryIndex não está configurado corretamente"
        echo "   Atualizando .htaccess..."
        cat > public/.htaccess << 'EOFPUBLIC'
Options +FollowSymLinks -Indexes
DirectoryIndex index.html index.php

RewriteEngine On
RewriteBase /

# Permitir acesso direto a arquivos estáticos
RewriteCond %{REQUEST_FILENAME} -f
RewriteRule ^ - [L]

RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]

# API do Laravel
RewriteCond %{REQUEST_URI} ^/api [NC]
RewriteRule ^ index.php [L]

# Admin do Laravel
RewriteCond %{REQUEST_URI} ^/admin [NC]
RewriteRule ^ index.php [L]

# Storage do Laravel
RewriteCond %{REQUEST_URI} ^/storage [NC]
RewriteRule ^ index.php [L]

# Tudo mais vai para index.html (React)
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^ index.html [L]
EOFPUBLIC
        chmod 644 public/.htaccess
        echo "✅ .htaccess atualizado"
    fi
else
    echo "❌ .htaccess não existe, criando..."
    cat > public/.htaccess << 'EOFPUBLIC'
Options +FollowSymLinks -Indexes
DirectoryIndex index.html index.php

RewriteEngine On
RewriteBase /

# Permitir acesso direto a arquivos estáticos
RewriteCond %{REQUEST_FILENAME} -f
RewriteRule ^ - [L]

RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]

# API do Laravel
RewriteCond %{REQUEST_URI} ^/api [NC]
RewriteRule ^ index.php [L]

# Admin do Laravel
RewriteCond %{REQUEST_URI} ^/admin [NC]
RewriteRule ^ index.php [L]

# Storage do Laravel
RewriteCond %{REQUEST_URI} ^/storage [NC]
RewriteRule ^ index.php [L]

# Tudo mais vai para index.html (React)
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^ index.html [L]
EOFPUBLIC
    chmod 644 public/.htaccess
    echo "✅ .htaccess criado"
fi
echo ""

echo "4️⃣ Verificando se assets/ existe..."
if [ -d "public/assets" ]; then
    echo "✅ Diretório assets/ existe"
    echo "Quantidade de arquivos:"
    ls -1 public/assets/ | wc -l
    echo "Primeiros arquivos:"
    ls -1 public/assets/ | head -5
else
    echo "⚠️  Diretório assets/ NÃO existe"
    echo ""
    echo "⚠️  AÇÃO NECESSÁRIA:"
    echo "   Você precisa fazer upload dos assets do React:"
    echo "   frontend-react/dist/assets/* → public_html/public/assets/*"
    echo ""
fi
echo ""

echo "5️⃣ Verificando estrutura final..."
echo "Arquivos em public/:"
ls -la public/ | grep -E "index\.|\.htaccess|assets" | head -10
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ VERIFICAÇÃO CONCLUÍDA!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
if [ -f "public/index.html" ]; then
    echo "✅ Tudo configurado! Teste: https://betgeniusbr.com/"
else
    echo "⚠️  FALTA FAZER UPLOAD:"
    echo "   1. frontend-react/dist/index.html → public_html/public/index.html"
    echo "   2. frontend-react/dist/assets/* → public_html/public/assets/*"
    echo ""
    echo "   Depois, teste: https://betgeniusbr.com/"
fi
echo ""
echo "═══════════════════════════════════════════════════════════════"

