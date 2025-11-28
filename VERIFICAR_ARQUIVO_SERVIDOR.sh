#!/bin/bash

echo "🔍 VERIFICANDO ARQUIVO NO SERVIDOR"
echo "==================================="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando se o arquivo existe:"
ls -la app/Http/Controllers/Api/Wallet/DepositController.php
echo ""

echo "2️⃣ Verificando tamanho do arquivo:"
wc -l app/Http/Controllers/Api/Wallet/DepositController.php
echo ""

echo "3️⃣ Verificando sintaxe PHP:"
php -l app/Http/Controllers/Api/Wallet/DepositController.php
echo ""

echo "4️⃣ Verificando se tem ArkamaTrait:"
grep -n "ArkamaTrait" app/Http/Controllers/Api/Wallet/DepositController.php | head -3
echo ""

echo "5️⃣ Verificando se tem case 'arkama':"
grep -n "case 'arkama'" app/Http/Controllers/Api/Wallet/DepositController.php
echo ""

echo "6️⃣ Verificando se tem try-catch:"
grep -n "try {" app/Http/Controllers/Api/Wallet/DepositController.php | head -1
echo ""

echo "7️⃣ Verificando se tem Log::info no início:"
grep -n "Log::info.*submitPayment chamado" app/Http/Controllers/Api/Wallet/DepositController.php
echo ""

echo "8️⃣ Verificando se o método submitPayment existe:"
grep -n "public function submitPayment" app/Http/Controllers/Api/Wallet/DepositController.php
echo ""

echo "9️⃣ Verificando se o arquivo foi modificado recentemente:"
stat app/Http/Controllers/Api/Wallet/DepositController.php | grep Modify
echo ""

echo "🔟 Testando se a classe pode ser carregada:"
php artisan tinker --execute="
try {
    \$controller = new \App\Http\Controllers\Api\Wallet\DepositController();
    echo '✅ Classe carregada com sucesso!' . PHP_EOL;
} catch (\Exception \$e) {
    echo '❌ Erro ao carregar classe: ' . \$e->getMessage() . PHP_EOL;
}
"
echo ""
