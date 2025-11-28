#!/bin/bash

# Script para corrigir cache de rotas e resolver erro 404
# Execute no servidor SSH: bash fix-routes-cache.sh

echo "🔧 Corrigindo cache de rotas..."

# Limpar TODOS os caches
echo "📦 Limpando caches..."
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear
php artisan optimize:clear

# Verificar se o controller existe
echo "🔍 Verificando controller..."
if [ -f "app/Http/Controllers/Api/Categories/CategoryController.php" ]; then
    echo "✅ Controller encontrado"
else
    echo "❌ Controller NÃO encontrado!"
    exit 1
fi

# Recriar cache de configuração e rotas
echo "⚡ Recriando cache..."
php artisan config:cache
php artisan route:cache

# Verificar rotas
echo "📋 Listando rotas de categorias..."
php artisan route:list | grep -i categor

echo ""
echo "✅ Processo concluído!"
echo "🔄 Recarregue a página no navegador"

