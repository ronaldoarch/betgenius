<?php
// Script para verificar sintaxe do DepositController
$file = 'app/Http/Controllers/Api/Wallet/DepositController.php';

if (!file_exists($file)) {
    echo "❌ Arquivo não encontrado: $file\n";
    exit(1);
}

echo "🔍 Verificando sintaxe de: $file\n\n";

// Verificar sintaxe
$output = [];
$return_var = 0;
exec("php -l $file 2>&1", $output, $return_var);

if ($return_var === 0) {
    echo "✅ Sintaxe OK!\n";
    echo implode("\n", $output) . "\n\n";
} else {
    echo "❌ Erro de sintaxe!\n";
    echo implode("\n", $output) . "\n\n";
    exit(1);
}

// Verificar se a classe pode ser carregada
require __DIR__ . '/vendor/autoload.php';

try {
    $app = require_once __DIR__ . '/bootstrap/app.php';
    $app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();
    
    $controller = new \App\Http\Controllers\Api\Wallet\DepositController();
    echo "✅ Classe pode ser instanciada!\n\n";
} catch (\Exception $e) {
    echo "❌ Erro ao instanciar classe: " . $e->getMessage() . "\n";
    echo "   Arquivo: " . $e->getFile() . "\n";
    echo "   Linha: " . $e->getLine() . "\n\n";
    exit(1);
}

echo "✅ Tudo OK!\n";
