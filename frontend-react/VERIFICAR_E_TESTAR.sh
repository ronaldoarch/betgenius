#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "=== Verificando .htaccess em public/ ==="
cat public/.htaccess
echo ""
echo ""

echo "=== Testando /zirigui ==="
curl -s -I "https://betgeniusbr.com/zirigui" | head -10
echo ""
echo ""

echo "=== Testando conteúdo retornado (primeiras 30 linhas) ==="
curl -s "https://betgeniusbr.com/zirigui" | head -30
echo ""
echo ""

echo "=== Verificando se há erros no .htaccess ==="
apache2ctl -t 2>&1 || httpd -t 2>&1 || echo "Não foi possível verificar sintaxe (normal em shared hosting)"
echo ""

