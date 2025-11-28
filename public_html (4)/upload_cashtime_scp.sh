#!/bin/bash

# Script para upload dos arquivos Cashtime via SCP
# Execute: bash upload_cashtime_scp.sh

SERVER="u127271520@betgeniusbr.com"
BASE_PATH="/home/u127271520/domains/betgeniusbr.com/public_html"

echo "🚀 Iniciando upload dos arquivos Cashtime..."

# 1. Migration
echo "📦 [1/9] Enviando migration..."
scp database/migrations/2025_01_15_100000_add_cashtime_to_gateways.php $SERVER:$BASE_PATH/database/migrations/ && echo "✅ Migration enviada" || echo "❌ Erro ao enviar migration"

# 2. Trait
echo "📦 [2/9] Enviando Trait..."
scp app/Traits/Gateways/CashtimeTrait.php $SERVER:$BASE_PATH/app/Traits/Gateways/ && echo "✅ Trait enviado" || echo "❌ Erro ao enviar Trait"

# 3. Controller
echo "📦 [3/9] Enviando Controller..."
scp app/Http/Controllers/Gateway/CashtimeController.php $SERVER:$BASE_PATH/app/Http/Controllers/Gateway/ && echo "✅ Controller enviado" || echo "❌ Erro ao enviar Controller"

# 4. Rotas
echo "📦 [4/9] Enviando Rotas..."
scp routes/groups/gateways/cashtime.php $SERVER:$BASE_PATH/routes/groups/gateways/ && echo "✅ Rotas enviadas" || echo "❌ Erro ao enviar Rotas"

# 5. Gateway Model
echo "📦 [5/9] Enviando Gateway Model..."
scp app/Models/Gateway.php $SERVER:$BASE_PATH/app/Models/ && echo "✅ Gateway Model enviado" || echo "❌ Erro ao enviar Gateway Model"

# 6. DepositController
echo "📦 [6/9] Enviando DepositController..."
scp app/Http/Controllers/Api/Wallet/DepositController.php $SERVER:$BASE_PATH/app/Http/Controllers/Api/Wallet/ && echo "✅ DepositController enviado" || echo "❌ Erro ao enviar DepositController"

# 7. WalletController
echo "📦 [7/9] Enviando WalletController..."
scp app/Http/Controllers/Api/Profile/WalletController.php $SERVER:$BASE_PATH/app/Http/Controllers/Api/Profile/ && echo "✅ WalletController enviado" || echo "❌ Erro ao enviar WalletController"

# 8. GatewayPage
echo "📦 [8/9] Enviando GatewayPage..."
scp app/Filament/Pages/GatewayPage.php $SERVER:$BASE_PATH/app/Filament/Pages/ && echo "✅ GatewayPage enviado" || echo "❌ Erro ao enviar GatewayPage"

# 9. routes/web.php
echo "📦 [9/9] Enviando routes/web.php..."
scp routes/web.php $SERVER:$BASE_PATH/routes/ && echo "✅ routes/web.php enviado" || echo "❌ Erro ao enviar routes/web.php"

echo ""
echo "✅ Upload concluído!"
echo ""
echo "📋 Próximos passos no servidor SSH:"
echo "1. Conecte: ssh $SERVER"
echo "2. Execute: cd $BASE_PATH"
echo "3. Execute: php artisan migrate"
echo "4. Execute: php artisan config:clear && php artisan cache:clear && php artisan route:clear"

