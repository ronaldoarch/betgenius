#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 OTIMIZANDO index.php NA RAIZ"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Verificando index.php atual:"
echo "───────────────────────────────────────────────────────────────"
head -30 index.php
echo ""
echo ""

echo "2️⃣ Otimizando index.php para evitar timeouts:"
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
echo "✅ index.php otimizado!"
echo ""
echo ""

echo "3️⃣ Verificando .htaccess na raiz:"
echo "───────────────────────────────────────────────────────────────"
cat .htaccess
echo ""
echo ""

echo "4️⃣ Otimizando .htaccess para servir storage diretamente:"
echo "───────────────────────────────────────────────────────────────"
cp .htaccess .htaccess.backup.$(date +%Y%m%d_%H%M%S) 2>/dev/null

cat > .htaccess << 'EOF'
DirectoryIndex index.php index.html

Options +FollowSymLinks +SymLinksIfOwnerMatch
RewriteEngine On
RewriteBase /

# Storage - Servir arquivos estáticos diretamente (evitar passar pelo PHP)
RewriteCond %{REQUEST_URI} ^/storage/ [NC]
RewriteCond %{REQUEST_FILENAME} -f
RewriteRule ^ - [L]

# API, Admin e Storage → Executar index.php na raiz
RewriteCond %{REQUEST_URI} ^/api [NC,OR]
RewriteCond %{REQUEST_URI} ^/admin [NC,OR]
RewriteCond %{REQUEST_URI} ^/storage [NC]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^ index.php [L]

# Arquivos e diretórios existentes → Servir diretamente
RewriteCond %{REQUEST_FILENAME} -f
RewriteRule ^ - [L]

RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]

# Redirecionar tudo mais para public/
RewriteRule ^(.*)$ public/$1 [L]
EOF

chmod 644 .htaccess
echo "✅ .htaccess otimizado!"
echo ""
echo ""

echo "5️⃣ Aguardando 3 segundos..."
sleep 3
echo ""

echo "6️⃣ Testando rotas:"
echo "───────────────────────────────────────────────────────────────"
echo "Testando /api/profile/mywallet:"
curl -s -H "Accept: application/json" https://betgeniusbr.com/api/profile/mywallet | head -c 200
echo ""
echo ""
echo "Testando /storage/Games/Pragmatic_Oficial/vs10amm.webp:"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/storage/Games/Pragmatic_Oficial/vs10amm.webp)
echo "HTTP Code: $HTTP_CODE"
echo ""

echo "═══════════════════════════════════════════════════════════════"

