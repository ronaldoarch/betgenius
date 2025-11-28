#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 VERIFICANDO index.php NA RAIZ E LARAVEL"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Verificando se index.php existe na raiz:"
echo "───────────────────────────────────────────────────────────────"
ls -la index.php
echo ""
echo ""

echo "2️⃣ Conteúdo do index.php na raiz:"
echo "───────────────────────────────────────────────────────────────"
cat index.php
echo ""
echo ""

echo "3️⃣ Testando sintaxe do index.php:"
echo "───────────────────────────────────────────────────────────────"
php -l index.php
echo ""
echo ""

echo "4️⃣ Testando se Laravel responde diretamente:"
echo "───────────────────────────────────────────────────────────────"
cd public
php -r "
\$_SERVER['REQUEST_URI'] = '/api/games/all';
\$_SERVER['REQUEST_METHOD'] = 'GET';
\$_SERVER['HTTP_HOST'] = 'betgeniusbr.com';
\$_SERVER['SERVER_NAME'] = 'betgeniusbr.com';
\$_SERVER['HTTPS'] = 'on';
\$_SERVER['SERVER_PORT'] = '443';
\$_SERVER['SCRIPT_NAME'] = '/index.php';
\$_SERVER['PHP_SELF'] = '/index.php';
\$_SERVER['QUERY_STRING'] = '';
require 'index.php';
" 2>&1 | head -c 500
echo ""
echo ""

cd ..

echo "5️⃣ Verificando rotas do Laravel:"
echo "───────────────────────────────────────────────────────────────"
php artisan route:list | grep -E "api|games" | head -5
echo ""
echo ""

echo "6️⃣ Testando index.php na raiz via PHP CLI:"
echo "───────────────────────────────────────────────────────────────"
php -r "
\$_SERVER['REQUEST_URI'] = '/api/games/all';
\$_SERVER['SCRIPT_NAME'] = '/index.php';
\$_SERVER['PHP_SELF'] = '/index.php';
\$_SERVER['HTTP_HOST'] = 'betgeniusbr.com';
require 'index.php';
" 2>&1 | head -c 500
echo ""
echo ""

echo "═══════════════════════════════════════════════════════════════"

