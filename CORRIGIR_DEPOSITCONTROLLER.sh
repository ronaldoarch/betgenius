#!/bin/bash

echo "🔧 CORRIGINDO DepositController"
echo "================================"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando se o arquivo existe:"
ls -la app/Http/Controllers/Api/Wallet/DepositController.php
echo ""

echo "2️⃣ Verificando sintaxe PHP:"
php -l app/Http/Controllers/Api/Wallet/DepositController.php
echo ""

echo "3️⃣ Verificando namespace da classe:"
grep -n "^class DepositController" app/Http/Controllers/Api/Wallet/DepositController.php
echo ""

echo "4️⃣ Verificando namespace:"
grep -n "^namespace" app/Http/Controllers/Api/Wallet/DepositController.php
echo ""

echo "5️⃣ Regenerando autoload do Composer:"
composer dump-autoload -o
echo ""

echo "6️⃣ Limpando cache do Laravel:"
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan optimize:clear
echo ""

echo "✅ Correção completa!"

