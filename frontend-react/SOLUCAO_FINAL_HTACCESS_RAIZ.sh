#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO .htaccess NA RAIZ - Não redirecionar API"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Verificando se index.php existe na raiz:"
echo "───────────────────────────────────────────────────────────────"
ls -la index.php
echo ""
echo ""

echo "2️⃣ Corrigindo .htaccess na raiz (NÃO redirecionar API):"
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
echo "✅ .htaccess na raiz corrigido!"
echo ""
echo "3️⃣ Verificando conteúdo do index.php na raiz:"
echo "───────────────────────────────────────────────────────────────"
cat index.php
echo ""
echo ""

echo "4️⃣ Aguardando 3 segundos..."
sleep 3
echo ""

echo "5️⃣ Testando API:"
echo "───────────────────────────────────────────────────────────────"
RESPONSE=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/games/all | head -c 300)
echo "$RESPONSE"
echo ""
if [[ "$RESPONSE" == "{"* ]] || [[ "$RESPONSE" == "["* ]]; then
    echo "   ✅ SUCESSO! Retornou JSON"
else
    echo "   ❌ Ainda retorna HTML"
    echo ""
    echo "6️⃣ Verificando se há erros no PHP:"
    echo "───────────────────────────────────────────────────────────────"
    php -l index.php
    echo ""
    echo "7️⃣ Testando index.php diretamente:"
    echo "───────────────────────────────────────────────────────────────"
    php -r "
    \$_SERVER['REQUEST_URI'] = '/api/games/all';
    \$_SERVER['SCRIPT_NAME'] = '/index.php';
    \$_SERVER['PHP_SELF'] = '/index.php';
    require 'index.php';
    " 2>&1 | head -c 300
fi

echo ""
echo "═══════════════════════════════════════════════════════════════"

