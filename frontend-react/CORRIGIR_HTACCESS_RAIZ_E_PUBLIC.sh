#!/bin/bash

# ============================================================
# ✅ CORRIGIR .htaccess NA RAIZ E EM public/
# ============================================================
# O problema pode estar no .htaccess da raiz que está
# redirecionando tudo, incluindo arquivos estáticos

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO .htaccess NA RAIZ E EM public/"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Fazendo backup dos arquivos .htaccess..."
if [ -f ".htaccess" ]; then
    cp .htaccess .htaccess.backup.$(date +%Y%m%d_%H%M%S)
    echo "✅ Backup do .htaccess da raiz criado"
fi
if [ -f "public/.htaccess" ]; then
    cp public/.htaccess public/.htaccess.backup.$(date +%Y%m%d_%H%M%S)
    echo "✅ Backup do .htaccess em public/ criado"
fi
echo ""

echo "2️⃣ Criando .htaccess correto na RAIZ..."
cat > .htaccess << 'EOF'
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteBase /

    # CRÍTICO: Permitir acesso direto a arquivos e diretórios existentes
    # Isso garante que arquivos estáticos sejam servidos diretamente
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteRule ^ - [L]

    RewriteCond %{REQUEST_FILENAME} -d
    RewriteRule ^ - [L]

    # Redirecionar tudo para public/ (apenas se não for arquivo/diretório)
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule ^(.*)$ public/$1 [L]
</IfModule>

# Configurar MIME types na raiz também
<IfModule mod_mime.c>
    AddType application/javascript js
    AddType application/javascript mjs
    AddType text/javascript js
    AddType text/css css
    AddType image/svg+xml svg svgz
    AddType application/json json
    AddType application/wasm wasm
    AddType font/woff2 woff2
    AddType font/woff woff
    AddType font/ttf ttf
</IfModule>

# Impede acesso ao .env
<Files .env>
    Order allow,deny
    Deny from all
</Files>
EOF
chmod 644 .htaccess
echo "✅ .htaccess criado na raiz"
echo ""

echo "3️⃣ Criando .htaccess correto em public/..."
cat > public/.htaccess << 'EOF'
<IfModule mod_rewrite.c>
    <IfModule mod_negotiation.c>
        Options -MultiViews -Indexes
    </IfModule>

    RewriteEngine On

    # Handle Authorization Header
    RewriteCond %{HTTP:Authorization} .
    RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]

    # CRÍTICO: Permitir acesso direto a arquivos estáticos PRIMEIRO
    # Isso deve vir ANTES de qualquer outra regra
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteRule ^ - [L]

    # Permitir acesso a diretórios
    RewriteCond %{REQUEST_FILENAME} -d
    RewriteRule ^ - [L]

    # Redirect Trailing Slashes If Not A Folder...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_URI} ^(.+)/$
    RewriteRule ^ %1 [L,R=301]

    # Send Requests To Front Controller (apenas se não for arquivo/diretório)
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^ index.php [L]
</IfModule>

# Configurar MIME types corretos
<IfModule mod_mime.c>
    # JavaScript
    AddType application/javascript js
    AddType application/javascript mjs
    AddType text/javascript js
    
    # CSS
    AddType text/css css
    
    # Imagens
    AddType image/svg+xml svg svgz
    AddType image/png png
    AddType image/jpeg jpg jpeg
    AddType image/gif gif
    AddType image/webp webp
    
    # Fontes
    AddType font/woff woff
    AddType font/woff2 woff2
    AddType font/ttf ttf
    AddType font/otf otf
    AddType application/font-woff woff
    AddType application/font-woff2 woff2
    
    # Outros
    AddType application/json json
    AddType application/wasm wasm
    AddType application/xml xml
</IfModule>

# Headers para forçar MIME type correto
<FilesMatch "\.(js|mjs)$">
    <IfModule mod_headers.c>
        Header set Content-Type "application/javascript; charset=utf-8"
    </IfModule>
</FilesMatch>

<FilesMatch "\.css$">
    <IfModule mod_headers.c>
        Header set Content-Type "text/css; charset=utf-8"
    </IfModule>
</FilesMatch>
EOF
chmod 644 public/.htaccess
echo "✅ .htaccess criado em public/"
echo ""

echo "4️⃣ Verificando se os arquivos JS existem..."
if [ -f "public/build/assets/app-B_hQ-3H-.js" ]; then
    echo "✅ Arquivo app-B_hQ-3H-.js existe"
    ls -lh public/build/assets/app-B_hQ-3H-.js | awk '{print "   Tamanho: " $5 " | Permissões: " $1}'
else
    echo "⚠️  Arquivo app-B_hQ-3H-.js não encontrado em public/build/assets/"
fi
echo ""

echo "5️⃣ Ajustando permissões..."
chmod 755 . 2>/dev/null
chmod 755 public/ 2>/dev/null
chmod -R 755 public/build/ 2>/dev/null
chmod -R 644 public/build/assets/*.js 2>/dev/null
chmod -R 644 public/build/assets/*.css 2>/dev/null
chmod 644 .htaccess
chmod 644 public/.htaccess
echo "✅ Permissões ajustadas"
echo ""

echo "6️⃣ Limpando cache do Laravel..."
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
echo "   ✅ .htaccess na raiz corrigido (verifica arquivos antes de redirecionar)"
echo "   ✅ .htaccess em public/ corrigido (serve arquivos estáticos primeiro)"
echo "   ✅ MIME types configurados em ambos os .htaccess"
echo "   ✅ Headers adicionados para forçar MIME type correto"
echo "   ✅ Permissões ajustadas"
echo "   ✅ Cache limpo"
echo ""
echo "📋 TESTE AGORA:"
echo "   1. Limpe o cache do navegador (Ctrl+Shift+R)"
echo "   2. Acesse: https://betgeniusbr.com/"
echo "   3. Os arquivos JavaScript devem carregar corretamente agora"
echo ""
echo "═══════════════════════════════════════════════════════════════"

