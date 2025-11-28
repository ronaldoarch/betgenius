#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "=== 1. Verificando .htaccess na raiz ==="
cat .htaccess
echo ""
echo ""

echo "=== 2. Verificando se existe index.html em public/ ==="
ls -la public/index.html
echo ""

echo "=== 3. Verificando se existe index.php em public/ ==="
ls -la public/index.php
echo ""

echo "=== 4. Testando REQUEST_URI quando acessa /zirigui ==="
# Criar um script PHP temporário para ver o que está acontecendo
cat > public/test_rewrite.php << 'PHPEOF'
<?php
echo "REQUEST_URI: " . ($_SERVER['REQUEST_URI'] ?? 'N/A') . "\n";
echo "SCRIPT_NAME: " . ($_SERVER['SCRIPT_NAME'] ?? 'N/A') . "\n";
echo "PHP_SELF: " . ($_SERVER['PHP_SELF'] ?? 'N/A') . "\n";
echo "REQUEST_FILENAME: " . ($_SERVER['REQUEST_FILENAME'] ?? 'N/A') . "\n";
echo "DOCUMENT_ROOT: " . ($_SERVER['DOCUMENT_ROOT'] ?? 'N/A') . "\n";
PHPEOF

echo "Acesse: https://betgeniusbr.com/test_rewrite.php?test=/zirigui"
echo ""

echo "=== 5. Verificando se o problema é o DirectoryIndex ==="
echo "O DirectoryIndex pode estar servindo index.html antes das regras de rewrite"
echo ""

echo "=== 6. Testando acesso direto ao Laravel ==="
curl -s -I "https://betgeniusbr.com/public/index.php" | head -5
echo ""
