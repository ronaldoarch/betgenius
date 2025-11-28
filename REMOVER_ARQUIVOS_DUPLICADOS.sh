#!/bin/bash

echo "🔧 REMOVENDO ARQUIVOS DUPLICADOS"
echo "================================="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Listando arquivos DepositController* no diretório:"
ls -la app/Http/Controllers/Api/Wallet/DepositController*.php
echo ""

echo "2️⃣ Removendo arquivos duplicados:"
if [ -f "app/Http/Controllers/Api/Wallet/DepositController_AgilizePay.php" ]; then
    echo "   Removendo DepositController_AgilizePay.php"
    rm app/Http/Controllers/Api/Wallet/DepositController_AgilizePay.php
fi

if [ -f "app/Http/Controllers/Api/Wallet/DepositController_Arkama.php" ]; then
    echo "   Removendo DepositController_Arkama.php"
    rm app/Http/Controllers/Api/Wallet/DepositController_Arkama.php
fi
echo ""

echo "3️⃣ Verificando arquivos restantes:"
ls -la app/Http/Controllers/Api/Wallet/DepositController*.php
echo ""

echo "4️⃣ Verificando tamanho do DepositController.php:"
wc -l app/Http/Controllers/Api/Wallet/DepositController.php
echo ""

echo "5️⃣ Regenerando autoload:"
composer dump-autoload -o
echo ""

echo "6️⃣ Verificando se a classe existe:"
php artisan tinker --execute="echo class_exists('App\\Http\\Controllers\\Api\\Wallet\\DepositController') ? '✅ Classe existe' : '❌ Classe NÃO existe';"
echo ""

echo "✅ Limpeza completa!"

