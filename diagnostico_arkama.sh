#!/bin/bash

echo "🔍 DIAGNÓSTICO COMPLETO ARKAMA"
echo "================================"
echo ""

# 1. Verificar se ArkamaTrait existe
echo "1️⃣ Verificando ArkamaTrait:"
if [ -f "app/Traits/Gateways/ArkamaTrait.php" ]; then
    echo "✅ ArkamaTrait.php EXISTE"
    ls -lh app/Traits/Gateways/ArkamaTrait.php
else
    echo "❌ ArkamaTrait.php NÃO EXISTE (PRECISA SUBIR!)"
    echo ""
    echo "📤 SUBA O ARQUIVO:"
    echo "   Local: /Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/ArkamaTrait.php"
    echo "   Destino: app/Traits/Gateways/ArkamaTrait.php"
fi
echo ""

# 2. Verificar se DepositController tem Arkama
echo "2️⃣ Verificando DepositController:"
if grep -q "ArkamaTrait" app/Http/Controllers/Api/Wallet/DepositController.php; then
    echo "✅ DepositController TEM ArkamaTrait"
else
    echo "❌ DepositController NÃO TEM ArkamaTrait (PRECISA ATUALIZAR!)"
    echo ""
    echo "📤 SUBA O ARQUIVO:"
    echo "   Local: /Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/DepositController_Arkama.php"
    echo "   Destino: app/Http/Controllers/Api/Wallet/DepositController.php"
fi

if grep -q "case 'arkama':" app/Http/Controllers/Api/Wallet/DepositController.php; then
    echo "✅ DepositController TEM case 'arkama'"
else
    echo "❌ DepositController NÃO TEM case 'arkama'"
fi
echo ""

# 3. Verificar se GatewayPage tem Arkama
echo "3️⃣ Verificando GatewayPage:"
if grep -q "arkama_api_token" app/Filament/Pages/GatewayPage.php; then
    echo "✅ GatewayPage TEM campos Arkama"
else
    echo "❌ GatewayPage NÃO TEM campos Arkama"
    echo ""
    echo "📤 SUBA O ARQUIVO:"
    echo "   Local: /Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/GatewayPage_Arkama.php"
    echo "   Destino: app/Filament/Pages/GatewayPage.php"
fi
echo ""

# 4. Verificar rotas Arkama
echo "4️⃣ Verificando Rotas:"
if grep -q "arkama/webhook" routes/api.php; then
    echo "✅ Rotas Arkama EXISTEM"
else
    echo "❌ Rotas Arkama NÃO EXISTEM (PRECISA ADICIONAR!)"
    echo ""
    echo "✏️  ADICIONE NO FINAL DO ARQUIVO routes/api.php:"
    echo ""
    echo "// Rotas Arkama"
    echo "Route::post('/arkama/webhook', [\App\Http\Controllers\Api\Wallet\DepositController::class, 'arkamaWebhook']);"
    echo "Route::post('/arkama/webhook-pix-out', [\App\Http\Controllers\Api\Wallet\WithdrawalController::class, 'arkamaWebhookPixOut']);"
fi
echo ""

# 5. Verificar colunas no banco
echo "5️⃣ Verificando Banco de Dados:"
echo "⚠️  Execute este SQL no phpMyAdmin:"
echo ""
echo "SHOW COLUMNS FROM gateways LIKE 'arkama%';"
echo ""
echo "Se não retornar 3 colunas (arkama_uri, arkama_api_token, arkama_ativo), execute:"
echo ""
echo "ALTER TABLE gateways ADD COLUMN arkama_uri VARCHAR(255) NULL;"
echo "ALTER TABLE gateways ADD COLUMN arkama_api_token VARCHAR(255) NULL;"
echo "ALTER TABLE gateways ADD COLUMN arkama_ativo TINYINT(1) DEFAULT 0;"
echo ""

echo "================================"
echo "📊 FIM DO DIAGNÓSTICO"
echo ""
echo "🎯 CHECKLIST DE AÇÕES NECESSÁRIAS:"
echo "   [ ] Subir ArkamaTrait.php via FileZilla"
echo "   [ ] Subir DepositController_Arkama.php via FileZilla (renomear para DepositController.php)"
echo "   [ ] Subir GatewayPage_Arkama.php via FileZilla (renomear para GatewayPage.php)"
echo "   [ ] Adicionar rotas Arkama em routes/api.php"
echo "   [ ] Executar SQL para criar colunas"
echo "   [ ] Ativar Arkama no banco: UPDATE gateways SET arkama_ativo = 1"
echo "   [ ] Limpar cache: php artisan cache:clear && killall -9 lsphp"
echo ""

