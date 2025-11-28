#!/bin/bash

# ============================================================
# ✅ SOLUÇÃO ALTERNATIVA - CRIAR INDEX.PHP NA RAIZ
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 SOLUÇÃO ALTERNATIVA - CRIAR INDEX.PHP NA RAIZ"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Criando index.php na raiz que redireciona para public/index.html..."
cat > index.php << 'EOFINDEX'
<?php
// Redireciona para public/index.html
if (file_exists(__DIR__ . '/public/index.html')) {
    readfile(__DIR__ . '/public/index.html');
    exit;
} else {
    // Se não existir, tenta redirecionar para public/
    header('Location: /public/');
    exit;
}
EOFINDEX

chmod 644 index.php
echo "✅ index.php criado na raiz"
echo ""

echo "2️⃣ Verificando se index.html existe em public/..."
if [ -f "public/index.html" ]; then
    echo "✅ index.html existe em public/"
    ls -lh public/index.html
else
    echo "❌ index.html NÃO existe em public/"
fi
echo ""

echo "3️⃣ Ajustando .htaccess na raiz para priorizar index.php..."
cat > .htaccess << 'EOF'
Options +FollowSymLinks +SymLinksIfOwnerMatch
DirectoryIndex index.php index.html

RewriteEngine On
RewriteBase /

# Permitir acesso direto a arquivos e diretórios existentes na raiz
RewriteCond %{REQUEST_FILENAME} -f
RewriteRule ^ - [L]

RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]

# Redirecionar tudo para public/ (exceto se já estiver em public/)
RewriteCond %{REQUEST_URI} !^/public/
RewriteRule ^(.*)$ public/$1 [L]
EOF

chmod 644 .htaccess
echo "✅ .htaccess atualizado"
echo ""

echo "4️⃣ Ajustando permissões..."
chmod 755 .
chmod 755 public/
chmod 644 index.php
chmod 644 public/index.html
echo "✅ Permissões ajustadas"
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ SOLUÇÃO APLICADA!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 TESTE AGORA:"
echo "   1. Limpe o cache do navegador (Ctrl+Shift+R)"
echo "   2. Teste: https://betgeniusbr.com/"
echo ""
echo "   O index.php na raiz vai servir o conteúdo de public/index.html"
echo ""
echo "═══════════════════════════════════════════════════════════════"

