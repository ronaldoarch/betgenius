#!/bin/bash

echo "🔍 VERIFICAÇÃO COMPLETA ARKAMA"
echo "==============================="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando configuração no banco..."
echo ""

php artisan tinker --execute="
\$gw = \App\Models\Gateway::first();
if (\$gw) {
    echo '✅ Gateway encontrado!' . PHP_EOL;
    echo 'Arkama Ativo: ' . (\$gw->arkama_ativo ? 'SIM ✅' : 'NÃO ❌') . PHP_EOL;
    echo 'Arkama URI: ' . (\$gw->arkama_uri ?? 'VAZIO ❌') . PHP_EOL;
    echo 'Arkama Token: ' . (empty(\$gw->arkama_api_token) ? 'VAZIO ❌' : 'CONFIGURADO ✅') . PHP_EOL;
    if (!empty(\$gw->arkama_api_token)) {
        echo 'Token (primeiros 30 chars): ' . substr(\$gw->arkama_api_token, 0, 30) . '...' . PHP_EOL;
    }
} else {
    echo '❌ Nenhum gateway encontrado!' . PHP_EOL;
}
"

echo ""
echo "2️⃣ Verificando rotas..."
echo ""

php artisan route:list | grep -i arkama || echo "⚠️  Rotas não encontradas - pode ser cache"

echo ""
echo "3️⃣ Limpando cache..."
echo ""

php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
killall -9 lsphp 2>/dev/null

echo "✅ Cache limpo!"
echo ""

echo "4️⃣ Verificando rotas novamente (após limpar cache)..."
echo ""

php artisan route:list | grep -i arkama || echo "❌ Rotas ainda não aparecem - precisa adicionar manualmente"

echo ""
echo "==============================="
echo "✅ VERIFICAÇÃO CONCLUÍDA!"
echo ""
echo "📋 Se o token está OK ✅, pode testar um depósito agora!"

