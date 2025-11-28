#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html/public

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO .htaccess EM PUBLIC/"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Verificando .htaccess atual em public/:"
echo "───────────────────────────────────────────────────────────────"
cat .htaccess
echo ""
echo ""

echo "2️⃣ Corrigindo .htaccess para servir storage diretamente:"
echo "───────────────────────────────────────────────────────────────"
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

    # Arquivos e diretórios existentes → Servir diretamente (PRIMEIRO!)
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteRule ^ - [L]

    RewriteCond %{REQUEST_FILENAME} -d
    RewriteRule ^ - [L]

    # API → Laravel (index.php)
    RewriteCond %{REQUEST_URI} ^/api [NC]
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule ^ index.php [L]

    # Admin → Laravel (index.php)
    RewriteCond %{REQUEST_URI} ^/admin [NC]
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule ^ index.php [L]

    # Redirect Trailing Slashes If Not A Folder...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_URI} ^(.+)/$
    RewriteRule ^ %1 [L,R=301]

    # Tudo mais → React (index.html)
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_URI} !^/api
    RewriteCond %{REQUEST_URI} !^/admin
    RewriteRule ^ index.html [L]
</IfModule>
EOF

chmod 644 .htaccess
echo "✅ .htaccess em public/ corrigido!"
echo ""
echo ""

echo "3️⃣ Verificando se storage existe em public/:"
echo "───────────────────────────────────────────────────────────────"
if [ -d storage ]; then
    echo "   ✅ Diretório storage existe"
    ls -la storage | head -5
else
    echo "   ⚠️  Diretório storage não existe (normal, é symlink)"
fi
echo ""

echo "4️⃣ Aguardando 3 segundos..."
sleep 3
echo ""

echo "5️⃣ Testando arquivo de imagem:"
echo "───────────────────────────────────────────────────────────────"
curl -s -I https://betgeniusbr.com/storage/Games/Pragmatic_Oficial/vs10amm.webp | head -5
echo ""

echo "═══════════════════════════════════════════════════════════════"

