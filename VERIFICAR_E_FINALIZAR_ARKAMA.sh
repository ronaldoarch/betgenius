#!/bin/bash

echo "🔍 VERIFICAÇÃO E FINALIZAÇÃO ARKAMA"
echo "===================================="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando se o arquivo arkama.php foi subido..."
if [ -f "routes/groups/gateways/arkama.php" ]; then
    echo "✅ Arquivo arkama.php EXISTE no servidor!"
    ls -lh routes/groups/gateways/arkama.php
else
    echo "❌ Arquivo arkama.php NÃO EXISTE - precisa subir!"
    exit 1
fi

echo ""
echo "2️⃣ Verificando se está incluído no routes/web.php..."
if grep -q "arkama.php" routes/web.php; then
    echo "✅ Arquivo JÁ está incluído em routes/web.php"
else
    echo "❌ Arquivo NÃO está incluído - precisa adicionar"
    echo ""
    echo "📝 Adicione esta linha em routes/web.php (depois da linha 97):"
    echo "   include_once(__DIR__ . '/groups/gateways/arkama.php');"
fi

echo ""
echo "3️⃣ Verificando configuração no banco..."
php artisan tinker --execute="
\$gw = \App\Models\Gateway::first();
if (\$gw) {
    echo 'Arkama Ativo: ' . (\$gw->arkama_ativo ? 'SIM ✅' : 'NÃO ❌') . PHP_EOL;
    echo 'Arkama URI: ' . (\$gw->arkama_uri ?? 'VAZIO ❌') . PHP_EOL;
    echo 'Arkama Token: ' . (empty(\$gw->arkama_api_token) ? 'VAZIO ❌ - EXECUTE O SQL!' : 'CONFIGURADO ✅') . PHP_EOL;
    if (!empty(\$gw->arkama_api_token)) {
        echo 'Token (primeiros 20 chars): ' . substr(\$gw->arkama_api_token, 0, 20) . '...' . PHP_EOL;
    }
} else {
    echo '❌ Nenhum gateway encontrado!' . PHP_EOL;
}
"

echo ""
echo "4️⃣ Limpando cache..."
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
killall -9 lsphp 2>/dev/null
echo "✅ Cache limpo!"

echo ""
echo "5️⃣ Verificando rotas..."
php artisan route:list | grep -i arkama || echo "⚠️  Rotas não aparecem - verifique se adicionou a linha no routes/web.php"

echo ""
echo "============================"
echo "✅ VERIFICAÇÃO CONCLUÍDA!"
echo ""
echo "📋 PRÓXIMOS PASSOS:"
echo "   1. Se o arquivo não está incluído, adicione a linha no routes/web.php"
echo "   2. Se o token está VAZIO, execute o SQL no phpMyAdmin"
echo "   3. Depois, teste um depósito no site"

