#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "=== Corrigindo .htaccess para servir /storage/Games/ diretamente ==="

# Corrigir .htaccess na raiz - garantir que /storage/ seja servido ANTES de qualquer processamento
cat > .htaccess << 'EOF'
DirectoryIndex index.php index.html
Options +FollowSymLinks +SymLinksIfOwnerMatch
RewriteEngine On
RewriteBase /

# PRIMEIRO: Storage → Verificar se arquivo existe em public/storage/ e servir diretamente
# Esta regra DEVE vir ANTES de verificar REQUEST_FILENAME
RewriteCond %{REQUEST_URI} ^/storage/(.+)$ [NC]
RewriteCond %{DOCUMENT_ROOT}/public/storage/%1 -f
RewriteRule ^storage/(.+)$ public/storage/$1 [L]

# SEGUNDO: Servir arquivos e diretórios existentes diretamente
RewriteCond %{REQUEST_FILENAME} -f
RewriteRule ^ - [L]

RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]

# TERCEIRO: API, Admin (zirigui) ou Storage (arquivo não existe) → index.php na raiz
RewriteCond %{REQUEST_URI} ^/(api|zirigui|storage) [NC]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^ index.php [L]

# QUARTO: Redirecionar tudo mais para public/
RewriteRule ^(.*)$ public/$1 [L]
EOF

echo "✅ .htaccess na raiz atualizado"
echo ""

# Verificar se o arquivo de teste existe
echo "=== Verificando se arquivo de teste existe ==="
if [ -f "public/storage/Games/Pragmatic_Oficial/vs10amm.webp" ]; then
    echo "✅ Arquivo existe: public/storage/Games/Pragmatic_Oficial/vs10amm.webp"
    ls -lh public/storage/Games/Pragmatic_Oficial/vs10amm.webp
else
    echo "❌ Arquivo NÃO existe: public/storage/Games/Pragmatic_Oficial/vs10amm.webp"
    echo "Verificando caminho alternativo..."
    find storage/app/public/Games -name "vs10amm.webp" 2>/dev/null | head -1
fi
echo ""

# Testar se a imagem agora retorna corretamente
echo "=== Testando imagem de jogo ==="
curl -s -I "https://betgeniusbr.com/storage/Games/Pragmatic_Oficial/vs10amm.webp" | head -5
echo ""

# Limpar cache
php artisan config:clear
php artisan cache:clear

echo "✅ Correção concluída!"

