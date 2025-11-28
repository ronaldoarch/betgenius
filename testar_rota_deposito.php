<?php

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

echo "🧪 TESTANDO ROTA DE DEPÓSITO\n";
echo "============================\n\n";

// Simular uma requisição
$request = \Illuminate\Http\Request::create('/api/carteira_wallet/deposit/payment', 'POST', [
    'amount' => 30.00,
    'cpf' => '70206292295',
    'gateway' => 'arkama'
]);

// Adicionar headers de autenticação (se necessário)
$request->headers->set('Accept', 'application/json');
$request->headers->set('Content-Type', 'application/json');

echo "📋 Requisição simulada:\n";
echo "URL: " . $request->url() . "\n";
echo "Method: " . $request->method() . "\n";
echo "Payload: " . json_encode($request->all(), JSON_PRETTY_PRINT) . "\n\n";

// Tentar chamar o método diretamente
try {
    $controller = new \App\Http\Controllers\Api\Wallet\DepositController();
    
    echo "✅ Controller instanciado\n\n";
    
    // Verificar se o método existe
    if (method_exists($controller, 'submitPayment')) {
        echo "✅ Método submitPayment existe\n\n";
    } else {
        echo "❌ Método submitPayment NÃO existe\n\n";
        exit(1);
    }
    
    // Verificar se o trait está carregado
    if (method_exists($controller, 'requestQrcodeArkama')) {
        echo "✅ Método requestQrcodeArkama existe (ArkamaTrait carregado)\n\n";
    } else {
        echo "❌ Método requestQrcodeArkama NÃO existe (ArkamaTrait não carregado)\n\n";
        exit(1);
    }
    
    echo "📝 Tudo OK! O problema pode ser:\n";
    echo "1. Middleware auth.jwt bloqueando a requisição\n";
    echo "2. Erro antes de chegar no método\n";
    echo "3. Cache do servidor (LiteSpeed)\n\n";
    
} catch (\Exception $e) {
    echo "❌ Erro: " . $e->getMessage() . "\n";
    echo "Arquivo: " . $e->getFile() . "\n";
    echo "Linha: " . $e->getLine() . "\n";
    exit(1);
}

