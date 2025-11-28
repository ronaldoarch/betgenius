#!/bin/bash

# ============================================================
# ✅ SOLUÇÃO FINAL - ERRO 403
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 SOLUÇÃO FINAL - ERRO 403"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Fazendo backup dos arquivos existentes..."
cp .htaccess .htaccess.backup.$(date +%Y%m%d_%H%M%S) 2>/dev/null
cp index.php index.php.backup.$(date +%Y%m%d_%H%M%S) 2>/dev/null
echo "✅ Backup criado"
echo ""

echo "2️⃣ Criando index.php na raiz (redireciona para public/)..."
cat > index.php << 'EOF'
<?php
/**
 * Redireciona para public/index.php
 * Este arquivo é necessário quando o Document Root aponta para public_html
 */

// Verifica se public/index.php existe
if (file_exists(__DIR__ . '/public/index.php')) {
    // Redireciona para public/index.php
    require __DIR__ . '/public/index.php';
} else {
    // Se não existir, mostra erro
    http_response_code(500);
    die('Erro: public/index.php não encontrado!');
}
EOF
chmod 644 index.php
echo "✅ index.php criado na raiz"
echo ""

echo "3️⃣ Criando .htaccess simplificado na raiz..."
cat > .htaccess << 'EOF'
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /

  # Permitir acesso direto a arquivos e diretórios existentes
  RewriteCond %{REQUEST_FILENAME} -f
  RewriteRule ^ - [L]

  RewriteCond %{REQUEST_FILENAME} -d
  RewriteRule ^ - [L]

  # Se não for arquivo nem diretório, redirecionar para public/
  RewriteRule ^(.*)$ public/$1 [L]
</IfModule>

# Permitir acesso ao index.php
<Files index.php>
  Order allow,deny
  Allow from all
</Files>
EOF
chmod 644 .htaccess
echo "✅ .htaccess criado"
echo ""

echo "4️⃣ Verificando permissões..."
chmod 755 public/ 2>/dev/null
chmod 644 public/index.php 2>/dev/null
chmod 644 public/.htaccess 2>/dev/null
echo "✅ Permissões verificadas"
echo ""

echo "5️⃣ Verificando se os arquivos foram criados..."
ls -la index.php .htaccess public/index.php 2>/dev/null | head -5
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ PRONTO!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 PRÓXIMOS PASSOS:"
echo ""
echo "1. Limpe o cache do navegador (Ctrl+Shift+R ou Cmd+Shift+R)"
echo "2. Teste: https://betgeniusbr.com/"
echo ""
echo "⚠️  Se ainda não funcionar:"
echo ""
echo "   O Document Root precisa estar apontando para:"
echo "   → public_html"
echo ""
echo "   Para alterar no hPanel:"
echo "   1. Acesse: https://hpanel.hostinger.com/"
echo "   2. Vá em: Domínios → betgeniusbr.com → Configurações"
echo "   3. Procure: 'Document Root' ou 'Raiz do Documento'"
echo "   4. Altere para: public_html"
echo "   5. Salve e aguarde 2-3 minutos"
echo ""
echo "═══════════════════════════════════════════════════════════════"

