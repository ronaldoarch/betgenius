#!/bin/bash

# ============================================================
# ✅ DEPLOYAR REACT COMO SITE PRINCIPAL
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🚀 DEPLOYANDO REACT COMO SITE PRINCIPAL"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Fazendo backup dos arquivos atuais..."
if [ -f "public/index.php" ]; then
    cp public/index.php public/index.php.backup.$(date +%Y%m%d_%H%M%S)
    echo "✅ Backup do index.php criado"
fi
if [ -f "public/index.html" ]; then
    cp public/index.html public/index.html.backup.$(date +%Y%m%d_%H%M%S)
    echo "✅ Backup do index.html criado"
fi
echo ""

echo "2️⃣ Verificando se o build do React existe localmente..."
if [ -d "/Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/frontend-react/dist" ]; then
    echo "✅ Build do React encontrado localmente"
    echo "   Você precisa fazer upload dos arquivos manualmente:"
    echo "   - frontend-react/dist/index.html → public/index.html"
    echo "   - frontend-react/dist/assets/* → public/assets/*"
    echo ""
    echo "   OU execute o build no servidor (se tiver Node.js instalado)"
else
    echo "⚠️  Build do React não encontrado localmente"
    echo "   Você precisa fazer o build primeiro:"
    echo "   cd frontend-react && npm run build"
fi
echo ""

echo "3️⃣ Criando .htaccess para servir React e Laravel API..."
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
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteRule ^ - [L]

    # Permitir acesso a diretórios
    RewriteCond %{REQUEST_FILENAME} -d
    RewriteRule ^ - [L]

    # Permitir acesso à API do Laravel (redireciona para index.php do Laravel)
    RewriteCond %{REQUEST_URI} ^/api
    RewriteRule ^ index.php [L]

    # Permitir acesso ao admin (Filament)
    RewriteCond %{REQUEST_URI} ^/admin
    RewriteRule ^ index.php [L]

    # Permitir acesso ao storage
    RewriteCond %{REQUEST_URI} ^/storage
    RewriteRule ^ index.php [L]

    # Redirect Trailing Slashes If Not A Folder...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_URI} ^(.+)/$
    RewriteRule ^ %1 [L,R=301]

    # Se não for arquivo/diretório e não for API/admin/storage, servir index.html (React)
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_URI} !^/api
    RewriteCond %{REQUEST_URI} !^/admin
    RewriteCond %{REQUEST_URI} !^/storage
    RewriteRule ^ index.html [L]
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
    
    # Outros
    AddType application/json json
    AddType application/wasm wasm
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

echo "4️⃣ Criando index_laravel.php para manter Laravel funcionando..."
if [ -f "public/index.php" ]; then
    cp public/index.php public/index_laravel.php
    echo "✅ index_laravel.php criado (backup do Laravel)"
fi
echo ""

echo "5️⃣ Verificando estrutura..."
echo "Arquivos em public/:"
ls -la public/ | grep -E "index\.|\.htaccess" | head -10
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ CONFIGURAÇÃO CONCLUÍDA!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 PRÓXIMOS PASSOS:"
echo ""
echo "1. Faça upload dos arquivos do React:"
echo "   - frontend-react/dist/index.html → public/index.html"
echo "   - frontend-react/dist/assets/* → public/assets/*"
echo ""
echo "2. Verifique se os arquivos foram enviados:"
echo "   ls -la public/index.html"
echo "   ls -la public/assets/"
echo ""
echo "3. Limpe o cache do navegador (Ctrl+Shift+R)"
echo ""
echo "4. Teste: https://betgeniusbr.com/"
echo ""
echo "📋 ESTRUTURA ESPERADA:"
echo "   public/"
echo "   ├── index.html (React - site principal)"
echo "   ├── index.php (Laravel - para API/admin)"
echo "   ├── index_laravel.php (backup)"
echo "   ├── assets/ (arquivos JS/CSS do React)"
echo "   └── .htaccess (configurado para servir React e Laravel)"
echo ""
echo "═══════════════════════════════════════════════════════════════"

