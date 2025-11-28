#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "=== Verificando .htaccess em public/ COMPLETO ==="
cat public/.htaccess
echo ""
echo ""

echo "=== Verificando se há problema com o arquivo ==="
wc -l public/.htaccess
echo ""

echo "=== Testando se o problema é o REQUEST_URI ==="
echo "Criando script PHP para debug..."
cat > public/test_request.php << 'PHPEOF'
<?php
echo "REQUEST_URI: " . ($_SERVER['REQUEST_URI'] ?? 'N/A') . "\n";
echo "SCRIPT_NAME: " . ($_SERVER['SCRIPT_NAME'] ?? 'N/A') . "\n";
echo "PHP_SELF: " . ($_SERVER['PHP_SELF'] ?? 'N/A') . "\n";
echo "DOCUMENT_ROOT: " . ($_SERVER['DOCUMENT_ROOT'] ?? 'N/A') . "\n";
echo "SCRIPT_FILENAME: " . ($_SERVER['SCRIPT_FILENAME'] ?? 'N/A') . "\n";
PHPEOF

echo "Acesse: https://betgeniusbr.com/test_request.php"
echo ""

echo "=== Verificando se index.html está sendo servido diretamente ==="
ls -la public/index.html
echo ""

echo "=== Tentando renomear temporariamente o index.html ==="
if [ -f "public/index.html" ]; then
    mv public/index.html public/index.html.backup
    echo "✅ index.html renomeado temporariamente"
    echo "Testando /zirigui agora..."
    curl -s -I "https://betgeniusbr.com/zirigui" | head -10
    echo ""
    echo "Restaurando index.html..."
    mv public/index.html.backup public/index.html
    echo "✅ index.html restaurado"
else
    echo "index.html não encontrado"
fi
echo ""

