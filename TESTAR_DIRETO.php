<?php

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

echo "🧪 TESTANDO DEPOSITCONTROLLER DIRETAMENTE\n";
echo "=========================================\n\n";

// Testar se a classe pode ser instanciada
try {
    $controller = new \App\Http\Controllers\Api\Wallet\DepositController();
    echo "✅ Classe DepositController carregada com sucesso!\n\n";
} catch (\Exception $e) {
    echo "❌ Erro ao carregar classe: " . $e->getMessage() . "\n";
    echo "Arquivo: " . $e->getFile() . "\n";
    echo "Linha: " . $e->getLine() . "\n\n";
    exit(1);
}

// Testar se o método existe
if (method_exists($controller, 'submitPayment')) {
    echo "✅ Método submitPayment existe!\n\n";
} else {
    echo "❌ Método submitPayment NÃO existe!\n\n";
    exit(1);
}

// Testar se o trait ArkamaTrait está disponível
if (method_exists($controller, 'requestQrcodeArkama')) {
    echo "✅ Método requestQrcodeArkama existe (ArkamaTrait carregado)!\n\n";
} else {
    echo "❌ Método requestQrcodeArkama NÃO existe (ArkamaTrait não carregado)!\n\n";
    exit(1);
}

// Verificar gateway
$gw = \App\Models\Gateway::first();
echo "📋 Configuração do Gateway:\n";
echo "Arkama ativo: " . ($gw->arkama_ativo ?? 0) . "\n";
echo "Token: " . (empty($gw->arkama_api_token) ? 'VAZIO ❌' : 'OK ✅') . "\n";
echo "URI: " . ($gw->arkama_uri ?? 'VAZIO') . "\n\n";

echo "✅ Tudo OK! O problema pode ser:\n";
echo "1. Middleware auth.jwt bloqueando\n";
echo "2. Erro antes de chegar no método\n";
echo "3. Cache do Laravel\n\n";

