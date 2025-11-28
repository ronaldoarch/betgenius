#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "🔑 CRIANDO TOKEN JWT PARA TESTE"
echo "================================"
echo ""

# Criar token para o primeiro usuário
php artisan tinker --execute="
try {
    // Buscar o primeiro usuário
    \$user = \App\Models\User::first();
    
    if (!\$user) {
        echo '❌ Nenhum usuário encontrado no banco!' . PHP_EOL;
        exit(1);
    }
    
    echo '👤 Usuário encontrado:' . PHP_EOL;
    echo '   ID: ' . \$user->id . PHP_EOL;
    echo '   Email: ' . \$user->email . PHP_EOL;
    echo '   Nome: ' . (\$user->name ?? 'N/A') . PHP_EOL;
    echo PHP_EOL;
    
    // Tentar criar token usando JWTAuth
    if (class_exists('Tymon\JWTAuth\Facades\JWTAuth')) {
        \$token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser(\$user);
        echo '✅ Token criado com sucesso!' . PHP_EOL;
        echo PHP_EOL;
        echo '📋 TOKEN JWT:' . PHP_EOL;
        echo \$token . PHP_EOL;
        echo PHP_EOL;
        echo '📝 Use este token para testar:' . PHP_EOL;
        echo 'curl -X POST https://betgeniusbr.com/api/carteira_wallet/deposit/payment \\' . PHP_EOL;
        echo '  -H \"Content-Type: application/json\" \\' . PHP_EOL;
        echo '  -H \"Authorization: Bearer ' . \$token . '\" \\' . PHP_EOL;
        echo '  -d \"{\\\"amount\\\":30,\\\"cpf\\\":\\\"70206292295\\\"}\"' . PHP_EOL;
    } elseif (class_exists('JWTAuth')) {
        \$token = JWTAuth::fromUser(\$user);
        echo '✅ Token criado com sucesso!' . PHP_EOL;
        echo PHP_EOL;
        echo '📋 TOKEN JWT:' . PHP_EOL;
        echo \$token . PHP_EOL;
        echo PHP_EOL;
        echo '📝 Use este token para testar:' . PHP_EOL;
        echo 'curl -X POST https://betgeniusbr.com/api/carteira_wallet/deposit/payment \\' . PHP_EOL;
        echo '  -H \"Content-Type: application/json\" \\' . PHP_EOL;
        echo '  -H \"Authorization: Bearer ' . \$token . '\" \\' . PHP_EOL;
        echo '  -d \"{\\\"amount\\\":30,\\\"cpf\\\":\\\"70206292295\\\"}\"' . PHP_EOL;
    } else {
        echo '❌ JWTAuth não encontrado!' . PHP_EOL;
        echo '   Verifique se o pacote tymon/jwt-auth está instalado' . PHP_EOL;
    }
} catch (\Exception \$e) {
    echo '❌ Erro ao criar token: ' . \$e->getMessage() . PHP_EOL;
    echo '   Arquivo: ' . \$e->getFile() . PHP_EOL;
    echo '   Linha: ' . \$e->getLine() . PHP_EOL;
}
" 2>&1

echo ""
echo "✅ PROCESSO COMPLETO!"
