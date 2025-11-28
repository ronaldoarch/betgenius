#!/bin/bash

# ============================================================
# ✅ CORRIGIR PERMISSÕES - ERRO 403
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO PERMISSÕES"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Corrigindo permissões do diretório public_html..."
chmod 755 .
echo "✅ Permissões de public_html corrigidas para 755"
echo ""

echo "2️⃣ Corrigindo permissões do diretório public/..."
chmod 755 public/
echo "✅ Permissões de public/ corrigidas para 755"
echo ""

echo "3️⃣ Corrigindo permissões de arquivos importantes..."
chmod 644 .htaccess 2>/dev/null || echo "⚠️  .htaccess não encontrado na raiz"
chmod 644 public/.htaccess 2>/dev/null || echo "⚠️  .htaccess não encontrado em public/"
chmod 644 public/index.php 2>/dev/null || echo "⚠️  index.php não encontrado"
chmod 644 public/index.html 2>/dev/null || echo "⚠️  index.html não encontrado"
echo "✅ Permissões de arquivos corrigidas"
echo ""

echo "4️⃣ Verificando permissões atuais..."
echo "Permissões de public_html:"
ls -ld . | awk '{print "   " $1 " " $9}'
echo ""
echo "Permissões de public/:"
ls -ld public/ | awk '{print "   " $1 " " $9}'
echo ""

echo "5️⃣ Removendo index.php da raiz (se existir)..."
rm -f index.php
echo "✅ Verificado"
echo ""

echo "6️⃣ Criando .htaccess na raiz..."
cat > .htaccess << 'EOF'
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteBase /
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteRule ^ - [L]
    RewriteCond %{REQUEST_FILENAME} -d
    RewriteRule ^ - [L]
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule ^(.*)$ public/$1 [L]
</IfModule>
<Files .env>
    Order allow,deny
    Deny from all
</Files>
EOF
chmod 644 .htaccess
echo "✅ .htaccess criado na raiz"
echo ""

echo "7️⃣ Verificando estrutura..."
echo "Conteúdo da raiz:"
ls -la | grep -E "index\.|\.htaccess" | head -5
echo ""
echo "Conteúdo de public/:"
ls -la public/ | grep -E "index\.|\.htaccess" | head -5
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ PERMISSÕES CORRIGIDAS!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 O que foi feito:"
echo "   ✅ Permissões de public_html: 755 (drwxr-xr-x)"
echo "   ✅ Permissões de public/: 755 (drwxr-xr-x)"
echo "   ✅ Permissões de arquivos: 644"
echo "   ✅ index.php removido da raiz"
echo "   ✅ .htaccess criado na raiz"
echo ""
echo "📋 PRÓXIMOS PASSOS:"
echo "   1. Limpe o cache do navegador (Ctrl+Shift+R)"
echo "   2. Teste: https://betgeniusbr.com/"
echo ""
echo "⚠️  Se ainda houver erro 403:"
echo "   Verifique o Document Root no hPanel:"
echo "   - Deve estar: public_html"
echo "   - NÃO deve estar: public_html/public"
echo ""
echo "═══════════════════════════════════════════════════════════════"

