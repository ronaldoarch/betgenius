#!/bin/bash

# ============================================================
# ✅ CORRIGIR MIME TYPE DOS ARQUIVOS JAVASCRIPT
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO MIME TYPE DOS ARQUIVOS JAVASCRIPT"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Fazendo backup do .htaccess em public/..."
if [ -f "public/.htaccess" ]; then
    cp public/.htaccess public/.htaccess.backup.$(date +%Y%m%d_%H%M%S)
    echo "✅ Backup criado"
fi
echo ""

echo "2️⃣ Criando .htaccess corrigido em public/..."
cat > public/.htaccess << 'EOF'
<IfModule mod_rewrite.c>
    <IfModule mod_negotiation.c>
        Options -MultiViews -Indexes
    </IfModule>

    RewriteEngine On

    # Handle Authorization Header
    RewriteCond %{HTTP:Authorization} .
    RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]

    # Redirect Trailing Slashes If Not A Folder...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_URI} ^(.+)/$
    RewriteRule ^ %1 [L,R=301]

    # IMPORTANTE: Permitir acesso direto a arquivos estáticos ANTES de redirecionar
    # Se o arquivo existe, serve diretamente (não redireciona para index.php)
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteRule ^ - [L]

    # Se o diretório existe, permite acesso
    RewriteCond %{REQUEST_FILENAME} -d
    RewriteRule ^ - [L]

    # Send Requests To Front Controller (apenas se não for arquivo/diretório)
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^ index.php [L]
</IfModule>

# Configurar MIME types corretos
<IfModule mod_mime.c>
    AddType application/javascript js
    AddType application/javascript mjs
    AddType text/css css
    AddType image/svg+xml svg svgz
    AddType application/json json
    AddType application/wasm wasm
</IfModule>

# Headers para arquivos JavaScript
<FilesMatch "\.(js|mjs)$">
    Header set Content-Type "application/javascript; charset=utf-8"
</FilesMatch>

# Headers para arquivos CSS
<FilesMatch "\.css$">
    Header set Content-Type "text/css; charset=utf-8"
</FilesMatch>
EOF
chmod 644 public/.htaccess
echo "✅ .htaccess corrigido em public/"
echo ""

echo "3️⃣ Verificando .htaccess na raiz..."
if [ -f ".htaccess" ]; then
    echo "Conteúdo atual:"
    cat .htaccess
    echo ""
    echo "✅ .htaccess existe na raiz"
else
    echo "⚠️  .htaccess não existe na raiz - criando..."
    cat > .htaccess << 'EOF'
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteBase /

    # Permitir acesso direto a arquivos e diretórios existentes
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteRule ^ - [L]

    RewriteCond %{REQUEST_FILENAME} -d
    RewriteRule ^ - [L]

    # Redirecionar tudo para public/
    RewriteRule ^(.*)$ public/$1 [L]
</IfModule>

<Files .env>
    Order allow,deny
    Deny from all
</Files>
EOF
    chmod 644 .htaccess
    echo "✅ .htaccess criado na raiz"
fi
echo ""

echo "4️⃣ Limpando cache do Laravel..."
php artisan config:clear 2>/dev/null || echo "⚠️  Erro ao limpar config cache"
php artisan cache:clear 2>/dev/null || echo "⚠️  Erro ao limpar cache"
php artisan route:clear 2>/dev/null || echo "⚠️  Erro ao limpar route cache"
php artisan view:clear 2>/dev/null || echo "⚠️  Erro ao limpar view cache"
php artisan optimize:clear 2>/dev/null || echo "⚠️  Erro ao limpar optimize cache"
echo "✅ Cache limpo"
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ PROCESSO CONCLUÍDO!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 O que foi feito:"
echo "   ✅ .htaccess em public/ corrigido para servir arquivos estáticos"
echo "   ✅ MIME types configurados corretamente"
echo "   ✅ Headers adicionados para JavaScript e CSS"
echo "   ✅ Cache limpo"
echo ""
echo "📋 TESTE AGORA:"
echo "   1. Limpe o cache do navegador (Ctrl+Shift+R)"
echo "   2. Acesse: https://betgeniusbr.com/"
echo "   3. Os arquivos JavaScript devem carregar corretamente agora"
echo ""
echo "═══════════════════════════════════════════════════════════════"

