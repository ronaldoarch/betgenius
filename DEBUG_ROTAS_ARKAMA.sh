#!/bin/bash

echo "🔍 DEBUG ROTAS ARKAMA"
echo "====================="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando se o arquivo de rotas existe..."
if [ -f "routes/groups/gateways/arkama.php" ]; then
    echo "✅ Arquivo existe"
    echo "📄 Conteúdo:"
    cat routes/groups/gateways/arkama.php
else
    echo "❌ Arquivo NÃO existe"
fi

echo ""
echo "2️⃣ Verificando se está incluído no web.php..."
if grep -q "arkama.php" routes/web.php; then
    echo "✅ Está incluído"
    grep -n "arkama.php" routes/web.php
else
    echo "❌ NÃO está incluído"
fi

echo ""
echo "3️⃣ Testando se o arquivo pode ser incluído..."
php -r "
try {
    require 'routes/groups/gateways/arkama.php';
    echo '✅ Arquivo pode ser incluído sem erros' . PHP_EOL;
} catch (Exception \$e) {
    echo '❌ Erro ao incluir: ' . \$e->getMessage() . PHP_EOL;
}
"

echo ""
echo "4️⃣ Verificando se o controller pode ser resolvido..."
php artisan tinker --execute="
try {
    \$controller = new \App\Http\Controllers\Api\Wallet\DepositController();
    if (method_exists(\$controller, 'arkamaWebhook')) {
        echo '✅ Método arkamaWebhook existe no controller' . PHP_EOL;
    } else {
        echo '❌ Método NÃO existe' . PHP_EOL;
    }
} catch (Exception \$e) {
    echo '❌ Erro: ' . \$e->getMessage() . PHP_EOL;
}
"

echo ""
echo "5️⃣ Listando TODAS as rotas (últimas 50)..."
php artisan route:list | tail -50

echo ""
echo "6️⃣ Verificando se há erros ao carregar rotas..."
php artisan route:list 2>&1 | grep -i "error\|exception\|fatal" | head -10

echo ""
echo "============================"
echo "✅ DEBUG CONCLUÍDO!"

