#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO index.php - Adicionar variáveis SERVER necessárias"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cp index.php index.php.backup.$(date +%Y%m%d_%H%M%S) 2>/dev/null

cat > index.php << 'EOF'
<?php
$requestUri = $_SERVER['REQUEST_URI'] ?? '/';

// Se for API, Admin ou Storage, redirecionar para Laravel
if (preg_match('#^/(api|admin|storage)#', $requestUri)) {
    // Definir variáveis SERVER necessárias para o Laravel
    $_SERVER['SCRIPT_NAME'] = '/index.php';
    $_SERVER['PHP_SELF'] = '/index.php';
    $_SERVER['REQUEST_METHOD'] = $_SERVER['REQUEST_METHOD'] ?? 'GET';
    $_SERVER['HTTP_HOST'] = $_SERVER['HTTP_HOST'] ?? 'betgeniusbr.com';
    $_SERVER['SERVER_NAME'] = $_SERVER['SERVER_NAME'] ?? 'betgeniusbr.com';
    $_SERVER['SERVER_PORT'] = $_SERVER['SERVER_PORT'] ?? '80';
    $_SERVER['HTTPS'] = $_SERVER['HTTPS'] ?? 'on';
    $_SERVER['REMOTE_ADDR'] = $_SERVER['REMOTE_ADDR'] ?? '127.0.0.1';
    $_SERVER['SERVER_PROTOCOL'] = $_SERVER['SERVER_PROTOCOL'] ?? 'HTTP/1.1';
    $_SERVER['QUERY_STRING'] = $_SERVER['QUERY_STRING'] ?? '';
    $_SERVER['REQUEST_URI'] = $requestUri;
    
    // Mudar para o diretório public e chamar Laravel
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
EOF

chmod 644 index.php
echo "✅ index.php corrigido!"
echo ""
echo "2️⃣ Testando sintaxe:"
echo "───────────────────────────────────────────────────────────────"
php -l index.php
echo ""
echo ""

echo "3️⃣ Aguardando 3 segundos..."
sleep 3
echo ""

echo "4️⃣ Testando API:"
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

