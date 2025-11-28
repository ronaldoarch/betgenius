#!/bin/bash

echo "🔧 CORREÇÃO COMPLETA ARKAMA"
echo "============================"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando se o token foi salvo..."
php artisan tinker --execute="
\$gw = \App\Models\Gateway::first();
if (\$gw) {
    echo 'Token atual: ' . (empty(\$gw->arkama_api_token) ? 'VAZIO ❌' : 'OK ✅') . PHP_EOL;
    if (empty(\$gw->arkama_api_token)) {
        echo '⚠️  O token não foi salvo! Verifique se você clicou em SALVAR no admin.' . PHP_EOL;
    }
}
"

echo ""
echo "2️⃣ Verificando se o arquivo de rotas existe..."
if [ -f "routes/groups/gateways/arkama.php" ]; then
    echo "✅ Arquivo de rotas existe"
else
    echo "❌ Arquivo de rotas NÃO existe - precisa criar"
fi

echo ""
echo "3️⃣ Verificando se o arquivo está incluído em routes/web.php..."
if grep -q "arkama.php" routes/web.php; then
    echo "✅ Arquivo incluído em routes/web.php"
else
    echo "❌ Arquivo NÃO incluído - precisa adicionar"
    echo ""
    echo "📝 Adicione esta linha em routes/web.php (depois da linha 97):"
    echo "   include_once(__DIR__ . '/groups/gateways/arkama.php');"
fi

echo ""
echo "4️⃣ Verificando se o método existe no DepositController..."
if grep -q "arkamaWebhook" app/Http/Controllers/Api/Wallet/DepositController.php; then
    echo "✅ Método encontrado (pode estar no trait)"
else
    echo "❌ Método NÃO encontrado"
fi

echo ""
echo "5️⃣ Limpando cache..."
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
killall -9 lsphp 2>/dev/null

echo ""
echo "6️⃣ Verificando rotas após limpar cache..."
php artisan route:list | grep -i arkama || echo "❌ Rotas ainda não aparecem"

echo ""
echo "============================"
echo "✅ VERIFICAÇÃO CONCLUÍDA!"

