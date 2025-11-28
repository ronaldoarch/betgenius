#!/bin/bash

# COMANDOS PARA EXECUTAR APÓS O UPLOAD DO DEPOSITCONTROLLER.PHP

echo "🔍 1. Verificando sintaxe do arquivo..."
php -l app/Http/Controllers/Api/Wallet/DepositController.php

echo ""
echo "✅ 2. Ajustando permissões..."
chmod 644 app/Http/Controllers/Api/Wallet/DepositController.php

echo ""
echo "🧹 3. Limpando cache do Laravel..."
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
php artisan optimize:clear

echo ""
echo "📊 4. Informações do arquivo:"
ls -lh app/Http/Controllers/Api/Wallet/DepositController.php

echo ""
echo "✅ TUDO PRONTO!"
echo ""
echo "🧪 AGORA TESTE NO NAVEGADOR:"
echo "   1. Acesse: https://betgeniusbr.com/profile/deposit"
echo "   2. Tente fazer um depósito de R$ 10,00"
echo "   3. O QR CODE DEVE APARECER!"
echo ""
echo "📊 Para ver logs em tempo real:"
echo "   tail -f storage/logs/laravel.log"

