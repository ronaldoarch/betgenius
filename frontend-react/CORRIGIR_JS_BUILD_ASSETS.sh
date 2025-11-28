#!/bin/bash

# ============================================================
# ✅ CORRIGIR SERVIÇO DE ARQUIVOS JS EM build/assets/
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO SERVIÇO DE ARQUIVOS JS EM build/assets/"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Fazendo backup do .htaccess em public/..."
if [ -f "public/.htaccess" ]; then
    cp public/.htaccess public/.htaccess.backup.$(date +%Y%m%d_%H%M%S)
    echo "✅ Backup criado"
fi
echo ""

echo "2️⃣ Verificando se os arquivos JS existem..."
if [ -f "public/build/assets/app-B_hQ-3H-.js" ]; then
    echo "✅ Arquivo app-B_hQ-3H-.js existe"
    ls -lh public/build/assets/app-B_hQ-3H-.js | awk '{print "   Tamanho: " $5}'
else
    echo "⚠️  Arquivo app-B_hQ-3H-.js não encontrado"
fi
echo ""

echo "3️⃣ Criando .htaccess corrigido em public/..."
cat > public/.htaccess << 'EOF'
<IfModule mod_rewrite.c>
    <IfModule mod_negotiation.c>
        Options -MultiViews -Indexes
    </IfModule>

    RewriteEngine On

    # Handle Authorization Header
    RewriteCond %{HTTP:Authorization} .
    RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]

    # CRÍTICO: Permitir acesso direto a arquivos estáticos ANTES de qualquer redirecionamento
    # Isso inclui arquivos em build/, assets/, css/, js/, images/, etc.
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteRule ^ - [L]

    # Permitir acesso a diretórios existentes
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

# Headers para arquivos JavaScript (forçar MIME type correto)
<FilesMatch "\.(js|mjs)$">
    <IfModule mod_headers.c>
        Header set Content-Type "application/javascript; charset=utf-8"
    </IfModule>
</FilesMatch>

# Headers para arquivos CSS
<FilesMatch "\.css$">
    <IfModule mod_headers.c>
        Header set Content-Type "text/css; charset=utf-8"
    </IfModule>
</FilesMatch>
EOF
chmod 644 public/.htaccess
echo "✅ .htaccess corrigido em public/"
echo ""

echo "4️⃣ Verificando permissões dos arquivos JS..."
if [ -d "public/build/assets" ]; then
    chmod -R 644 public/build/assets/*.js 2>/dev/null
    chmod -R 644 public/build/assets/*.css 2>/dev/null
    echo "✅ Permissões ajustadas para arquivos em build/assets/"
else
    echo "⚠️  Diretório build/assets/ não encontrado"
fi
echo ""

echo "5️⃣ Limpando cache do Laravel..."
php artisan config:clear 2>/dev/null || echo "⚠️  Erro ao limpar config cache"
php artisan cache:clear 2>/dev/null || echo "⚠️  Erro ao limpar cache"
php artisan route:clear 2>/dev/null || echo "⚠️  Erro ao limpar route cache"
php artisan view:clear 2>/dev/null || echo "⚠️  Erro ao limpar view cache"
php artisan optimize:clear 2>/dev/null || echo "⚠️  Erro ao limpar optimize cache"
echo "✅ Cache limpo"
echo ""

echo "6️⃣ Verificando estrutura final..."
echo "Arquivos JS encontrados em build/assets/:"
ls -lh public/build/assets/*.js 2>/dev/null | head -5 | awk '{print "   " $9 " (" $5 ")"}' || echo "   Nenhum arquivo encontrado"
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ PROCESSO CONCLUÍDO!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 O que foi feito:"
echo "   ✅ .htaccess corrigido para servir arquivos estáticos diretamente"
echo "   ✅ MIME types configurados corretamente"
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

