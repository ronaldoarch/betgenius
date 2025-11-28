#!/bin/bash

# ============================================================
# ✅ SOLUÇÃO ALTERNATIVA - FORÇAR FUNCIONAMENTO
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 SOLUÇÃO ALTERNATIVA - FORÇAR FUNCIONAMENTO"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando estrutura atual..."
pwd
ls -la | head -10
echo ""

echo "2️⃣ Removendo TODOS os arquivos index.php da raiz..."
find . -maxdepth 1 -name "index.php" -type f -delete
rm -f index.php
echo "✅ Arquivos index.php removidos da raiz"
echo ""

echo "3️⃣ Criando .htaccess ULTRA SIMPLES na raiz..."
cat > .htaccess << 'EOF'
Options +FollowSymLinks
RewriteEngine On
RewriteBase /

# Permitir acesso direto a arquivos
RewriteCond %{REQUEST_FILENAME} -f [OR]
RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]

# Redirecionar tudo para public/
RewriteRule ^(.*)$ public/$1 [L]
EOF
chmod 644 .htaccess
echo "✅ .htaccess criado"
echo ""

echo "4️⃣ Criando .htaccess em public/ que prioriza index.html..."
cat > public/.htaccess << 'EOF'
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
EOF
chmod 644 public/.htaccess
echo "✅ .htaccess em public/ criado"
echo ""

echo "5️⃣ Ajustando TODAS as permissões..."
chmod 755 .
chmod 755 public/
chmod 644 .htaccess
chmod 644 public/.htaccess
find public/ -type f -name "*.php" -exec chmod 644 {} \; 2>/dev/null
find public/ -type f -name "*.html" -exec chmod 644 {} \; 2>/dev/null
find public/ -type f -name "*.js" -exec chmod 644 {} \; 2>/dev/null
find public/ -type f -name "*.css" -exec chmod 644 {} \; 2>/dev/null
find public/ -type d -exec chmod 755 {} \; 2>/dev/null
echo "✅ Permissões ajustadas"
echo ""

echo "6️⃣ Verificando se index.html existe..."
if [ -f "public/index.html" ]; then
    echo "✅ index.html existe em public/"
    ls -lh public/index.html
else
    echo "❌ index.html NÃO existe em public/"
    echo "⚠️  Você precisa fazer upload do index.html do React!"
fi
echo ""

echo "7️⃣ Verificando se index.php existe em public/..."
if [ -f "public/index.php" ]; then
    echo "✅ index.php existe em public/"
    ls -lh public/index.php
else
    echo "⚠️  index.php não existe em public/"
    echo "⚠️  Criando index.php básico do Laravel..."
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

echo "8️⃣ Criando arquivo de teste..."
echo "Teste" > public/teste.txt
chmod 644 public/teste.txt
echo "✅ Arquivo teste.txt criado em public/"
echo ""

echo "9️⃣ Verificando estrutura final..."
echo "Estrutura da raiz:"
ls -la | grep -E "index\.|\.htaccess|teste" | head -5
echo ""
echo "Estrutura de public/:"
ls -la public/ | grep -E "index\.|\.htaccess|teste" | head -5
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ SOLUÇÃO APLICADA!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 TESTES:"
echo "   1. Teste se consegue acessar: https://betgeniusbr.com/teste.txt"
echo "      Se funcionar, o servidor está acessando public/"
echo ""
echo "   2. Teste: https://betgeniusbr.com/"
echo "      Deve carregar o index.html (React) ou index.php (Laravel)"
echo ""
echo "📋 SE AINDA DER ERRO 403:"
echo "   O problema é o Document Root no hPanel."
echo "   Document Root DEVE estar: public_html"
echo "   Document Root NÃO deve estar: public_html/public"
echo ""
echo "   Para verificar/alterar:"
echo "   1. Acesse: https://hpanel.hostinger.com/"
echo "   2. Domínios → betgeniusbr.com → Gerenciar"
echo "   3. Procure: Document Root"
echo "   4. Altere para: public_html"
echo "   5. Salve e aguarde 3 minutos"
echo ""
echo "═══════════════════════════════════════════════════════════════"
