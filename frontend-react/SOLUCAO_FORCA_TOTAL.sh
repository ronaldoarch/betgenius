#!/bin/bash

# ============================================================
# ✅ SOLUÇÃO FORÇA TOTAL - CORRIGIR TUDO DE UMA VEZ
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 SOLUÇÃO FORÇA TOTAL - CORRIGINDO TUDO"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Removendo TODOS os arquivos index.php da raiz..."
find . -maxdepth 1 -name "index.php" -type f -delete
rm -f index.php
echo "✅ Limpeza concluída"
echo ""

echo "2️⃣ Corrigindo TODAS as permissões..."
chmod 755 .
chmod 755 public/
chmod 644 .htaccess 2>/dev/null
chmod 644 public/.htaccess 2>/dev/null
chmod 644 public/index.php 2>/dev/null
chmod 644 public/index.html 2>/dev/null
find public/ -type f -exec chmod 644 {} \; 2>/dev/null
find public/ -type d -exec chmod 755 {} \; 2>/dev/null
echo "✅ Permissões corrigidas"
echo ""

echo "3️⃣ Criando .htaccess ULTRA SIMPLES na raiz..."
cat > .htaccess << 'EOF'
Options +FollowSymLinks +SymLinksIfOwnerMatch
RewriteEngine On
RewriteBase /

# Permitir acesso direto a arquivos e diretórios
RewriteCond %{REQUEST_FILENAME} -f [OR]
RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]

# Redirecionar tudo para public/
RewriteRule ^(.*)$ public/$1 [L]
EOF
chmod 644 .htaccess
echo "✅ .htaccess na raiz criado"
echo ""

echo "4️⃣ Criando .htaccess em public/ que prioriza index.html..."
cat > public/.htaccess << 'EOFPUBLIC'
Options +FollowSymLinks +SymLinksIfOwnerMatch -Indexes
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
echo "✅ .htaccess em public/ criado"
echo ""

echo "5️⃣ Garantindo que index.html existe..."
if [ ! -f "public/index.html" ]; then
    echo "⚠️  Criando index.html..."
    cat > public/index.html << 'EOFHTML'
<!DOCTYPE html>
<html lang="pt-BR">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>BetGenius - Cassino Online</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;400;700&display=swap" rel="stylesheet">
    <script type="module" crossorigin src="/assets/index-DrMwNlRZ.js"></script>
    <link rel="stylesheet" crossorigin href="/assets/index-R46pBGYW.css">
  </head>
  <body>
    <div id="root"></div>
  </body>
</html>
EOFHTML
    chmod 644 public/index.html
    echo "✅ index.html criado"
else
    echo "✅ index.html já existe"
fi
echo ""

echo "6️⃣ Garantindo que index.php do Laravel existe..."
if [ ! -f "public/index.php" ]; then
    echo "⚠️  Criando index.php do Laravel..."
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
else
    echo "✅ index.php já existe"
fi
echo ""

echo "7️⃣ Criando arquivo de teste..."
echo "Teste OK" > public/teste.txt
chmod 644 public/teste.txt
echo "✅ Arquivo teste.txt criado"
echo ""

echo "8️⃣ Verificando estrutura final..."
echo "Estrutura da raiz:"
ls -la | grep -E "index\.|\.htaccess" | head -5
echo ""
echo "Estrutura de public/:"
ls -la public/ | grep -E "index\.|\.htaccess|teste" | head -5
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ SOLUÇÃO APLICADA!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 TESTES:"
echo "   1. Teste: https://betgeniusbr.com/teste.txt"
echo "      Se funcionar, o servidor está acessando public/"
echo ""
echo "   2. Teste: https://betgeniusbr.com/"
echo "      Deve carregar o index.html (React)"
echo ""
echo "📋 SE AINDA DER ERRO 403:"
echo "   O problema é CERTAMENTE o Document Root no hPanel."
echo ""
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

