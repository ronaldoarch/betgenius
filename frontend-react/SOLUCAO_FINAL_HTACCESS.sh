#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO .htaccess - SOLUÇÃO FINAL"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Verificando .htaccess na RAIZ..."
echo "───────────────────────────────────────────────────────────────"
cat .htaccess
echo ""
echo ""

echo "2️⃣ Verificando .htaccess em PUBLIC (antes)..."
echo "───────────────────────────────────────────────────────────────"
cat public/.htaccess
echo ""
echo ""

echo "3️⃣ Corrigindo .htaccess em PUBLIC..."
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

    # ⚠️ CRÍTICO: API/Admin/Storage PRIMEIRO → Laravel (index.php)
    # Esta regra DEVE vir ANTES de qualquer outra!
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

DirectoryIndex index.html index.php
EOF

chmod 644 .htaccess
echo "✅ .htaccess em PUBLIC corrigido!"
echo ""
echo "4️⃣ Verificando .htaccess em PUBLIC (depois)..."
echo "───────────────────────────────────────────────────────────────"
cat .htaccess
echo ""
echo ""

cd ..

echo "5️⃣ Aguardando 3 segundos para propagar..."
sleep 3
echo ""

echo "6️⃣ Testando APIs..."
echo "───────────────────────────────────────────────────────────────"
echo ""

echo "Teste 1: /api/games/all"
RESPONSE1=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/games/all | head -c 200)
echo "$RESPONSE1"
if [[ "$RESPONSE1" == "{"* ]] || [[ "$RESPONSE1" == "["* ]]; then
    echo "   ✅ SUCESSO! Retornou JSON"
else
    echo "   ❌ FALHOU! Retornou HTML"
fi
echo ""

echo "Teste 2: /api/settings/banners"
RESPONSE2=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/banners | head -c 200)
echo "$RESPONSE2"
if [[ "$RESPONSE2" == "{"* ]] || [[ "$RESPONSE2" == "["* ]]; then
    echo "   ✅ SUCESSO! Retornou JSON"
else
    echo "   ❌ FALHOU! Retornou HTML"
fi
echo ""

echo "Teste 3: /api/categories"
RESPONSE3=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/categories | head -c 200)
echo "$RESPONSE3"
if [[ "$RESPONSE3" == "{"* ]] || [[ "$RESPONSE3" == "["* ]]; then
    echo "   ✅ SUCESSO! Retornou JSON"
else
    echo "   ❌ FALHOU! Retornou HTML"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ Correção concluída!"
echo "═══════════════════════════════════════════════════════════════"

