#!/bin/bash

# ============================================================
# ✅ CORRIGIR ERRO DE CLASSE DUPLICADA - RoleResource
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO ERRO DE CLASSE DUPLICADA"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Fazendo backup do arquivo customizado..."
if [ -f "app/Filament/Resources/RoleResource.php" ]; then
    cp app/Filament/Resources/RoleResource.php app/Filament/Resources/RoleResource.php.backup.$(date +%Y%m%d_%H%M%S)
    echo "✅ Backup criado"
else
    echo "⚠️  Arquivo não encontrado"
fi
echo ""

echo "2️⃣ Removendo arquivo e pasta customizada que estão causando conflito..."
# Fazer backup da pasta inteira
if [ -d "app/Filament/Resources/RoleResource" ]; then
    tar -czf app/Filament/Resources/RoleResource.backup.$(date +%Y%m%d_%H%M%S).tar.gz app/Filament/Resources/RoleResource 2>/dev/null
    echo "✅ Backup da pasta criado"
fi
# Remover arquivo e pasta
rm -f app/Filament/Resources/RoleResource.php
rm -rf app/Filament/Resources/RoleResource
echo "✅ Arquivos removidos"
echo ""

echo "3️⃣ Verificando se há outros arquivos relacionados..."
ls -la app/Filament/Resources/RoleResource* 2>/dev/null || echo "✅ Nenhum arquivo relacionado encontrado"
echo ""

echo "4️⃣ Limpando cache do Laravel..."
php artisan config:clear 2>/dev/null || echo "⚠️  Erro ao limpar config cache"
php artisan cache:clear 2>/dev/null || echo "⚠️  Erro ao limpar cache"
php artisan route:clear 2>/dev/null || echo "⚠️  Erro ao limpar route cache"
php artisan view:clear 2>/dev/null || echo "⚠️  Erro ao limpar view cache"
php artisan optimize:clear 2>/dev/null || echo "⚠️  Erro ao limpar optimize cache"
echo "✅ Cache limpo"
echo ""

echo "5️⃣ Regenerando autoload do Composer..."
composer dump-autoload 2>/dev/null || echo "⚠️  Erro ao regenerar autoload"
echo "✅ Autoload regenerado"
echo ""

echo "6️⃣ Otimizando aplicação..."
php artisan config:cache 2>/dev/null || echo "⚠️  Erro ao cachear config"
php artisan route:cache 2>/dev/null || echo "⚠️  Erro ao cachear routes"
php artisan view:cache 2>/dev/null || echo "⚠️  Erro ao cachear views"
echo "✅ Aplicação otimizada"
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ PROCESSO CONCLUÍDO!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 O arquivo customizado foi removido."
echo "   O Laravel agora usará o RoleResource do pacote vendor."
echo ""
echo "⚠️  Se você precisava da verificação canAccess(), você pode:"
echo "   1. Criar um middleware personalizado"
echo "   2. Ou configurar no arquivo de configuração do pacote"
echo ""
echo "📋 Teste agora:"
echo "   - Limpe o cache do navegador (Ctrl+Shift+R)"
echo "   - Teste as APIs:"
echo "     https://betgeniusbr.com/api/settings/data"
echo "     https://betgeniusbr.com/api/categories"
echo ""
echo "═══════════════════════════════════════════════════════════════"

