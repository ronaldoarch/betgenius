#!/bin/bash

# Script para enviar arquivos do gateway Cartwavehub para o servidor
# Uso: ./upload_cartwavehub.sh

SERVER="u127271520@betgeniusbr.com"
BASE_PATH="/home/u127271520/domains/betgeniusbr.com/public_html"

echo "🚀 Enviando arquivos do gateway Cartwavehub para o servidor..."

# 1. Migration
echo "📦 Enviando migration..."
scp database/migrations/2025_01_20_100000_add_cartwavehub_to_gateways.php $SERVER:$BASE_PATH/database/migrations/

# 2. Trait
echo "📦 Enviando Trait..."
scp app/Traits/Gateways/CartwavehubTrait.php $SERVER:$BASE_PATH/app/Traits/Gateways/

# 3. Controller
echo "📦 Enviando Controller..."
scp app/Http/Controllers/Gateway/CartwavehubController.php $SERVER:$BASE_PATH/app/Http/Controllers/Gateway/

# 4. Rotas
echo "📦 Enviando Rotas..."
scp routes/groups/gateways/cartwavehub.php $SERVER:$BASE_PATH/routes/groups/gateways/

# 5. Arquivos modificados
echo "📦 Enviando arquivos modificados..."
scp app/Models/Gateway.php $SERVER:$BASE_PATH/app/Models/
scp app/Http/Controllers/Api/Wallet/DepositController.php $SERVER:$BASE_PATH/app/Http/Controllers/Api/Wallet/
scp app/Http/Controllers/Api/Profile/WalletController.php $SERVER:$BASE_PATH/app/Http/Controllers/Api/Profile/
scp app/Filament/Pages/GatewayPage.php $SERVER:$BASE_PATH/app/Filament/Pages/
scp routes/web.php $SERVER:$BASE_PATH/routes/

# 6. Documentação
echo "📦 Enviando documentação..."
scp CARTWAVEHUB_INSTRUCOES.md $SERVER:$BASE_PATH/

echo "✅ Upload concluído!"
echo ""
echo "📋 Próximos passos no servidor:"
echo "1. Conecte via SSH: ssh -p 65002 $SERVER"
echo "2. Execute: cd $BASE_PATH"
echo "3. Execute: php artisan migrate"
echo "4. Execute: php artisan config:clear && php artisan cache:clear && php artisan route:clear && php artisan view:clear && php artisan optimize"

