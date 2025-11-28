#!/bin/bash

# Script para aplicar melhorias de performance no servidor
# Execute: bash aplicar-melhorias.sh

echo "🚀 Aplicando melhorias de performance..."

# Navegar para o diretório do projeto
cd "public_html (4)" || exit

# Limpar cache existente
echo "📦 Limpando cache..."
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear

# Otimizar autoloader
echo "⚡ Otimizando autoloader..."
composer dump-autoload --optimize --no-dev

# Criar cache de configuração
echo "🔧 Criando cache de configuração..."
php artisan config:cache
php artisan route:cache

# Verificar permissões
echo "🔐 Verificando permissões..."
chmod -R 755 storage bootstrap/cache
chown -R www-data:www-data storage bootstrap/cache 2>/dev/null || echo "Aviso: Não foi possível alterar ownership (pode precisar de sudo)"

echo "✅ Melhorias aplicadas com sucesso!"
echo ""
echo "📊 Próximos passos:"
echo "1. Teste os endpoints da API"
echo "2. Monitore o desempenho"
echo "3. Verifique os logs se necessário"

