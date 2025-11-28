#!/bin/bash

# Script de verificação completa para erro 404
# Execute: bash verificar_404.sh

echo "🔍 VERIFICAÇÃO COMPLETA - ERRO 404"
echo "=================================="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando estrutura de pastas..."
pwd
echo ""

echo "2️⃣ Verificando arquivos principais..."
[ -f "public/index.php" ] && echo "✅ public/index.php existe" || echo "❌ public/index.php NÃO existe"
[ -f ".htaccess" ] && echo "✅ .htaccess na raiz existe" || echo "❌ .htaccess na raiz NÃO existe"
[ -f "public/.htaccess" ] && echo "✅ public/.htaccess existe" || echo "❌ public/.htaccess NÃO existe"
[ -f ".env" ] && echo "✅ .env existe" || echo "❌ .env NÃO existe"
[ -f "artisan" ] && echo "✅ artisan existe" || echo "❌ artisan NÃO existe"
echo ""

echo "3️⃣ Verificando conteúdo do .htaccess na raiz..."
if [ -f ".htaccess" ]; then
    echo "--- Conteúdo do .htaccess na raiz ---"
    cat .htaccess
    echo ""
    if grep -q "RewriteRule.*public" .htaccess; then
        echo "✅ .htaccess redireciona para public/"
    else
        echo "❌ .htaccess NÃO redireciona para public/"
    fi
else
    echo "❌ .htaccess na raiz não existe - CRIANDO..."
    cat > .htaccess << 'EOF'
RewriteEngine On
RewriteRule ^$ public/ [L]
RewriteRule (.*) public/$1 [L]

<Files .env>
    Order allow,deny
    Deny from all
</Files>
EOF
    chmod 644 .htaccess
    echo "✅ .htaccess criado!"
fi
echo ""

echo "4️⃣ Verificando conteúdo do .htaccess em public/..."
if [ -f "public/.htaccess" ]; then
    echo "--- Conteúdo do public/.htaccess ---"
    cat public/.htaccess | head -10
    echo "..."
    if grep -q "RewriteRule.*index.php" public/.htaccess; then
        echo "✅ public/.htaccess tem regras do Laravel"
    else
        echo "❌ public/.htaccess pode estar incorreto"
    fi
else
    echo "❌ public/.htaccess não existe - CRIANDO..."
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
    RewriteCond %{REQUEST_URI} (.+)/$
    RewriteRule ^ %1 [L,R=301]

    # Send Requests To Front Controller...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^ index.php [L]
</IfModule>
EOF
    chmod 644 public/.htaccess
    echo "✅ public/.htaccess criado!"
fi
echo ""

echo "5️⃣ Verificando permissões..."
ls -ld .htaccess public/.htaccess public/index.php storage bootstrap/cache 2>/dev/null | awk '{print $1, $9}'
echo ""

echo "6️⃣ Corrigindo permissões..."
chmod 644 .htaccess 2>/dev/null
chmod 644 public/.htaccess 2>/dev/null
chmod 755 public 2>/dev/null
chmod 644 public/index.php 2>/dev/null
chmod -R 755 storage bootstrap/cache 2>/dev/null
echo "✅ Permissões corrigidas"
echo ""

echo "7️⃣ Verificando mod_rewrite..."
if php -m 2>/dev/null | grep -q rewrite; then
    echo "✅ mod_rewrite está habilitado"
else
    echo "❌ mod_rewrite NÃO está habilitado - Contate suporte Hostinger"
fi
echo ""

echo "8️⃣ Criando arquivo de teste..."
echo "<?php echo 'TESTE OK - ' . date('Y-m-d H:i:s'); ?>" > public/teste.php
echo "✅ Arquivo de teste criado: public/teste.php"
echo ""

echo "=================================="
echo "📋 PRÓXIMOS PASSOS:"
echo ""
echo "1. Acesse o hPanel: https://hpanel.hostinger.com/"
echo "2. Vá em: Domínios → betgeniusbr.com → Gerenciar"
echo "3. Procure: 'Document Root' ou 'Raiz do Documento'"
echo "4. ALTERE de: public_html/public"
echo "   PARA: public_html"
echo "5. Salve e aguarde 3-5 minutos"
echo ""
echo "6. Teste no navegador:"
echo "   - https://betgeniusbr.com/teste.php"
echo "   - https://betgeniusbr.com/"
echo ""
echo "7. Depois de funcionar, delete o arquivo de teste:"
echo "   rm public/teste.php"
echo ""

