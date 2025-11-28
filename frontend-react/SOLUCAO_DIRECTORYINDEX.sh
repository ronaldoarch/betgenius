#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO - DirectoryIndex pode estar interferindo"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Verificando .htaccess na RAIZ:"
echo "───────────────────────────────────────────────────────────────"
cat .htaccess
echo ""
echo ""

echo "2️⃣ Corrigindo .htaccess em PUBLIC (removendo DirectoryIndex)..."
echo "───────────────────────────────────────────────────────────────"
cd public
cp .htaccess .htaccess.backup.$(date +%Y%m%d_%H%M%S) 2>/dev/null

cat > .htaccess << 'EOF'
<IfModule mod_rewrite.c>
    <IfModule mod_negotiation.c>
        Options -MultiViews -Indexes
    </IfModule>

    RewriteEngine On
    RewriteBase /

    # Handle Authorization Header
    RewriteCond %{HTTP:Authorization} .
    RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]

    # CRITICO: API/Admin/Storage PRIMEIRO → Laravel (index.php)
    # Esta regra DEVE ser a PRIMEIRA após Authorization
    RewriteCond %{REQUEST_URI} ^/api [NC,OR]
    RewriteCond %{REQUEST_URI} ^/admin [NC,OR]
    RewriteCond %{REQUEST_URI} ^/storage [NC]
    RewriteRule ^ index.php [L]

    # Arquivos estáticos → Servir diretamente
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteRule ^ - [L]

    RewriteCond %{REQUEST_FILENAME} -d
    RewriteRule ^ - [L]

    # Redirect Trailing Slashes If Not A Folder...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_URI} ^(.+)/$
    RewriteRule ^ %1 [L,R=301]

    # Tudo mais → React (index.html)
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^ index.html [L]
</IfModule>
EOF

chmod 644 .htaccess
echo "✅ .htaccess corrigido (DirectoryIndex removido)!"
echo ""
echo "3️⃣ Verificando se index.php existe e está acessível:"
echo "───────────────────────────────────────────────────────────────"
ls -la index.php
echo ""
echo ""

cd ..

echo "4️⃣ Testando se Laravel responde:"
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
require 'index.php';
" 2>&1 | head -c 300
echo ""
echo ""

cd ..

echo "5️⃣ Aguardando 3 segundos..."
sleep 3
echo ""

echo "6️⃣ Testando API via curl:"
echo "───────────────────────────────────────────────────────────────"
RESPONSE=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/games/all | head -c 300)
echo "$RESPONSE"
echo ""
if [[ "$RESPONSE" == "{"* ]] || [[ "$RESPONSE" == "["* ]]; then
    echo "   ✅ SUCESSO! Retornou JSON"
else
    echo "   ❌ FALHOU! Retornou HTML"
    echo ""
    echo "7️⃣ Verificando se o problema é o .htaccess na raiz..."
    echo "───────────────────────────────────────────────────────────────"
    echo "Vou modificar o .htaccess na raiz para não interferir:"
    cp .htaccess .htaccess.backup.$(date +%Y%m%d_%H%M%S) 2>/dev/null
    cat > .htaccess << 'ROOTEOF'
Options +FollowSymLinks +SymLinksIfOwnerMatch
RewriteEngine On
RewriteBase /

# Arquivos e diretórios existentes → Servir diretamente
RewriteCond %{REQUEST_FILENAME} -f
RewriteRule ^ - [L]

RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]

# Redirecionar tudo para public/
RewriteRule ^(.*)$ public/$1 [L]
ROOTEOF
    chmod 644 .htaccess
    echo "✅ .htaccess na raiz atualizado!"
    echo ""
    echo "Aguardando 3 segundos..."
    sleep 3
    echo ""
    echo "Testando novamente..."
    RESPONSE2=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/games/all | head -c 300)
    echo "$RESPONSE2"
    if [[ "$RESPONSE2" == "{"* ]] || [[ "$RESPONSE2" == "["* ]]; then
        echo "   ✅ SUCESSO! Retornou JSON"
    else
        echo "   ❌ Ainda retorna HTML"
    fi
fi

echo ""
echo "═══════════════════════════════════════════════════════════════"

