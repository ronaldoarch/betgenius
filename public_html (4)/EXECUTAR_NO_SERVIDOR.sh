#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "🔍 VERIFICAÇÃO COMPLETA DO DEPOSITCONTROLLER"
echo "============================================="
echo ""

# 1. Verificar sintaxe
echo "1️⃣ Verificando sintaxe..."
php -l app/Http/Controllers/Api/Wallet/DepositController.php
echo ""

# 2. Verificar linhas
echo "2️⃣ Verificando linhas do arquivo..."
wc -l app/Http/Controllers/Api/Wallet/DepositController.php
echo ""

# 3. Regenerar autoload
echo "3️⃣ Regenerando autoload..."
composer dump-autoload -o 2>&1 | tail -5
echo ""

# 4. Limpar caches
echo "4️⃣ Limpando caches..."
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
php artisan optimize:clear
echo "✅ Caches limpos!"
echo ""

# 5. Forçar purge do LiteSpeed
echo "5️⃣ Forçando purge do LiteSpeed..."
echo "Purge: *" > public/.litespeed_purge
killall -9 lsphp 2>/dev/null || true
echo "✅ LiteSpeed purgado!"
echo ""

# 6. Verificar se a classe pode ser carregada
echo "6️⃣ Verificando se a classe pode ser carregada..."
php artisan tinker --execute="
try {
    \$controller = new \App\Http\Controllers\Api\Wallet\DepositController();
    echo '✅ Classe carregada com sucesso!' . PHP_EOL;
} catch (\Exception \$e) {
    echo '❌ Erro: ' . \$e->getMessage() . PHP_EOL;
    echo 'Arquivo: ' . \$e->getFile() . PHP_EOL;
    echo 'Linha: ' . \$e->getLine() . PHP_EOL;
}
"
echo ""

# 7. Verificar métodos
echo "7️⃣ Verificando métodos..."
php artisan tinker --execute="
\$controller = new \App\Http\Controllers\Api\Wallet\DepositController();
if (method_exists(\$controller, 'submitPayment')) {
    echo '✅ Método submitPayment existe!' . PHP_EOL;
} else {
    echo '❌ Método submitPayment NÃO existe!' . PHP_EOL;
}
if (method_exists(\$controller, 'requestQrcodeArkama')) {
    echo '✅ Método requestQrcodeArkama existe!' . PHP_EOL;
} else {
    echo '❌ Método requestQrcodeArkama NÃO existe!' . PHP_EOL;
}
if (method_exists(\$controller, 'consultStatusTransactionPix')) {
    echo '✅ Método consultStatusTransactionPix existe!' . PHP_EOL;
} else {
    echo '❌ Método consultStatusTransactionPix NÃO existe!' . PHP_EOL;
}
"
echo ""

# 8. Verificar gateway
echo "8️⃣ Verificando configuração do gateway..."
php artisan tinker --execute="
\$gw = \App\Models\Gateway::first();
if (!\$gw) {
    echo '❌ Gateway não encontrado!' . PHP_EOL;
} else {
    echo 'Arkama ativo: ' . (\$gw->arkama_ativo ?? 0) . PHP_EOL;
    echo 'Token: ' . (empty(\$gw->arkama_api_token) ? 'VAZIO ❌' : 'OK ✅ (' . substr(\$gw->arkama_api_token, 0, 20) . '...)') . PHP_EOL;
    echo 'URI: ' . (\$gw->arkama_uri ?? 'VAZIO') . PHP_EOL;
}
"
echo ""

# 9. Verificar rotas
echo "9️⃣ Verificando rotas..."
php artisan route:list | grep -i "deposit\|payment" | head -5
echo ""

echo "✅ VERIFICAÇÃO COMPLETA!"
echo ""
echo "📝 PRÓXIMOS PASSOS:"
echo "1. Abra outro terminal e execute: tail -f storage/logs/laravel.log | grep -i 'DepositController\|Arkama\|error\|exception'"
echo "2. Tente fazer um depósito no navegador"
echo "3. Verifique se aparecem logs no terminal"
