#!/bin/bash

echo "🧪 TESTANDO ROTA DE DEPÓSITO DIRETAMENTE"
echo "========================================="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando rotas disponíveis:"
php artisan route:list | grep -i "deposit\|payment" | head -10
echo ""

echo "2️⃣ Testando rota diretamente (precisa de autenticação):"
echo "   Execute no navegador (com DevTools aberto) e veja a requisição:"
echo "   - Abra: https://betgeniusbr.com/profile/deposit"
echo "   - Abra DevTools (F12) > Network"
echo "   - Tente fazer um depósito"
echo "   - Veja qual requisição está sendo feita e qual resposta está retornando"
echo ""

echo "3️⃣ Verificando se o método está sendo chamado:"
echo "   Os logs devem aparecer quando você tentar fazer depósito"
echo "   Execute em outro terminal:"
echo "   tail -f storage/logs/laravel.log | grep -i 'DepositController\|Arkama'"
echo ""

echo "4️⃣ Verificando se há erros de sintaxe:"
php -l app/Http/Controllers/Api/Wallet/DepositController.php
php -l app/Traits/Gateways/ArkamaTrait.php
echo ""

echo "5️⃣ Verificando se o gateway está ativo:"
php artisan tinker --execute="
\$gw = \App\Models\Gateway::first();
echo 'Arkama ativo: ' . (\$gw->arkama_ativo ?? 0) . PHP_EOL;
echo 'Token: ' . (empty(\$gw->arkama_api_token) ? 'VAZIO ❌' : 'OK ✅') . PHP_EOL;
"
echo ""

echo "📝 PRÓXIMOS PASSOS:"
echo "1. Abra o DevTools do navegador (F12)"
echo "2. Vá para a aba 'Network'"
echo "3. Tente fazer um depósito"
echo "4. Veja qual requisição está sendo feita"
echo "5. Clique na requisição e veja:"
echo "   - URL da requisição"
echo "   - Payload enviado"
echo "   - Resposta recebida"
echo "   - Status code"
echo ""

