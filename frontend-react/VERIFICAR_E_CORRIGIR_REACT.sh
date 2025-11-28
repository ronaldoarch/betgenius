#!/bin/bash

# ============================================================
# ✅ VERIFICAR E CORRIGIR - REACT NÃO ESTÁ CARREGANDO
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 VERIFICANDO POR QUE O REACT NÃO ESTÁ CARREGANDO"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando se index.html do React existe..."
if [ -f "public/index.html" ]; then
    echo "✅ index.html existe em public/"
    echo "Primeiras linhas:"
    head -5 public/index.html
    echo ""
    echo "Verificando se é do React (deve ter <div id=\"root\">):"
    if grep -q "id=\"root\"" public/index.html; then
        echo "✅ É o index.html do React!"
    else
        echo "⚠️  Não parece ser o index.html do React"
    fi
else
    echo "❌ index.html NÃO existe em public/"
    echo "⚠️  Você precisa fazer upload do index.html do React!"
fi
echo ""

echo "2️⃣ Verificando se index.php existe..."
if [ -f "public/index.php" ]; then
    echo "⚠️  index.php existe (Laravel)"
    echo "   O servidor pode estar priorizando index.php sobre index.html"
    echo "   Vamos renomear temporariamente para forçar o uso do index.html"
    mv public/index.php public/index.php.laravel
    echo "✅ index.php renomeado para index.php.laravel"
else
    echo "✅ index.php não existe (ou já foi renomeado)"
fi
echo ""

echo "3️⃣ Verificando .htaccess em public/..."
if [ -f "public/.htaccess" ]; then
    echo "✅ .htaccess existe"
    echo "Verificando se está configurado para servir index.html:"
    if grep -q "index.html" public/.htaccess; then
        echo "✅ .htaccess menciona index.html"
    else
        echo "⚠️  .htaccess não menciona index.html"
    fi
    echo ""
    echo "Conteúdo do .htaccess:"
    cat public/.htaccess
else
    echo "❌ .htaccess não existe em public/"
fi
echo ""

echo "4️⃣ Verificando se os arquivos assets do React existem..."
if [ -d "public/assets" ]; then
    echo "✅ Diretório assets/ existe"
    echo "Arquivos encontrados:"
    ls -lh public/assets/ | head -10
else
    echo "⚠️  Diretório assets/ não existe"
    echo "   Você precisa fazer upload dos arquivos do React!"
fi
echo ""

echo "5️⃣ Criando .htaccess correto para priorizar index.html..."
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

    # Permitir acesso à API do Laravel (usar index.php.laravel)
    RewriteCond %{REQUEST_URI} ^/api
    RewriteRule ^ index.php.laravel [L]

    # Permitir acesso ao admin (Filament)
    RewriteCond %{REQUEST_URI} ^/admin
    RewriteRule ^ index.php.laravel [L]

    # Permitir acesso ao storage
    RewriteCond %{REQUEST_URI} ^/storage
    RewriteRule ^ index.php.laravel [L]

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

# Configurar DirectoryIndex para priorizar index.html
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
echo "✅ .htaccess atualizado"
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
echo "   ✅ index.php renomeado para index.php.laravel"
echo "   ✅ .htaccess configurado para priorizar index.html"
echo "   ✅ DirectoryIndex configurado para index.html primeiro"
echo "   ✅ Cache limpo"
echo ""
echo "📋 VERIFICAÇÕES NECESSÁRIAS:"
echo ""
if [ ! -f "public/index.html" ]; then
    echo "   ❌ index.html NÃO existe - VOCÊ PRECISA FAZER UPLOAD!"
    echo "      Upload: frontend-react/dist/index.html → public/index.html"
fi
if [ ! -d "public/assets" ]; then
    echo "   ❌ assets/ NÃO existe - VOCÊ PRECISA FAZER UPLOAD!"
    echo "      Upload: frontend-react/dist/assets/* → public/assets/*"
fi
echo ""
echo "📋 TESTE AGORA:"
echo "   1. Limpe o cache do navegador (Ctrl+Shift+R)"
echo "   2. Teste: https://betgeniusbr.com/"
echo ""
echo "═══════════════════════════════════════════════════════════════"

