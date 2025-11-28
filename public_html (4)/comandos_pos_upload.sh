#!/bin/bash

# COMANDOS PARA EXECUTAR APÓS UPLOAD DO DEPOSITCONTROLLER.PHP

echo "🔧 Ajustando permissões..."
chmod 644 app/Http/Controllers/Api/Wallet/DepositController.php

echo "🧹 Limpando cache do Laravel..."
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear

echo "✅ Verificando rotas do depósito..."
php artisan route:list | grep -i deposit

echo ""
echo "🎯 Tudo pronto! Agora teste no navegador:"
echo "   1. Acesse: https://betgeniusbr.com"
echo "   2. Faça login"
echo "   3. Vá em 'Depósito'"
echo "   4. Tente fazer um depósito PIX"
echo ""
echo "📊 Para acompanhar os logs em tempo real:"
echo "   tail -f storage/logs/laravel.log"

