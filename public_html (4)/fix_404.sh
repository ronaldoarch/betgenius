#!/bin/bash

# =====================================
# SCRIPT DE CORREÇÃO AUTOMÁTICA DE 404
# Execute diretamente no servidor SSH
# =====================================

echo "╔════════════════════════════════════════╗"
echo "║  🔧 CORREÇÃO AUTOMÁTICA 404 LARAVEL   ║"
echo "╚════════════════════════════════════════╝"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

# 1. Limpar cache
echo "📦 [1/7] Limpando cache do Laravel..."
php artisan config:clear > /dev/null 2>&1 && echo "   ✅ config:clear" || echo "   ⚠️  config:clear falhou"
php artisan cache:clear > /dev/null 2>&1 && echo "   ✅ cache:clear" || echo "   ⚠️  cache:clear falhou"
php artisan route:clear > /dev/null 2>&1 && echo "   ✅ route:clear" || echo "   ⚠️  route:clear falhou"
php artisan view:clear > /dev/null 2>&1 && echo "   ✅ view:clear" || echo "   ⚠️  view:clear falhou"
echo ""

# 2. Corrigir .htaccess raiz
echo "📄 [2/7] Corrigindo .htaccess na raiz..."
cat > .htaccess << 'HTACCESS_ROOT'
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteRule ^(.*)$ public/$1 [L]
</IfModule>
HTACCESS_ROOT
chmod 644 .htaccess
echo "   ✅ .htaccess criado/atualizado"
echo ""

# 3. Corrigir .htaccess public
echo "📄 [3/7] Corrigindo .htaccess em public/..."
cat > public/.htaccess << 'HTACCESS_PUBLIC'
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
    RewriteCond %{REQUEST_URI} (.+)/$
    RewriteRule ^ %1 [L,R=301]

    # Send Requests To Front Controller...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^ index.php [L]
</IfModule>
HTACCESS_PUBLIC
chmod 644 public/.htaccess
echo "   ✅ public/.htaccess criado/atualizado"
echo ""

# 4. Corrigir permissões
echo "🔐 [4/7] Corrigindo permissões..."
chmod 755 public
chmod 644 public/index.php
chmod -R 775 storage bootstrap/cache 2>/dev/null
echo "   ✅ Permissões ajustadas"
echo ""

# 5. Re-otimizar
echo "⚡ [5/7] Re-otimizando aplicação..."
php artisan optimize > /dev/null 2>&1 && echo "   ✅ optimize" || echo "   ⚠️  optimize falhou"
php artisan route:cache > /dev/null 2>&1 && echo "   ✅ route:cache" || echo "   ⚠️  route:cache falhou"
echo ""

# 6. Verificar rotas
echo "🔍 [6/7] Verificando rotas registradas..."
ROUTE_COUNT=$(php artisan route:list 2>/dev/null | wc -l)
if [ $ROUTE_COUNT -gt 5 ]; then
    echo "   ✅ $ROUTE_COUNT rotas encontradas"
    echo ""
    echo "   Rotas de profile/deposit:"
    php artisan route:list | grep -E '(profile|deposit)' | head -5
else
    echo "   ⚠️  Poucas rotas encontradas ($ROUTE_COUNT)"
fi
echo ""

# 7. Teste de conectividade
echo "🧪 [7/7] Testando acesso ao Laravel..."
if [ -f "public/index.php" ]; then
    echo "   ✅ public/index.php existe"
else
    echo "   ❌ public/index.php NÃO existe!"
fi

if [ -r "public/index.php" ]; then
    echo "   ✅ public/index.php é legível"
else
    echo "   ❌ public/index.php NÃO é legível!"
fi
echo ""

echo "╔════════════════════════════════════════╗"
echo "║        ✅ CORREÇÃO CONCLUÍDA!          ║"
echo "╚════════════════════════════════════════╝"
echo ""
echo "🧪 PRÓXIMOS PASSOS:"
echo ""
echo "1️⃣  Limpe o cache do navegador (Ctrl+Shift+R)"
echo "2️⃣  Acesse: https://betgeniusbr.com"
echo "3️⃣  Acesse: https://betgeniusbr.com/profile/deposit"
echo ""
echo "📊 Se ainda não funcionar, verifique os logs:"
echo "   tail -20 storage/logs/laravel.log"
echo ""
echo "🔗 Ou teste o acesso direto:"
echo "   curl -I https://betgeniusbr.com/index.php"
echo ""

