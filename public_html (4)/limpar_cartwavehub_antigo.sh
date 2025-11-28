#!/bin/bash

# ====================================
# SCRIPT PARA LIMPAR IMPLEMENTAÇÃO ANTIGA
# Execute no SERVIDOR SSH
# ====================================

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "🗑️ LIMPANDO IMPLEMENTAÇÃO ANTIGA DO CARTWAVEHUB"
echo "================================================"
echo ""

# Backup primeiro
echo "📦 Fazendo backup..."
mkdir -p backups/cartwavehub_old_$(date +%Y%m%d_%H%M%S)
cp -r app/Traits/Gateways/CartwavehubTrait.php backups/cartwavehub_old_$(date +%Y%m%d_%H%M%S)/ 2>/dev/null || true
cp -r app/Http/Controllers/Gateway/CartwavehubController.php backups/cartwavehub_old_$(date +%Y%m%d_%H%M%S)/ 2>/dev/null || true
echo "✓ Backup criado"
echo ""

# Remover migrations problemáticas
echo "🗑️ Removendo migrations de toggles..."
rm -f database/migrations/2025_01_25_100000_add_gateway_ativo_fields.php
rm -f database/migrations/2025_01_25_100001_add_gateway_ativo_fields_fixed.php
echo "✓ Migrations removidas"
echo ""

# Limpar cache
echo "🧹 Limpando cache..."
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
echo "✓ Cache limpo"
echo ""

echo "================================================"
echo "✅ LIMPEZA CONCLUÍDA!"
echo "================================================"
echo ""
echo "Próximo passo: Implementar nova estrutura conforme guia"

