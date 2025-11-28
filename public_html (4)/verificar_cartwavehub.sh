#!/bin/bash

# Script de Verificação da Integração Cartwavehub
echo "========================================"
echo "DIAGNÓSTICO DA INTEGRAÇÃO CARTWAVEHUB"
echo "========================================"
echo ""

# Diretório base
BASE="/home/u127271520/domains/betgeniusbr.com/public_html"

echo "1. Verificando arquivos principais..."
echo "-----------------------------------"

# Lista de arquivos que devem existir
arquivos=(
    "$BASE/app/Traits/Gateways/CartwavehubTrait.php"
    "$BASE/app/Http/Controllers/Gateway/CartwavehubController.php"
    "$BASE/routes/groups/gateways/cartwavehub.php"
    "$BASE/database/migrations/2025_01_20_100000_add_cartwavehub_to_gateways.php"
)

for arquivo in "${arquivos[@]}"; do
    if [ -f "$arquivo" ]; then
        echo "✓ OK: $arquivo"
    else
        echo "✗ FALTA: $arquivo"
    fi
done

echo ""
echo "2. Verificando se a rota foi incluída no web.php..."
echo "---------------------------------------------------"
if grep -q "cartwavehub.php" "$BASE/routes/web.php"; then
    echo "✓ OK: Rota incluída no web.php"
else
    echo "✗ FALTA: Rota não encontrada no web.php"
fi

echo ""
echo "3. Verificando modificações nos controllers..."
echo "----------------------------------------------"

# Verificar DepositController
if grep -q "CartwavehubTrait" "$BASE/app/Http/Controllers/Api/Wallet/DepositController.php"; then
    echo "✓ OK: CartwavehubTrait no DepositController"
else
    echo "✗ FALTA: CartwavehubTrait não encontrado no DepositController"
fi

if grep -q "case 'cartwavehub':" "$BASE/app/Http/Controllers/Api/Wallet/DepositController.php"; then
    echo "✓ OK: Case cartwavehub no DepositController"
else
    echo "✗ FALTA: Case cartwavehub não encontrado no DepositController"
fi

# Verificar WalletController
if grep -q "CartwavehubTrait" "$BASE/app/Http/Controllers/Api/Profile/WalletController.php"; then
    echo "✓ OK: CartwavehubTrait no WalletController"
else
    echo "✗ FALTA: CartwavehubTrait não encontrado no WalletController"
fi

if grep -q "case 'cartwavehub':" "$BASE/app/Http/Controllers/Api/Profile/WalletController.php"; then
    echo "✓ OK: Case cartwavehub no WalletController"
else
    echo "✗ FALTA: Case cartwavehub não encontrado no WalletController"
fi

echo ""
echo "4. Verificando Gateway Model..."
echo "-------------------------------"
if grep -q "cartwavehub_uri" "$BASE/app/Models/Gateway.php"; then
    echo "✓ OK: cartwavehub_uri no modelo Gateway"
else
    echo "✗ FALTA: cartwavehub_uri não encontrado no modelo Gateway"
fi

if grep -q "cartwavehubApiSecret" "$BASE/app/Models/Gateway.php"; then
    echo "✓ OK: Métodos Cartwavehub no modelo Gateway"
else
    echo "✗ FALTA: Métodos Cartwavehub não encontrados no modelo Gateway"
fi

echo ""
echo "5. Verificando GatewayPage (Filament)..."
echo "----------------------------------------"
if grep -q "CARTWAVEHUB" "$BASE/app/Filament/Pages/GatewayPage.php"; then
    echo "✓ OK: Seção CARTWAVEHUB no GatewayPage"
else
    echo "✗ FALTA: Seção CARTWAVEHUB não encontrada no GatewayPage"
fi

echo ""
echo "6. Verificando banco de dados..."
echo "--------------------------------"
cd "$BASE"

# Verificar se as colunas existem no banco
php artisan tinker --execute="
\$gateway = \App\Models\Gateway::first();
if (\$gateway) {
    \$attributes = \$gateway->getAttributes();
    if (array_key_exists('cartwavehub_uri', \$attributes)) {
        echo '✓ OK: Coluna cartwavehub_uri existe no banco\n';
    } else {
        echo '✗ FALTA: Coluna cartwavehub_uri NÃO existe no banco\n';
    }
    if (array_key_exists('cartwavehub_api_secret', \$attributes)) {
        echo '✓ OK: Coluna cartwavehub_api_secret existe no banco\n';
    } else {
        echo '✗ FALTA: Coluna cartwavehub_api_secret NÃO existe no banco\n';
    }
    if (array_key_exists('cartwavehub_api_public', \$attributes)) {
        echo '✓ OK: Coluna cartwavehub_api_public existe no banco\n';
    } else {
        echo '✗ FALTA: Coluna cartwavehub_api_public NÃO existe no banco\n';
    }
} else {
    echo '⚠ AVISO: Nenhum gateway encontrado no banco\n';
}
"

echo ""
echo "7. Verificando status das migrações..."
echo "---------------------------------------"
if php artisan migrate:status | grep -q "add_cartwavehub_to_gateways"; then
    echo "✓ OK: Migração Cartwavehub encontrada"
    php artisan migrate:status | grep "cartwavehub"
else
    echo "✗ FALTA: Migração Cartwavehub não encontrada ou não executada"
fi

echo ""
echo "8. Verificando permissões..."
echo "----------------------------"
echo "Permissões dos diretórios principais:"
ls -la "$BASE/app/Traits/Gateways/" 2>/dev/null | grep -i "cart" || echo "Diretório não encontrado"
ls -la "$BASE/app/Http/Controllers/Gateway/" 2>/dev/null | grep -i "cart" || echo "Arquivo não encontrado"

echo ""
echo "========================================"
echo "DIAGNÓSTICO CONCLUÍDO"
echo "========================================"
echo ""
echo "PRÓXIMOS PASSOS:"
echo "----------------"
echo ""
echo "Se algum arquivo estiver FALTANDO:"
echo "  → Execute o script upload_cartwavehub.sh novamente"
echo ""
echo "Se as colunas do banco NÃO EXISTIREM:"
echo "  → Execute: php artisan migrate --path=/database/migrations/2025_01_20_100000_add_cartwavehub_to_gateways.php"
echo ""
echo "Se tudo estiver OK mas não aparecer no admin:"
echo "  → Execute: php artisan config:clear"
echo "  → Execute: php artisan cache:clear"
echo "  → Execute: php artisan route:clear"
echo "  → Execute: php artisan view:clear"
echo "  → Execute: php artisan optimize"
echo ""

