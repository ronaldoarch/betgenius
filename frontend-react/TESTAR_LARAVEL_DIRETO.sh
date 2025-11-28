#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 TESTANDO SE LARAVEL ESTÁ FUNCIONANDO"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Testando Laravel diretamente via PHP CLI:"
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
\$_SERVER['REQUEST_METHOD'] = 'GET';
require 'index.php';
" 2>&1 | head -c 500
echo ""
echo ""

echo "2️⃣ Verificando rotas do Laravel:"
echo "───────────────────────────────────────────────────────────────"
cd ..
php artisan route:list | grep -E "api|games" | head -10
echo ""
echo ""

echo "3️⃣ Testando se o problema é o REQUEST_URI:"
echo "───────────────────────────────────────────────────────────────"
echo "Criando arquivo de teste para verificar REQUEST_URI..."
cd public
cat > test_request.php << 'TESTEOF'
<?php
echo "REQUEST_URI: " . ($_SERVER['REQUEST_URI'] ?? 'NÃO DEFINIDO') . "\n";
echo "SCRIPT_NAME: " . ($_SERVER['SCRIPT_NAME'] ?? 'NÃO DEFINIDO') . "\n";
echo "PHP_SELF: " . ($_SERVER['PHP_SELF'] ?? 'NÃO DEFINIDO') . "\n";
echo "QUERY_STRING: " . ($_SERVER['QUERY_STRING'] ?? 'NÃO DEFINIDO') . "\n";
TESTEOF
chmod 644 test_request.php
echo "✅ Arquivo criado: public/test_request.php"
echo "   Teste no navegador: https://betgeniusbr.com/test_request.php"
echo ""

cd ..

echo "4️⃣ Tentando solução alternativa - index.php na raiz:"
echo "───────────────────────────────────────────────────────────────"
cat > index.php << 'INDEXEOF'
<?php
$requestUri = $_SERVER['REQUEST_URI'] ?? '/';

// Se for API, Admin ou Storage, redirecionar para Laravel
if (preg_match('#^/(api|admin|storage)#', $requestUri)) {
    $_SERVER['SCRIPT_NAME'] = '/index.php';
    $_SERVER['PHP_SELF'] = '/index.php';
    chdir(__DIR__ . '/public');
    require __DIR__ . '/public/index.php';
    exit;
}

// Caso contrário, servir React
$indexPath = __DIR__ . '/public/index.html';
if (file_exists($indexPath)) {
    header('Content-Type: text/html; charset=utf-8');
    readfile($indexPath);
    exit;
}

http_response_code(404);
echo 'Not Found';
INDEXEOF
chmod 644 index.php
echo "✅ index.php criado na raiz"
echo ""

echo "5️⃣ Aguardando 3 segundos..."
sleep 3
echo ""

echo "6️⃣ Testando API novamente:"
echo "───────────────────────────────────────────────────────────────"
RESPONSE=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/games/all | head -c 300)
echo "$RESPONSE"
echo ""
if [[ "$RESPONSE" == "{"* ]] || [[ "$RESPONSE" == "["* ]]; then
    echo "   ✅ SUCESSO! Retornou JSON"
else
    echo "   ❌ Ainda retorna HTML"
fi

echo ""
echo "═══════════════════════════════════════════════════════════════"
