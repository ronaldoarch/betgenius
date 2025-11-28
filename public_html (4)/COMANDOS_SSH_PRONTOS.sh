#!/bin/bash

# =====================================
# COMANDOS SSH PRONTOS PARA EXECUTAR
# Copie e cole estes blocos no terminal
# =====================================

echo "======================================"
echo "🔧 CONFIGURAÇÃO CARTWAVEHUB VIA SSH"
echo "======================================"
echo ""
echo "PASSO 1: Conectar ao servidor"
echo "Copie e cole este comando:"
echo ""
cat << 'CMD1'
ssh -p 65002 u127271520@betgeniusbr.com
CMD1
echo ""
echo "======================================"
echo ""
echo "PASSO 2: Ir para o diretório correto"
echo "Copie e cole este comando:"
echo ""
cat << 'CMD2'
cd /home/u127271520/domains/betgeniusbr.com/public_html
CMD2
echo ""
echo "======================================"
echo ""
echo "PASSO 3: Criar diretório Helpers"
echo "Copie e cole este comando:"
echo ""
cat << 'CMD3'
mkdir -p app/Helpers
CMD3
echo ""
echo "======================================"
echo ""
echo "PASSO 4: Incluir rotas (se ainda não foi feito)"
echo "Copie e cole este bloco:"
echo ""
cat << 'CMD4'
if ! grep -q 'api_cartwavehub.php' routes/api.php; then
  echo "" >> routes/api.php
  echo "// Cartwavehub (Cashtime)" >> routes/api.php
  echo "require __DIR__ . '/api_cartwavehub.php';" >> routes/api.php
  echo "✅ Rota incluída em routes/api.php"
else
  echo "⚠️  Rota já incluída em routes/api.php"
fi
CMD4
echo ""
echo "======================================"
echo ""
echo "PASSO 5: Limpar cache do Laravel"
echo "Copie e cole este bloco:"
echo ""
cat << 'CMD5'
php artisan config:clear && \
php artisan cache:clear && \
php artisan route:clear && \
php artisan view:clear && \
php artisan optimize
CMD5
echo ""
echo "======================================"
echo ""
echo "PASSO 6: Verificar se as rotas foram registradas"
echo "Copie e cole este comando:"
echo ""
cat << 'CMD6'
echo ""
echo "🔍 Rotas do Cartwavehub:"
php artisan route:list | grep cartwavehub
echo ""
echo "Você deve ver 3 rotas:"
echo "  - POST api/cartwavehub/create-pix"
echo "  - GET  api/cartwavehub/my-deposits"
echo "  - POST api/cartwavehub/callback"
echo ""
CMD6
echo ""
echo "======================================"
echo ""
echo "PASSO 7: Verificar estrutura do banco (opcional)"
echo "Copie e cole este bloco:"
echo ""
cat << 'CMD7'
php artisan tinker --execute="
if (Schema::hasColumn('gateways', 'cartwavehub_api_secret')) {
    echo '✅ Coluna cartwavehub_api_secret existe' . PHP_EOL;
} else {
    echo '❌ Coluna cartwavehub_api_secret NÃO existe' . PHP_EOL;
}
if (Schema::hasColumn('deposits', 'external_id')) {
    echo '✅ Coluna external_id existe' . PHP_EOL;
} else {
    echo '❌ Coluna external_id NÃO existe' . PHP_EOL;
}
"
CMD7
echo ""
echo "======================================"
echo ""
echo "PASSO 8: Ver logs em tempo real (opcional)"
echo "Copie e cole este comando:"
echo ""
cat << 'CMD8'
tail -f storage/logs/laravel.log
CMD8
echo ""
echo "======================================"
echo ""
echo "✅ COMANDOS PREPARADOS!"
echo ""
echo "Agora execute cada passo acima no seu terminal."
echo "Você precisará fazer o upload dos arquivos PHP"
echo "usando FileZilla ou o script upload_individual.sh"
echo ""

