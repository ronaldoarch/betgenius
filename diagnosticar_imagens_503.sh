#!/bin/bash

# Script para diagnosticar erros 503 nas imagens
# Execute via SSH: ssh -p 65002 u127271520@betgeniusbr.com

echo "=== DIAGNÓSTICO DE ERROS 503 NAS IMAGENS ==="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html || {
    echo "❌ Erro: Não foi possível acessar o diretório"
    exit 1
}

echo "1. Verificando diretório public/storage..."
if [ -d "public/storage" ]; then
    echo "   ✅ Diretório public/storage existe"
    echo "   📁 Conteúdo:"
    ls -la public/storage | head -10
    echo ""
    
    # Contar arquivos .webp
    webp_count=$(find public/storage -name "*.webp" 2>/dev/null | wc -l)
    echo "   📊 Total de arquivos .webp: $webp_count"
else
    echo "   ❌ Diretório public/storage NÃO existe!"
fi
echo ""

echo "2. Verificando symlink storage..."
if [ -L "public/storage" ]; then
    echo "   ✅ Symlink existe"
    echo "   🔗 Aponta para: $(readlink public/storage)"
elif [ -d "public/storage" ]; then
    echo "   ⚠️  public/storage é um diretório (não symlink)"
else
    echo "   ❌ Symlink NÃO existe!"
fi
echo ""

echo "3. Verificando permissões..."
if [ -d "public/storage" ]; then
    perms=$(stat -c "%a" public/storage 2>/dev/null || stat -f "%OLp" public/storage 2>/dev/null)
    echo "   📝 Permissões: $perms"
    if [ "$perms" != "755" ] && [ "$perms" != "775" ]; then
        echo "   ⚠️  Permissões podem estar incorretas (recomendado: 755 ou 775)"
    fi
fi
echo ""

echo "4. Verificando .htaccess..."
if [ -f ".htaccess" ]; then
    echo "   ✅ .htaccess existe na raiz"
    if grep -q "storage" .htaccess; then
        echo "   ✅ .htaccess tem regras para storage"
    else
        echo "   ⚠️  .htaccess pode não ter regras para storage"
    fi
else
    echo "   ❌ .htaccess NÃO existe na raiz!"
fi

if [ -f "public/.htaccess" ]; then
    echo "   ✅ public/.htaccess existe"
else
    echo "   ⚠️  public/.htaccess pode não existir"
fi
echo ""

echo "5. Testando acesso a uma imagem..."
# Buscar um arquivo .webp de exemplo
test_file=$(find public/storage -name "*.webp" 2>/dev/null | head -1)
if [ -n "$test_file" ]; then
    relative_path=${test_file#public/}
    echo "   📸 Testando: $relative_path"
    if [ -f "$test_file" ]; then
        echo "   ✅ Arquivo existe fisicamente"
        file_size=$(stat -c "%s" "$test_file" 2>/dev/null || stat -f "%z" "$test_file" 2>/dev/null)
        echo "   📊 Tamanho: $file_size bytes"
    else
        echo "   ❌ Arquivo NÃO existe fisicamente"
    fi
else
    echo "   ⚠️  Nenhum arquivo .webp encontrado para testar"
fi
echo ""

echo "6. Verificando configuração do Laravel..."
php artisan tinker --execute="
echo '   Storage config: ';
echo '   - public_path: ' . public_path('storage') . PHP_EOL;
echo '   - storage_path: ' . storage_path('app/public') . PHP_EOL;
echo '   - Existe public/storage? ' . (is_dir(public_path('storage')) ? 'SIM' : 'NÃO') . PHP_EOL;
echo '   - Existe storage/app/public? ' . (is_dir(storage_path('app/public')) ? 'SIM' : 'NÃO') . PHP_EOL;
" 2>/dev/null || echo "   ⚠️  Não foi possível verificar configuração"
echo ""

echo "=== FIM DO DIAGNÓSTICO ==="
echo ""
echo "📋 Próximos passos:"
echo "1. Se o symlink não existe, execute: php artisan storage:link"
echo "2. Se as imagens não existem, baixe-as via admin (Gerenciamento de Jogos)"
echo "3. Verifique permissões: chmod -R 755 public/storage"
echo ""

