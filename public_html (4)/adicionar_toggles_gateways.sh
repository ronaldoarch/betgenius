#!/bin/bash

# ====================================
# SCRIPT PARA ADICIONAR TOGGLES NOS GATEWAYS
# Execute este script do seu COMPUTADOR LOCAL
# ====================================

echo "🚀 ADICIONANDO SISTEMA DE ATIVAR/DESATIVAR GATEWAYS"
echo "===================================================="
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

if [ ! -f "database/migrations/2025_01_25_100000_add_gateway_ativo_fields.php" ]; then
    echo "❌ FALTA: Migration de toggles"
    arquivos_faltando=$((arquivos_faltando + 1))
else
    echo "✓ Migration de toggles encontrada"
fi

if [ ! -f "app/Models/Gateway.php" ]; then
    echo "❌ FALTA: Gateway Model"
    arquivos_faltando=$((arquivos_faltando + 1))
else
    echo "✓ Gateway Model encontrado"
fi

if [ ! -f "app/Filament/Pages/GatewayPage.php" ]; then
    echo "❌ FALTA: GatewayPage"
    arquivos_faltando=$((arquivos_faltando + 1))
else
    echo "✓ GatewayPage encontrado"
fi

echo ""

if [ $arquivos_faltando -gt 0 ]; then
    echo "❌ ERRO: $arquivos_faltando arquivo(s) faltando!"
    exit 1
fi

echo "✅ Todos os arquivos encontrados!"
echo ""
echo "📤 Enviando arquivos para o servidor..."
echo ""

# 1. Migration
echo "1/3 📦 Enviando Migration..."
scp -P $PORT "database/migrations/2025_01_25_100000_add_gateway_ativo_fields.php" "$SERVER:$BASE/database/migrations/"
if [ $? -eq 0 ]; then
    echo "   ✓ Migration enviada com sucesso"
else
    echo "   ❌ Erro ao enviar Migration"
fi
echo ""

# 2. Gateway Model
echo "2/3 📦 Enviando Gateway Model..."
scp -P $PORT "app/Models/Gateway.php" "$SERVER:$BASE/app/Models/"
if [ $? -eq 0 ]; then
    echo "   ✓ Gateway Model enviado com sucesso"
else
    echo "   ❌ Erro ao enviar Gateway Model"
fi
echo ""

# 3. GatewayPage (Filament)
echo "3/3 📦 Enviando GatewayPage..."
scp -P $PORT "app/Filament/Pages/GatewayPage.php" "$SERVER:$BASE/app/Filament/Pages/"
if [ $? -eq 0 ]; then
    echo "   ✓ GatewayPage enviado com sucesso"
else
    echo "   ❌ Erro ao enviar GatewayPage"
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
echo "php artisan migrate --path=database/migrations/2025_01_25_100000_add_gateway_ativo_fields.php --force && \\"
echo "php artisan config:clear && \\"
echo "php artisan cache:clear && \\"
echo "php artisan view:clear && \\"
echo "echo '✅ CONCLUÍDO! Acesse o admin e ative o gateway desejado.'"
echo ""
echo "3️⃣  Acesse o painel admin:"
echo "    https://betgeniusbr.com/admin"
echo ""
echo "4️⃣  Vá em: Configurações → Gateway de Pagamento"
echo ""
echo "5️⃣  Ative apenas o gateway que você quer usar (ex: Cartwavehub)"
echo ""

