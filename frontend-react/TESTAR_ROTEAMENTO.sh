#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "=== Testando /zirigui ==="
curl -s -I "https://betgeniusbr.com/zirigui" | head -10
echo ""
echo ""

echo "=== Verificando se o problema é o REQUEST_URI ==="
echo "Criando script de debug..."
cat > public/debug_rewrite.php << 'PHPEOF'
<?php
echo "REQUEST_URI: " . ($_SERVER['REQUEST_URI'] ?? 'N/A') . "\n";
echo "SCRIPT_NAME: " . ($_SERVER['SCRIPT_NAME'] ?? 'N/A') . "\n";
echo "PHP_SELF: " . ($_SERVER['PHP_SELF'] ?? 'N/A') . "\n";
echo "DOCUMENT_ROOT: " . ($_SERVER['DOCUMENT_ROOT'] ?? 'N/A') . "\n";
echo "SCRIPT_FILENAME: " . ($_SERVER['SCRIPT_FILENAME'] ?? 'N/A') . "\n";
PHPEOF

echo "Acesse: https://betgeniusbr.com/debug_rewrite.php"
echo ""

echo "=== Verificando se existe um diretório ou arquivo 'zirigui' ==="
ls -la public/ | grep -i zirigui || echo "Nenhum arquivo/diretório 'zirigui' encontrado"
echo ""

echo "=== Testando acesso direto ao Laravel index.php ==="
curl -s -I "https://betgeniusbr.com/public/index.php" | head -5
echo ""

echo "=== Verificando se o problema é o RewriteBase ==="
echo "O RewriteBase em public/ está como '/', mas pode precisar ser '/public/'"
echo ""

