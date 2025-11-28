#!/bin/bash

# ====================================
# SCRIPT DE UPLOAD COMPLETO CARTWAVEHUB
# Execute este script do seu COMPUTADOR LOCAL
# NÃO execute dentro do SSH!
# ====================================

echo "🚀 INICIANDO UPLOAD DO CARTWAVEHUB"
echo "===================================="
echo ""

# Configurações
SERVER="u127271520@betgeniusbr.com"
PORT="65002"
BASE="/home/u127271520/domains/betgeniusbr.com/public_html"

# Ir para o diretório correto
cd "/Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/public_html (4)"

echo "📍 Diretório atual: $(pwd)"
echo ""

# Verificar se os arquivos existem antes de enviar
echo "🔍 Verificando arquivos..."
arquivos_faltando=0

if [ ! -f "database/migrations/2025_01_20_100000_add_cartwavehub_to_gateways.php" ]; then
    echo "❌ FALTA: Migration"
    arquivos_faltando=$((arquivos_faltando + 1))
else
    echo "✓ Migration encontrada"
fi

if [ ! -f "app/Traits/Gateways/CartwavehubTrait.php" ]; then
    echo "❌ FALTA: CartwavehubTrait"
    arquivos_faltando=$((arquivos_faltando + 1))
else
    echo "✓ CartwavehubTrait encontrada"
fi

if [ ! -f "app/Http/Controllers/Gateway/CartwavehubController.php" ]; then
    echo "❌ FALTA: CartwavehubController"
    arquivos_faltando=$((arquivos_faltando + 1))
else
    echo "✓ CartwavehubController encontrado"
fi

if [ ! -f "routes/groups/gateways/cartwavehub.php" ]; then
    echo "❌ FALTA: Rota cartwavehub.php"
    arquivos_faltando=$((arquivos_faltando + 1))
else
    echo "✓ Rota cartwavehub.php encontrada"
fi

echo ""

if [ $arquivos_faltando -gt 0 ]; then
    echo "❌ ERRO: $arquivos_faltando arquivo(s) faltando!"
    echo "Por favor, crie os arquivos primeiro."
    exit 1
fi

echo "✅ Todos os arquivos encontrados!"
echo ""
echo "📤 Enviando arquivos para o servidor..."
echo ""

# 1. Migration
echo "1/9 📦 Enviando Migration..."
scp -P $PORT "database/migrations/2025_01_20_100000_add_cartwavehub_to_gateways.php" "$SERVER:$BASE/database/migrations/"
if [ $? -eq 0 ]; then
    echo "   ✓ Migration enviada com sucesso"
else
    echo "   ❌ Erro ao enviar Migration"
fi
echo ""

# 2. Trait
echo "2/9 📦 Enviando CartwavehubTrait..."
scp -P $PORT "app/Traits/Gateways/CartwavehubTrait.php" "$SERVER:$BASE/app/Traits/Gateways/"
if [ $? -eq 0 ]; then
    echo "   ✓ CartwavehubTrait enviada com sucesso"
else
    echo "   ❌ Erro ao enviar CartwavehubTrait"
fi
echo ""

# 3. Controller
echo "3/9 📦 Enviando CartwavehubController..."
scp -P $PORT "app/Http/Controllers/Gateway/CartwavehubController.php" "$SERVER:$BASE/app/Http/Controllers/Gateway/"
if [ $? -eq 0 ]; then
    echo "   ✓ CartwavehubController enviado com sucesso"
else
    echo "   ❌ Erro ao enviar CartwavehubController"
fi
echo ""

# 4. Rotas
echo "4/9 📦 Enviando rotas cartwavehub.php..."
scp -P $PORT "routes/groups/gateways/cartwavehub.php" "$SERVER:$BASE/routes/groups/gateways/"
if [ $? -eq 0 ]; then
    echo "   ✓ Rotas enviadas com sucesso"
else
    echo "   ❌ Erro ao enviar rotas"
fi
echo ""

# 5. Gateway Model (modificado)
echo "5/9 📦 Enviando Gateway Model..."
scp -P $PORT "app/Models/Gateway.php" "$SERVER:$BASE/app/Models/"
if [ $? -eq 0 ]; then
    echo "   ✓ Gateway Model enviado com sucesso"
else
    echo "   ❌ Erro ao enviar Gateway Model"
fi
echo ""

# 6. DepositController (modificado)
echo "6/9 📦 Enviando DepositController..."
scp -P $PORT "app/Http/Controllers/Api/Wallet/DepositController.php" "$SERVER:$BASE/app/Http/Controllers/Api/Wallet/"
if [ $? -eq 0 ]; then
    echo "   ✓ DepositController enviado com sucesso"
else
    echo "   ❌ Erro ao enviar DepositController"
fi
echo ""

# 7. WalletController (modificado)
echo "7/9 📦 Enviando WalletController..."
scp -P $PORT "app/Http/Controllers/Api/Profile/WalletController.php" "$SERVER:$BASE/app/Http/Controllers/Api/Profile/"
if [ $? -eq 0 ]; then
    echo "   ✓ WalletController enviado com sucesso"
else
    echo "   ❌ Erro ao enviar WalletController"
fi
echo ""

# 8. GatewayPage (modificado - Filament)
echo "8/9 📦 Enviando GatewayPage..."
scp -P $PORT "app/Filament/Pages/GatewayPage.php" "$SERVER:$BASE/app/Filament/Pages/"
if [ $? -eq 0 ]; then
    echo "   ✓ GatewayPage enviado com sucesso"
else
    echo "   ❌ Erro ao enviar GatewayPage"
fi
echo ""

# 9. web.php (modificado)
echo "9/9 📦 Enviando routes/web.php..."
scp -P $PORT "routes/web.php" "$SERVER:$BASE/routes/"
if [ $? -eq 0 ]; then
    echo "   ✓ routes/web.php enviado com sucesso"
else
    echo "   ❌ Erro ao enviar routes/web.php"
fi
echo ""

echo "======================================"
echo "✅ UPLOAD CONCLUÍDO COM SUCESSO!"
echo "======================================"
echo ""
echo "📋 PRÓXIMOS PASSOS:"
echo ""
echo "1️⃣  Conecte ao servidor via SSH:"
echo "    ssh -p 65002 u127271520@betgeniusbr.com"
echo ""
echo "2️⃣  Execute os comandos no servidor (copie tudo de uma vez):"
echo ""
echo "cd /home/u127271520/domains/betgeniusbr.com/public_html && \\"
echo "php artisan migrate --path=database/migrations/2025_01_20_100000_add_cartwavehub_to_gateways.php --force && \\"
echo "php artisan config:clear && \\"
echo "php artisan cache:clear && \\"
echo "php artisan route:clear && \\"
echo "php artisan view:clear && \\"
echo "php artisan optimize:clear && \\"
echo "php artisan config:cache && \\"
echo "php artisan route:cache && \\"
echo "php artisan view:cache && \\"
echo "php artisan optimize && \\"
echo "echo '✅ CONCLUÍDO! Acesse o admin agora.'"
echo ""
echo "3️⃣  Acesse o painel admin:"
echo "    https://betgeniusbr.com/admin"
echo ""
echo "4️⃣  Vá em: Configurações → Gateway de Pagamento"
echo ""
echo "5️⃣  Procure pela seção CARTWAVEHUB (deve estar lá agora!)"
echo ""

