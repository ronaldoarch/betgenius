#!/bin/bash

# ====================================
# UPLOAD INDIVIDUAL COM SENHA
# Execute este script e digite a senha
# quando solicitado (6 vezes)
# ====================================

SERVER="u127271520@betgeniusbr.com"
PORT="65002"
BASE="/home/u127271520/domains/betgeniusbr.com/public_html"

echo "🚀 UPLOAD INDIVIDUAL - Cartwavehub"
echo "===================================="
echo ""
echo "⚠️  Você precisará digitar a senha SSH 6 vezes"
echo ""
read -p "Pressione ENTER para continuar..."
echo ""

cd "/Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/public_html (4)"

# 1. Helper
echo "1/6 📦 Helper..."
scp -P $PORT "app/Helpers/CartwavehubHelper.php" "$SERVER:$BASE/app/Helpers/" && echo "   ✅ Enviado" || echo "   ❌ Erro"
echo ""

# 2. DepositController
echo "2/6 📦 DepositController..."
scp -P $PORT "app/Http/Controllers/Api/CartwavehubDepositController.php" "$SERVER:$BASE/app/Http/Controllers/Api/" && echo "   ✅ Enviado" || echo "   ❌ Erro"
echo ""

# 3. WebhookController
echo "3/6 📦 WebhookController..."
scp -P $PORT "app/Http/Controllers/Api/CartwavehubWebhookController.php" "$SERVER:$BASE/app/Http/Controllers/Api/" && echo "   ✅ Enviado" || echo "   ❌ Erro"
echo ""

# 4. Rotas
echo "4/6 📦 Rotas..."
scp -P $PORT "routes/api_cartwavehub.php" "$SERVER:$BASE/routes/" && echo "   ✅ Enviado" || echo "   ❌ Erro"
echo ""

# 5. Script limpeza
echo "5/6 📦 Script de limpeza..."
scp -P $PORT "limpar_cartwavehub_antigo.sh" "$SERVER:$BASE/" && echo "   ✅ Enviado" || echo "   ❌ Erro"
echo ""

# 6. Script verificação
echo "6/6 📦 Script de verificação..."
scp -P $PORT "verificar_estrutura_banco.sh" "$SERVER:$BASE/" && echo "   ✅ Enviado" || echo "   ❌ Erro"
echo ""

echo "===================================="
echo "✅ UPLOAD CONCLUÍDO!"
echo "===================================="
echo ""
echo "📋 PRÓXIMOS PASSOS:"
echo ""
echo "Copie e cole estes comandos no seu terminal:"
echo ""
echo "ssh -p 65002 $SERVER << 'ENDSSH'"
echo "cd $BASE"
echo ""
echo "# Criar diretório Helpers se não existir"
echo "mkdir -p app/Helpers"
echo ""
echo "# Incluir rotas"
echo "if ! grep -q 'api_cartwavehub.php' routes/api.php; then"
echo "  echo '' >> routes/api.php"
echo "  echo '// Cartwavehub (Cashtime)' >> routes/api.php"
echo "  echo \"require __DIR__ . '/api_cartwavehub.php';\" >> routes/api.php"
echo "  echo '✅ Rota incluída'"
echo "else"
echo "  echo '⚠️  Rota já incluída'"
echo "fi"
echo ""
echo "# Limpar cache"
echo "php artisan config:clear"
echo "php artisan cache:clear"
echo "php artisan route:clear"
echo "php artisan optimize"
echo ""
echo "# Verificar rotas"
echo "echo ''"
echo "echo '🔍 Rotas Cartwavehub:'"
echo "php artisan route:list | grep cartwavehub"
echo "echo ''"
echo "echo '✅ Instalação concluída!'"
echo "ENDSSH"

