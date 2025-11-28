#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 VERIFICANDO E CORRIGINDO TUDO"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Verificando index.php na raiz:"
echo "───────────────────────────────────────────────────────────────"
head -20 index.php
echo ""
echo ""

echo "2️⃣ Verificando .htaccess na raiz:"
echo "───────────────────────────────────────────────────────────────"
cat .htaccess
echo ""
echo ""

echo "3️⃣ Corrigindo index.php (garantir que tem REMOTE_ADDR):"
echo "───────────────────────────────────────────────────────────────"
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
echo ""

echo "4️⃣ Corrigindo .htaccess na raiz (garantir que API não é redirecionada):"
echo "───────────────────────────────────────────────────────────────"
cp .htaccess .htaccess.backup.$(date +%Y%m%d_%H%M%S) 2>/dev/null

cat > .htaccess << 'EOF'
DirectoryIndex index.php index.html

Options +FollowSymLinks +SymLinksIfOwnerMatch
RewriteEngine On
RewriteBase /

# API, Admin e Storage → NÃO redirecionar, deixar index.php na raiz lidar
RewriteCond %{REQUEST_URI} ^/api [NC,OR]
RewriteCond %{REQUEST_URI} ^/admin [NC,OR]
RewriteCond %{REQUEST_URI} ^/storage [NC]
RewriteRule ^ - [L]

# Arquivos e diretórios existentes → Servir diretamente
RewriteCond %{REQUEST_FILENAME} -f
RewriteRule ^ - [L]

RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]

# Redirecionar tudo mais para public/
RewriteRule ^(.*)$ public/$1 [L]
EOF

chmod 644 .htaccess
echo "✅ .htaccess corrigido!"
echo ""
echo ""

echo "5️⃣ Aguardando 5 segundos para propagar..."
sleep 5
echo ""

echo "6️⃣ Testando API:"
echo "───────────────────────────────────────────────────────────────"
RESPONSE=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/games/all | head -c 300)
echo "$RESPONSE"
echo ""
if [[ "$RESPONSE" == "{"* ]] || [[ "$RESPONSE" == "["* ]]; then
    echo "   ✅ SUCESSO! Retornou JSON"
else
    echo "   ❌ Ainda retorna HTML"
    echo ""
    echo "7️⃣ Testando se index.php está sendo executado:"
    echo "───────────────────────────────────────────────────────────────"
    echo "Criando arquivo de teste..."
    cat > test_index.php << 'TESTEOF'
<?php
echo "REQUEST_URI: " . ($_SERVER['REQUEST_URI'] ?? 'NÃO DEFINIDO') . "\n";
echo "SCRIPT_NAME: " . ($_SERVER['SCRIPT_NAME'] ?? 'NÃO DEFINIDO') . "\n";
echo "Este arquivo foi executado!";
TESTEOF
    chmod 644 test_index.php
    echo "✅ Arquivo criado: test_index.php"
    echo "   Teste no navegador: https://betgeniusbr.com/test_index.php"
fi

echo ""
echo "═══════════════════════════════════════════════════════════════"

