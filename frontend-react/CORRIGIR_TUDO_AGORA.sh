#!/bin/bash

# ============================================================
# ✅ CORRIGIR TUDO - ERRO 403 (SOLUÇÃO COMPLETA)
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO TUDO - ERRO 403"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Removendo index.php da raiz (se existir)..."
if [ -f "index.php" ]; then
    mv index.php index.php.backup.$(date +%Y%m%d_%H%M%S) 2>/dev/null
    echo "✅ index.php removido da raiz"
else
    echo "✅ Não há index.php na raiz"
fi
echo ""

echo "2️⃣ Criando .htaccess correto na raiz..."
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

# Impede acesso ao .env
<Files .env>
    Order allow,deny
    Deny from all
</Files>
EOF
chmod 644 .htaccess
echo "✅ .htaccess criado na raiz"
echo ""

echo "3️⃣ Verificando/criando .htaccess em public/..."
if [ ! -f "public/.htaccess" ]; then
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
    echo "✅ .htaccess criado em public/"
else
    echo "✅ .htaccess já existe em public/"
fi
echo ""

echo "4️⃣ Ajustando permissões..."
chmod 755 . 2>/dev/null
chmod 755 public/ 2>/dev/null
chmod 644 public/index.php 2>/dev/null
chmod 644 .htaccess 2>/dev/null
chmod 644 public/.htaccess 2>/dev/null
chmod -R 755 storage bootstrap/cache 2>/dev/null
echo "✅ Permissões ajustadas"
echo ""

echo "5️⃣ Verificando se public/index.php existe..."
if [ -f "public/index.php" ]; then
    echo "✅ public/index.php existe"
    if [ -r "public/index.php" ]; then
        echo "✅ public/index.php é legível"
    else
        echo "⚠️  public/index.php não é legível - ajustando permissões..."
        chmod 644 public/index.php
    fi
else
    echo "❌ public/index.php NÃO existe!"
    echo "⚠️  PROBLEMA GRAVE: O arquivo index.php não existe em public/"
fi
echo ""

echo "6️⃣ Limpando cache do Laravel..."
php artisan config:clear 2>/dev/null || echo "⚠️  Erro ao limpar config cache"
php artisan cache:clear 2>/dev/null || echo "⚠️  Erro ao limpar cache"
php artisan route:clear 2>/dev/null || echo "⚠️  Erro ao limpar route cache"
php artisan view:clear 2>/dev/null || echo "⚠️  Erro ao limpar view cache"
php artisan optimize:clear 2>/dev/null || echo "⚠️  Erro ao limpar optimize cache"
echo "✅ Cache limpo"
echo ""

echo "7️⃣ Regenerando autoload do Composer..."
composer dump-autoload 2>/dev/null || echo "⚠️  Erro ao regenerar autoload"
echo "✅ Autoload regenerado"
echo ""

echo "8️⃣ Otimizando aplicação..."
php artisan config:cache 2>/dev/null || echo "⚠️  Erro ao cachear config"
php artisan route:cache 2>/dev/null || echo "⚠️  Erro ao cachear routes"
php artisan view:cache 2>/dev/null || echo "⚠️  Erro ao cachear views"
echo "✅ Aplicação otimizada"
echo ""

echo "9️⃣ Verificando estrutura final..."
echo "Estrutura de arquivos:"
ls -la | grep -E "^d|index.php|\.htaccess" | head -5
ls -la public/ | grep -E "^d|index.php|\.htaccess" | head -5
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ PROCESSO CONCLUÍDO!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 O que foi feito:"
echo "   ✅ index.php removido da raiz"
echo "   ✅ .htaccess criado/corrigido na raiz"
echo "   ✅ .htaccess verificado/criado em public/"
echo "   ✅ Permissões ajustadas"
echo "   ✅ Cache limpo"
echo "   ✅ Aplicação otimizada"
echo ""
echo "⚠️  AÇÃO NECESSÁRIA NO hPanel:"
echo ""
echo "   O Document Root DEVE estar apontando para:"
echo "   → public_html"
echo ""
echo "   Para verificar/alterar:"
echo "   1. Acesse: https://hpanel.hostinger.com/"
echo "   2. Vá em: Domínios → betgeniusbr.com → Configurações"
echo "   3. Procure: 'Document Root' ou 'Raiz do Documento'"
echo "   4. Deve estar: public_html (SEM /public no final)"
echo "   5. Se estiver diferente, altere e salve"
echo "   6. Aguarde 2-3 minutos"
echo ""
echo "📋 Depois:"
echo "   1. Limpe o cache do navegador (Ctrl+Shift+R)"
echo "   2. Teste: https://betgeniusbr.com/"
echo ""
echo "═══════════════════════════════════════════════════════════════"

