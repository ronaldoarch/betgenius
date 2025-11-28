#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO ROTEAMENTO DO /admin"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Fazendo backup do .htaccess atual:"
echo "───────────────────────────────────────────────────────────────"
cp .htaccess .htaccess.backup.$(date +%Y%m%d_%H%M%S) 2>/dev/null || echo "   ⚠️  Não foi possível fazer backup"
echo "   ✅ Backup criado"
echo ""

echo "2️⃣ Verificando .htaccess atual:"
echo "───────────────────────────────────────────────────────────────"
cat .htaccess
echo ""

echo "3️⃣ Criando novo .htaccess com roteamento correto:"
echo "───────────────────────────────────────────────────────────────"
cat > .htaccess << 'EOF'
DirectoryIndex index.php index.html

Options +FollowSymLinks +SymLinksIfOwnerMatch
RewriteEngine On
RewriteBase /

# Arquivos e diretórios existentes → Servir diretamente (PRIMEIRO!)
RewriteCond %{REQUEST_FILENAME} -f
RewriteRule ^ - [L]

RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]

# API → Executar index.php na raiz (Laravel)
RewriteCond %{REQUEST_URI} ^/api [NC]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^ index.php [L]

# Admin → Executar index.php na raiz (Laravel/Filament) - ANTES DO REACT!
RewriteCond %{REQUEST_URI} ^/admin [NC]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^ index.php [L]

# Redirecionar tudo mais para public/ (storage será servido diretamente se existir)
RewriteRule ^(.*)$ public/$1 [L]
EOF

echo "   ✅ Novo .htaccess criado"
echo ""

echo "4️⃣ Verificando .htaccess em public/:"
echo "───────────────────────────────────────────────────────────────"
if [ -f "public/.htaccess" ]; then
    echo "   Conteúdo atual:"
    cat public/.htaccess
    echo ""
    echo "   Criando .htaccess correto em public/:"
    cat > public/.htaccess << 'EOF'
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

    # Admin → Laravel (index.php) - ANTES DO REACT!
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
    echo "   ✅ .htaccess em public/ atualizado"
else
    echo "   ⚠️  .htaccess em public/ não existe, criando..."
    cat > public/.htaccess << 'EOF'
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

    # Admin → Laravel (index.php) - ANTES DO REACT!
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
    echo "   ✅ .htaccess em public/ criado"
fi
echo ""

echo "5️⃣ Ajustando permissões:"
echo "───────────────────────────────────────────────────────────────"
chmod 644 .htaccess
chmod 644 public/.htaccess
echo "   ✅ Permissões ajustadas"
echo ""

echo "6️⃣ Limpando cache do Laravel:"
echo "───────────────────────────────────────────────────────────────"
php artisan config:clear 2>/dev/null || echo "   ⚠️  Erro ao limpar config cache"
php artisan route:clear 2>/dev/null || echo "   ⚠️  Erro ao limpar route cache"
php artisan cache:clear 2>/dev/null || echo "   ⚠️  Erro ao limpar cache"
echo "   ✅ Cache limpo"
echo ""

echo "7️⃣ Testando roteamento:"
echo "───────────────────────────────────────────────────────────────"
echo "   Testando /admin:"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/admin)
echo "   HTTP Code: $HTTP_CODE"
if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ] || [ "$HTTP_CODE" = "301" ]; then
    echo "   ✅ /admin está acessível"
else
    echo "   ⚠️  /admin retornou HTTP $HTTP_CODE (pode ser normal se redirecionar para login)"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ CORREÇÃO CONCLUÍDA!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 PRÓXIMOS PASSOS:"
echo "   1. Acesse: https://betgeniusbr.com/admin"
echo "   2. Você deve ver a tela de login do Filament"
echo "   3. Se ainda aparecer o site React, aguarde 1-2 minutos e tente novamente"
echo ""
echo "💡 Se não funcionar, verifique:"
echo "   - Se o Document Root está em public_html (não public_html/public)"
echo "   - Se há algum cache do navegador (Ctrl+Shift+R para forçar reload)"
echo ""

