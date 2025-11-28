<?php

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

echo "🧪 TESTANDO MÉTODO submitPayment DIRETAMENTE\n";
echo "============================================\n\n";

// Verificar se a classe pode ser carregada
try {
    $controller = new \App\Http\Controllers\Api\Wallet\DepositController();
    echo "✅ Classe DepositController carregada!\n\n";
} catch (\Exception $e) {
    echo "❌ Erro ao carregar classe: " . $e->getMessage() . "\n";
    echo "Arquivo: " . $e->getFile() . "\n";
    echo "Linha: " . $e->getLine() . "\n\n";
    exit(1);
}

// Verificar se o método existe
if (method_exists($controller, 'submitPayment')) {
    echo "✅ Método submitPayment existe!\n\n";
} else {
    echo "❌ Método submitPayment NÃO existe!\n\n";
    exit(1);
}

// Verificar se o trait está carregado
if (method_exists($controller, 'requestQrcodeArkama')) {
    echo "✅ Método requestQrcodeArkama existe (ArkamaTrait carregado)!\n\n";
} else {
    echo "❌ Método requestQrcodeArkama NÃO existe!\n\n";
    exit(1);
}

// Verificar gateway
$gw = \App\Models\Gateway::first();
if (!$gw) {
    echo "❌ Gateway não encontrado no banco!\n\n";
    exit(1);
}

echo "📋 Configuração do Gateway:\n";
echo "Arkama ativo: " . ($gw->arkama_ativo ?? 0) . "\n";
echo "Token: " . (empty($gw->arkama_api_token) ? 'VAZIO ❌' : 'OK ✅') . "\n";
echo "URI: " . ($gw->arkama_uri ?? 'VAZIO') . "\n\n";

// Criar uma requisição simulada
$request = \Illuminate\Http\Request::create('/api/carteira_wallet/deposit/payment', 'POST', [
    'amount' => 30.00,
    'cpf' => '70206292295',
]);

echo "📤 Tentando chamar submitPayment...\n";
echo "Payload: " . json_encode($request->all(), JSON_PRETTY_PRINT) . "\n\n";

// Tentar chamar o método (pode falhar por falta de autenticação, mas deve logar)
try {
    // Simular autenticação (se necessário)
    // $user = \App\Models\User::first();
    // auth('api')->login($user);
    
    $result = $controller->submitPayment($request);
    
    echo "✅ Método executado!\n";
    echo "Resultado: " . json_encode($result, JSON_PRETTY_PRINT) . "\n\n";
} catch (\Exception $e) {
    echo "❌ Erro ao executar método: " . $e->getMessage() . "\n";
    echo "Arquivo: " . $e->getFile() . "\n";
    echo "Linha: " . $e->getLine() . "\n";
    echo "Trace: " . $e->getTraceAsString() . "\n\n";
}

echo "📝 Verifique os logs acima para ver se apareceu '[DepositController] submitPayment chamado'\n";

