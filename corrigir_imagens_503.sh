#!/bin/bash

# Script para corrigir erros 503 nas imagens
# Execute via SSH: ssh -p 65002 u127271520@betgeniusbr.com

echo "=== CORRIGINDO ERROS 503 NAS IMAGENS ==="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html || {
    echo "❌ Erro: Não foi possível acessar o diretório"
    exit 1
}

echo "1. Verificando/Criando symlink storage..."
if [ ! -L "public/storage" ] && [ ! -d "public/storage" ]; then
    echo "   Criando symlink..."
    php artisan storage:link
    echo "   ✅ Symlink criado"
elif [ -d "public/storage" ] && [ ! -L "public/storage" ]; then
    echo "   ⚠️  public/storage já existe como diretório (não symlink)"
    echo "   Isso está OK se as imagens estão lá"
else
    echo "   ✅ Symlink já existe"
fi
echo ""

echo "2. Verificando permissões..."
if [ -d "public/storage" ]; then
    chmod -R 755 public/storage
    echo "   ✅ Permissões ajustadas para 755"
fi
echo ""

echo "3. Verificando .htaccess na raiz..."
if [ -f ".htaccess" ]; then
    # Verificar se já tem regras para storage
    if ! grep -q "storage" .htaccess; then
        echo "   Adicionando regras para storage no .htaccess..."
        cat >> .htaccess << 'HTACCESSEOF'

# Servir arquivos do storage diretamente
RewriteCond %{REQUEST_URI} ^/storage/(.+)$ [NC]
RewriteCond %{DOCUMENT_ROOT}/public/storage/%1 -f
RewriteRule ^storage/(.+)$ public/storage/$1 [L]
HTACCESSEOF
        echo "   ✅ Regras adicionadas"
    else
        echo "   ✅ .htaccess já tem regras para storage"
    fi
else
    echo "   ❌ .htaccess não existe na raiz!"
fi
echo ""

echo "4. Verificando .htaccess em public/..."
if [ -f "public/.htaccess" ]; then
    # Verificar se serve arquivos estáticos antes do index.php
    if ! grep -q "REQUEST_FILENAME.*-f" public/.htaccess; then
        echo "   ⚠️  .htaccess em public/ pode não estar servindo arquivos estáticos corretamente"
    else
        echo "   ✅ .htaccess em public/ parece estar correto"
    fi
else
    echo "   ⚠️  .htaccess não existe em public/"
fi
echo ""

echo "5. Testando se arquivos existem..."
webp_count=$(find public/storage -name "*.webp" 2>/dev/null | wc -l)
if [ "$webp_count" -eq 0 ]; then
    echo "   ⚠️  Nenhum arquivo .webp encontrado!"
    echo "   💡 Você precisa baixar as imagens via admin:"
    echo "      Acesse /zirigui → Gerenciamento de Jogos → Baixar Imagens"
else
    echo "   ✅ Encontrados $webp_count arquivos .webp"
fi
echo ""

echo "6. Limpando cache do Laravel..."
php artisan cache:clear
php artisan config:clear
php artisan route:clear
echo "   ✅ Cache limpo"
echo ""

echo "=== CORREÇÕES APLICADAS ==="
echo ""
echo "📋 Próximos passos:"
echo "1. Se não há imagens, baixe-as via admin"
echo "2. Teste acessar uma imagem diretamente: https://betgeniusbr.com/storage/[nome-do-arquivo.webp]"
echo "3. Verifique o console do navegador para ver se os erros 503 desapareceram"
echo ""

