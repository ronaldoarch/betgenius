#!/bin/bash

# ============================================================
# ✅ CORRIGIR ERRO NO AdminPanelProvider
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO ERRO NO AdminPanelProvider"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Fazendo backup do arquivo..."
if [ -f "app/Providers/Filament/AdminPanelProvider.php" ]; then
    cp app/Providers/Filament/AdminPanelProvider.php app/Providers/Filament/AdminPanelProvider.php.backup.$(date +%Y%m%d_%H%M%S)
    echo "✅ Backup criado"
else
    echo "❌ Arquivo não encontrado!"
    exit 1
fi
echo ""

echo "2️⃣ Corrigindo a linha 76 (adicionando valor padrão)..."
sed -i 's/->path(env("FILAMENT_BASE_URL"))/->path(env("FILAMENT_BASE_URL", "admin"))/' app/Providers/Filament/AdminPanelProvider.php
if [ $? -eq 0 ]; then
    echo "✅ Arquivo corrigido"
else
    echo "⚠️  Erro ao corrigir arquivo"
    exit 1
fi
echo ""

echo "3️⃣ Verificando se foi corrigido..."
grep -n "->path" app/Providers/Filament/AdminPanelProvider.php | head -1
echo ""

echo "4️⃣ Limpando cache do Laravel..."
php artisan config:clear 2>/dev/null || echo "⚠️  Erro ao limpar config cache"
php artisan cache:clear 2>/dev/null || echo "⚠️  Erro ao limpar cache"
php artisan route:clear 2>/dev/null || echo "⚠️  Erro ao limpar route cache"
php artisan view:clear 2>/dev/null || echo "⚠️  Erro ao limpar view cache"
php artisan optimize:clear 2>/dev/null || echo "⚠️  Erro ao limpar optimize cache"
echo "✅ Cache limpo"
echo ""

echo "5️⃣ Otimizando aplicação..."
php artisan config:cache 2>/dev/null || echo "⚠️  Erro ao cachear config"
php artisan route:cache 2>/dev/null || echo "⚠️  Erro ao cachear routes"
php artisan view:cache 2>/dev/null || echo "⚠️  Erro ao cachear views"
echo "✅ Aplicação otimizada"
echo ""

echo "6️⃣ Verificando erros..."
tail -10 storage/logs/laravel.log | grep -i "error\|exception" || echo "✅ Nenhum erro recente encontrado"
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ PROCESSO CONCLUÍDO!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 Correção aplicada:"
echo "   ✅ Adicionado valor padrão 'admin' para FILAMENT_BASE_URL"
echo ""
echo "📋 Teste agora:"
echo "   - Limpe o cache do navegador (Ctrl+Shift+R)"
echo "   - Teste as APIs:"
echo "     https://betgeniusbr.com/api/settings/data"
echo "     https://betgeniusbr.com/api/categories"
echo ""
echo "═══════════════════════════════════════════════════════════════"

