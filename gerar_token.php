<?php

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make('Illuminate\Contracts\Console\Kernel');
$kernel->bootstrap();

try {
    // Buscar o primeiro usuário
    $user = \App\Models\User::first();
    
    if (!$user) {
        echo "❌ Nenhum usuário encontrado no banco!\n";
        exit(1);
    }
    
    echo "👤 Usuário encontrado:\n";
    echo "   ID: " . $user->id . "\n";
    echo "   Email: " . $user->email . "\n";
    echo "   Nome: " . ($user->name ?? 'N/A') . "\n";
    echo "\n";
    
    // Tentar criar token usando JWTAuth
    if (class_exists('Tymon\JWTAuth\Facades\JWTAuth')) {
        $token = \Tymon\JWTAuth\Facades\JWTAuth::fromUser($user);
        echo "✅ Token criado com sucesso!\n";
        echo "\n";
        echo "📋 TOKEN JWT:\n";
        echo $token . "\n";
        echo "\n";
        echo "📝 Use este token para testar:\n";
        echo "curl -X POST https://betgeniusbr.com/api/carteira_wallet/deposit/payment \\\n";
        echo "  -H \"Content-Type: application/json\" \\\n";
        echo "  -H \"Authorization: Bearer " . $token . "\" \\\n";
        echo "  -d '{\"amount\":30,\"cpf\":\"70206292295\"}'\n";
    } elseif (class_exists('JWTAuth')) {
        $token = JWTAuth::fromUser($user);
        echo "✅ Token criado com sucesso!\n";
        echo "\n";
        echo "📋 TOKEN JWT:\n";
        echo $token . "\n";
        echo "\n";
        echo "📝 Use este token para testar:\n";
        echo "curl -X POST https://betgeniusbr.com/api/carteira_wallet/deposit/payment \\\n";
        echo "  -H \"Content-Type: application/json\" \\\n";
        echo "  -H \"Authorization: Bearer " . $token . "\" \\\n";
        echo "  -d '{\"amount\":30,\"cpf\":\"70206292295\"}'\n";
    } else {
        echo "❌ JWTAuth não encontrado!\n";
        echo "   Verifique se o pacote tymon/jwt-auth está instalado\n";
    }
} catch (\Exception $e) {
    echo "❌ Erro ao criar token: " . $e->getMessage() . "\n";
    echo "   Arquivo: " . $e->getFile() . "\n";
    echo "   Linha: " . $e->getLine() . "\n";
}

