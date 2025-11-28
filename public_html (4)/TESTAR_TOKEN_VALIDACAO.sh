#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

TOKEN="Yi65LYZGMxNYKOm5VIeisqiDFoV9Z410sAwVn8ydhwksruujPfUTrMK9C7VhNVOM"

echo "🔍 TESTANDO VALIDAÇÃO DO TOKEN"
echo "==============================="
echo ""

# 1. Verificar se o token está sendo recebido
echo "1️⃣ Testando se o token está sendo recebido..."
php artisan tinker --execute="
\$request = \Illuminate\Http\Request::create('/api/carteira_wallet/deposit/payment', 'POST', [], [], [], [
    'HTTP_AUTHORIZATION' => 'Bearer Yi65LYZGMxNYKOm5VIeisqiDFoV9Z410sAwVn8ydhwksruujPfUTrMK9C7VhNVOM',
    'HTTP_ACCEPT' => 'application/json',
    'CONTENT_TYPE' => 'application/json',
]);

\$token = \$request->bearerToken();
echo 'Token recebido: ' . (empty(\$token) ? 'NÃO ❌' : 'SIM ✅ (' . substr(\$token, 0, 20) . '...)') . PHP_EOL;
" 2>&1
echo ""

# 2. Tentar validar o token manualmente
echo "2️⃣ Tentando validar o token manualmente..."
php artisan tinker --execute="
try {
    \$token = 'Yi65LYZGMxNYKOm5VIeisqiDFoV9Z410sAwVn8ydhwksruujPfUTrMK9C7VhNVOM';
    
    // Tentar usar JWTAuth
    if (class_exists('JWTAuth')) {
        \$user = JWTAuth::setToken(\$token)->authenticate();
        if (\$user) {
            echo '✅ Token válido! Usuário: ' . \$user->email . ' (ID: ' . \$user->id . ')' . PHP_EOL;
        } else {
            echo '❌ Token inválido ou expirado' . PHP_EOL;
        }
    } else {
        echo '⚠️  JWTAuth não encontrado' . PHP_EOL;
    }
    
    // Tentar usar auth('api')
    auth('api')->setToken(\$token);
    if (auth('api')->check()) {
        echo '✅ auth(\"api\")->check() retornou true' . PHP_EOL;
        echo '   Usuário ID: ' . auth('api')->id() . PHP_EOL;
    } else {
        echo '❌ auth(\"api\")->check() retornou false' . PHP_EOL;
    }
} catch (\Exception \$e) {
    echo '❌ Erro ao validar token: ' . \$e->getMessage() . PHP_EOL;
    echo '   Arquivo: ' . \$e->getFile() . PHP_EOL;
    echo '   Linha: ' . \$e->getLine() . PHP_EOL;
}
" 2>&1
echo ""

# 3. Verificar configuração do auth
echo "3️⃣ Verificando configuração do auth..."
php artisan tinker --execute="
\$guards = config('auth.guards');
if (isset(\$guards['api'])) {
    echo 'Guard api configurado:' . PHP_EOL;
    echo '  Driver: ' . (\$guards['api']['driver'] ?? 'não definido') . PHP_EOL;
    echo '  Provider: ' . (\$guards['api']['provider'] ?? 'não definido') . PHP_EOL;
} else {
    echo '❌ Guard api não configurado!' . PHP_EOL;
}
" 2>&1
echo ""

echo "✅ TESTE COMPLETO!"
