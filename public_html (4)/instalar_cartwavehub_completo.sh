#!/bin/bash

# ====================================
# INSTALAÇÃO COMPLETA CARTWAVEHUB
# Seguindo o guia oficial
# Execute do seu COMPUTADOR LOCAL
# ====================================

echo "🚀 INSTALAÇÃO COMPLETA DO CARTWAVEHUB"
echo "======================================"
echo ""
echo "📋 Este script vai:"
echo "  1. Enviar Helper Class"
echo "  2. Enviar Controllers"
echo "  3. Enviar Rotas"
echo "  4. Configurar no servidor"
echo ""

# Configurações
SERVER="u127271520@betgeniusbr.com"
PORT="65002"
BASE="/home/u127271520/domains/betgeniusbr.com/public_html"

# Ir para o diretório correto
cd "/Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/public_html (4)"

echo "📍 Diretório atual: $(pwd)"
echo ""

# Verificar se os arquivos existem
echo "🔍 Verificando arquivos..."
arquivos_faltando=0

arquivos=(
    "app/Helpers/CartwavehubHelper.php"
    "app/Http/Controllers/Api/CartwavehubDepositController.php"
    "app/Http/Controllers/Api/CartwavehubWebhookController.php"
    "routes/api_cartwavehub.php"
    "limpar_cartwavehub_antigo.sh"
    "verificar_estrutura_banco.sh"
)

for arquivo in "${arquivos[@]}"; do
    if [ ! -f "$arquivo" ]; then
        echo "❌ FALTA: $arquivo"
        arquivos_faltando=$((arquivos_faltando + 1))
    else
        echo "✓ $arquivo"
    fi
done

echo ""

if [ $arquivos_faltando -gt 0 ]; then
    echo "❌ ERRO: $arquivos_faltando arquivo(s) faltando!"
    exit 1
fi

echo "✅ Todos os arquivos encontrados!"
echo ""
echo "📤 Enviando arquivos para o servidor..."
echo ""

# 1. Helper
echo "1/6 📦 Enviando Helper..."
scp -P $PORT "app/Helpers/CartwavehubHelper.php" "$SERVER:$BASE/app/Helpers/"
if [ $? -eq 0 ]; then
    echo "   ✓ Helper enviado"
else
    echo "   ❌ Erro ao enviar Helper"
fi
echo ""

# 2. Controller de Depósito
echo "2/6 📦 Enviando DepositController..."
scp -P $PORT "app/Http/Controllers/Api/CartwavehubDepositController.php" "$SERVER:$BASE/app/Http/Controllers/Api/"
if [ $? -eq 0 ]; then
    echo "   ✓ DepositController enviado"
else
    echo "   ❌ Erro ao enviar DepositController"
fi
echo ""

# 3. Controller de Webhook
echo "3/6 📦 Enviando WebhookController..."
scp -P $PORT "app/Http/Controllers/Api/CartwavehubWebhookController.php" "$SERVER:$BASE/app/Http/Controllers/Api/"
if [ $? -eq 0 ]; then
    echo "   ✓ WebhookController enviado"
else
    echo "   ❌ Erro ao enviar WebhookController"
fi
echo ""

# 4. Rotas
echo "4/6 📦 Enviando Rotas..."
scp -P $PORT "routes/api_cartwavehub.php" "$SERVER:$BASE/routes/"
if [ $? -eq 0 ]; then
    echo "   ✓ Rotas enviadas"
else
    echo "   ❌ Erro ao enviar Rotas"
fi
echo ""

# 5. Script de limpeza
echo "5/6 📦 Enviando script de limpeza..."
scp -P $PORT "limpar_cartwavehub_antigo.sh" "$SERVER:$BASE/"
if [ $? -eq 0 ]; then
    echo "   ✓ Script de limpeza enviado"
else
    echo "   ❌ Erro ao enviar script de limpeza"
fi
echo ""

# 6. Script de verificação
echo "6/6 📦 Enviando script de verificação..."
scp -P $PORT "verificar_estrutura_banco.sh" "$SERVER:$BASE/"
if [ $? -eq 0 ]; then
    echo "   ✓ Script de verificação enviado"
else
    echo "   ❌ Erro ao enviar script de verificação"
fi
echo ""

echo "======================================"
echo "✅ UPLOAD CONCLUÍDO COM SUCESSO!"
echo "======================================"
echo ""
echo "📋 PRÓXIMOS PASSOS:"
echo ""
echo "1️⃣  Conecte ao servidor via SSH:"
echo "    ssh -p 65002 $SERVER"
echo ""
echo "2️⃣  Execute a limpeza:"
echo "    cd $BASE"
echo "    chmod +x limpar_cartwavehub_antigo.sh"
echo "    ./limpar_cartwavehub_antigo.sh"
echo ""
echo "3️⃣  Verifique a estrutura do banco:"
echo "    chmod +x verificar_estrutura_banco.sh"
echo "    ./verificar_estrutura_banco.sh"
echo ""
echo "4️⃣  Incluir rotas no routes/api.php:"
echo "    Adicione esta linha:"
echo "    require __DIR__ . '/api_cartwavehub.php';"
echo ""
echo "5️⃣  Limpar cache:"
echo "    php artisan config:clear"
echo "    php artisan cache:clear"
echo "    php artisan route:clear"
echo ""
echo "6️⃣  Testar endpoint:"
echo "    curl -X POST https://betgeniusbr.com/api/cartwavehub/create-pix \\"
echo "      -H 'Content-Type: application/json' \\"
echo "      -H 'Authorization: Bearer SEU_TOKEN' \\"
echo "      -d '{\"amount\": 5.00}'"
echo ""

