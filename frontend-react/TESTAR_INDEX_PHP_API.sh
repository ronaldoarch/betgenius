#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 TESTANDO SE index.php ESTÁ SENDO EXECUTADO PARA /api/*"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Criando index.php de teste que registra quando é executado:"
echo "───────────────────────────────────────────────────────────────"
cp index.php index.php.backup.$(date +%Y%m%d_%H%M%S) 2>/dev/null

cat > index.php << 'EOF'
<?php
// Registrar que este arquivo foi executado
file_put_contents(__DIR__ . '/index_executed.log', date('Y-m-d H:i:s') . " - REQUEST_URI: " . ($_SERVER['REQUEST_URI'] ?? 'N/A') . "\n", FILE_APPEND);

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
echo "✅ index.php atualizado com log!"
echo ""

echo "2️⃣ Limpando log anterior:"
echo "───────────────────────────────────────────────────────────────"
rm -f index_executed.log
echo "✅ Log limpo"
echo ""

echo "3️⃣ Aguardando 3 segundos..."
sleep 3
echo ""

echo "4️⃣ Fazendo requisição para /api/games/all:"
echo "───────────────────────────────────────────────────────────────"
curl -s -H "Accept: application/json" https://betgeniusbr.com/api/games/all > /dev/null
echo "✅ Requisição feita"
echo ""

echo "5️⃣ Verificando se index.php foi executado:"
echo "───────────────────────────────────────────────────────────────"
if [ -f index_executed.log ]; then
    echo "✅ index.php FOI EXECUTADO!"
    cat index_executed.log
else
    echo "❌ index.php NÃO FOI EXECUTADO!"
    echo "   Isso significa que o .htaccess não está chamando o index.php"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"

