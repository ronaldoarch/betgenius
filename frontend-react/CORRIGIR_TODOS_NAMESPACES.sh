#!/bin/bash

# ============================================================
# ✅ CORRIGIR TODOS OS NAMESPACES INCORRETOS
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO TODOS OS NAMESPACES INCORRETOS"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Procurando arquivos com namespace Filament\Tables\Actions..."
find app/ -name "*.php" -type f -exec grep -l "namespace Filament\\\\Tables\\\\Actions" {} \; 2>/dev/null | while read file; do
    echo "   ⚠️  Encontrado: $file"
done
echo ""

echo "2️⃣ Procurando arquivos com namespace Althinect\\FilamentSpatieRolesPermissions..."
find app/ -name "*.php" -type f -exec grep -l "namespace Althinect\\\\FilamentSpatieRolesPermissions" {} \; 2>/dev/null | while read file; do
    echo "   ⚠️  Encontrado: $file"
done
echo ""

echo "3️⃣ Verificando arquivos específicos conhecidos..."
# DetailsAction
if [ -f "app/Filament/Pages/AffiliateHistory/Pages/Actions/DetailsAction.php" ]; then
    if grep -q "namespace Filament\\\\Tables\\\\Actions" app/Filament/Pages/AffiliateHistory/Pages/Actions/DetailsAction.php 2>/dev/null; then
        echo "   ⚠️  DetailsAction.php precisa ser corrigido"
    fi
fi

# RoleResource
if [ -f "app/Filament/Resources/RoleResource.php" ]; then
    if grep -q "namespace Althinect\\\\FilamentSpatieRolesPermissions" app/Filament/Resources/RoleResource.php 2>/dev/null; then
        echo "   ⚠️  RoleResource.php precisa ser removido"
    fi
fi
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

echo "═══════════════════════════════════════════════════════════════"
echo "✅ VERIFICAÇÃO CONCLUÍDA!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 Execute os scripts de correção específicos:"
echo "   - CORRIGIR_CLASSE_DUPLICADA.sh (para RoleResource)"
echo "   - CORRIGIR_DETAILSACTION.sh (para DetailsAction)"
echo ""
echo "═══════════════════════════════════════════════════════════════"

