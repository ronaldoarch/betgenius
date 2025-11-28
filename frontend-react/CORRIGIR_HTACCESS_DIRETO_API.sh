#!/bin/bash

# ============================================================
# ✅ CORRIGIR .HTACCESS - REDIRECIONAR API DIRETAMENTE
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO .HTACCESS - REDIRECIONAR API DIRETAMENTE"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Fazendo backup dos .htaccess..."
cp .htaccess .htaccess.backup.$(date +%Y%m%d_%H%M%S)
cp public/.htaccess public/.htaccess.backup.$(date +%Y%m%d_%H%M%S)
echo "✅ Backups criados"
echo ""

echo "2️⃣ Corrigindo .htaccess na raiz - redirecionar API diretamente..."
cat > .htaccess << 'EOF'
Options +FollowSymLinks +SymLinksIfOwnerMatch
RewriteEngine On
RewriteBase /

# CRÍTICO: Redirecionar rotas da API diretamente para public/index.php
RewriteCond %{REQUEST_URI} ^/api
RewriteRule ^api/(.*)$ public/index.php [L]

# CRÍTICO: Redirecionar rotas do admin diretamente para public/index.php
RewriteCond %{REQUEST_URI} ^/admin
RewriteRule ^admin/(.*)$ public/index.php [L]

# CRÍTICO: Redirecionar rotas do storage diretamente para public/index.php
RewriteCond %{REQUEST_URI} ^/storage
RewriteRule ^storage/(.*)$ public/index.php [L]

# Permitir acesso direto a arquivos e diretórios existentes na raiz
RewriteCond %{REQUEST_FILENAME} -f
RewriteRule ^ - [L]

RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]

# Redirecionar tudo mais para public/
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^(.*)$ public/$1 [L]
EOF

chmod 644 .htaccess
echo "✅ .htaccess na raiz atualizado"
echo ""

echo "3️⃣ Corrigindo .htaccess em public/..."
cat > public/.htaccess << 'EOFPUBLIC'
<IfModule mod_rewrite.c>
    <IfModule mod_negotiation.c>
        Options -MultiViews -Indexes
    </IfModule>

    RewriteEngine On
    RewriteBase /

    # Handle Authorization Header
    RewriteCond %{HTTP:Authorization} .
    RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]

    # CRÍTICO: Processar rotas da API PRIMEIRO
    RewriteCond %{REQUEST_URI} ^/api [NC]
    RewriteRule ^ index.php [L]

    # CRÍTICO: Processar rotas do admin PRIMEIRO
    RewriteCond %{REQUEST_URI} ^/admin [NC]
    RewriteRule ^ index.php [L]

    # CRÍTICO: Processar rotas do storage PRIMEIRO
    RewriteCond %{REQUEST_URI} ^/storage [NC]
    RewriteRule ^ index.php [L]

    # Permitir acesso direto a arquivos estáticos
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteRule ^ - [L]

    # Permitir acesso direto a diretórios
    RewriteCond %{REQUEST_FILENAME} -d
    RewriteRule ^ - [L]

    # Redirect Trailing Slashes If Not A Folder...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_URI} ^(.+)/$
    RewriteRule ^ %1 [L,R=301]

    # Tudo mais vai para index.html (React)
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_URI} !^/api
    RewriteCond %{REQUEST_URI} !^/admin
    RewriteCond %{REQUEST_URI} !^/storage
    RewriteRule ^ index.html [L]
</IfModule>

# Priorizar index.html sobre index.php para rotas não-API
DirectoryIndex index.html index.php
EOFPUBLIC

chmod 644 public/.htaccess
echo "✅ .htaccess em public/ atualizado"
echo ""

echo "4️⃣ Testando se a API agora retorna JSON..."
echo "  Aguardando 3 segundos para o servidor processar..."
sleep 3
echo ""
echo "  GET /api/games:"
API_RESPONSE=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/games | head -c 500)
if echo "$API_RESPONSE" | grep -q "DOCTYPE\|html"; then
    echo "    ❌ Ainda retornando HTML"
    echo "    Primeiros caracteres:"
    echo "$API_RESPONSE" | head -c 200
else
    echo "    ✅ Retornando JSON ou dados corretos"
    echo "    Primeiros caracteres:"
    echo "$API_RESPONSE"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ CORREÇÃO APLICADA!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 TESTE AGORA:"
echo "   1. Limpe o cache do navegador (Ctrl+Shift+R)"
echo "   2. Teste: https://betgeniusbr.com/"
echo "   3. Verifique se os dados estão carregando"
echo ""
echo "═══════════════════════════════════════════════════════════════"

