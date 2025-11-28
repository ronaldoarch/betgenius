#!/bin/bash

# ============================================================
# ✅ CORRIGIR ERROS 500 NAS APIs
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO ERROS 500 NAS APIs"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando estrutura de diretórios..."
pwd
ls -la | head -10
echo ""

echo "2️⃣ Limpando cache do Laravel..."
php artisan config:clear 2>/dev/null || echo "⚠️  Erro ao limpar config cache"
php artisan cache:clear 2>/dev/null || echo "⚠️  Erro ao limpar cache"
php artisan route:clear 2>/dev/null || echo "⚠️  Erro ao limpar route cache"
php artisan view:clear 2>/dev/null || echo "⚠️  Erro ao limpar view cache"
php artisan optimize:clear 2>/dev/null || echo "⚠️  Erro ao limpar optimize cache"
echo "✅ Cache limpo"
echo ""

echo "3️⃣ Verificando permissões..."
chmod -R 755 storage bootstrap/cache 2>/dev/null
chmod -R 644 .env 2>/dev/null
echo "✅ Permissões verificadas"
echo ""

echo "4️⃣ Verificando se o .htaccess em public/ está correto..."
if [ -f "public/.htaccess" ]; then
    echo "✅ .htaccess existe em public/"
    cat public/.htaccess | head -5
else
    echo "❌ .htaccess não existe em public/ - criando..."
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

    # Send Requests To Front Controller...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^ index.php [L]
</IfModule>
EOF
    chmod 644 public/.htaccess
    echo "✅ .htaccess criado"
fi
echo ""

echo "5️⃣ Verificando últimos erros nos logs..."
if [ -f "storage/logs/laravel.log" ]; then
    echo "Últimos erros:"
    tail -30 storage/logs/laravel.log | grep -i "error\|exception\|500" | tail -5 || echo "Nenhum erro recente encontrado"
else
    echo "⚠️  Arquivo de log não encontrado"
fi
echo ""

echo "6️⃣ Testando conexão com banco de dados..."
php artisan tinker --execute="echo 'DB OK';" 2>&1 | head -3 || echo "⚠️  Erro ao testar banco de dados"
echo ""

echo "7️⃣ Verificando rotas da API..."
php artisan route:list --path=api 2>/dev/null | head -10 || echo "⚠️  Erro ao listar rotas"
echo ""

echo "8️⃣ Otimizando aplicação..."
php artisan config:cache 2>/dev/null || echo "⚠️  Erro ao cachear config"
php artisan route:cache 2>/dev/null || echo "⚠️  Erro ao cachear routes"
php artisan view:cache 2>/dev/null || echo "⚠️  Erro ao cachear views"
echo "✅ Aplicação otimizada"
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ PROCESSO CONCLUÍDO!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 PRÓXIMOS PASSOS:"
echo ""
echo "1. Limpe o cache do navegador (Ctrl+Shift+R)"
echo "2. Teste as APIs:"
echo "   - https://betgeniusbr.com/api/settings/data"
echo "   - https://betgeniusbr.com/api/categories"
echo ""
echo "3. Se ainda houver erros, verifique os logs:"
echo "   tail -50 storage/logs/laravel.log"
echo ""
echo "═══════════════════════════════════════════════════════════════"

