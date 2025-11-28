<?php
/**
 * Script para testar a requisição diretamente no servidor
 * Execute: php TESTAR_REQUISICAO_DIRETA.php
 */

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make('Illuminate\Contracts\Console\Kernel');
$kernel->bootstrap();

echo "🧪 TESTANDO REQUISIÇÃO DIRETA\n";
echo "==============================\n\n";

// Simular uma requisição HTTP completa
$request = \Illuminate\Http\Request::create(
    '/api/carteira_wallet/deposit/payment',
    'POST',
    [
        'amount' => 30.00,
        'cpf' => '70206292295',
    ],
    [],
    [],
    [
        'HTTP_ACCEPT' => 'application/json',
        'CONTENT_TYPE' => 'application/json',
    ]
);

echo "📤 Requisição criada:\n";
echo "   URI: " . $request->getPathInfo() . "\n";
echo "   Method: " . $request->getMethod() . "\n";
echo "   Payload: " . json_encode($request->all(), JSON_PRETTY_PRINT) . "\n\n";

// Tentar resolver a rota
try {
    $route = \Illuminate\Support\Facades\Route::getRoutes()->match($request);
    echo "✅ Rota encontrada!\n";
    echo "   Controller: " . $route->getActionName() . "\n";
    echo "   Middleware: " . implode(', ', $route->gatherMiddleware()) . "\n\n";
} catch (\Exception $e) {
    echo "❌ Rota NÃO encontrada: " . $e->getMessage() . "\n\n";
    exit(1);
}

// Tentar processar a requisição através do kernel
echo "📥 Processando requisição através do kernel...\n\n";

try {
    // Simular autenticação (se necessário)
    // $user = \App\Models\User::first();
    // if ($user) {
    //     auth('api')->login($user);
    //     echo "✅ Usuário autenticado: " . $user->email . "\n\n";
    // }
    
    $response = $kernel->handle($request);
    
    echo "✅ Resposta recebida!\n";
    echo "   Status: " . $response->getStatusCode() . "\n";
    echo "   Content: " . substr($response->getContent(), 0, 500) . "\n\n";
    
    $kernel->terminate($request, $response);
} catch (\Exception $e) {
    echo "❌ Erro ao processar requisição:\n";
    echo "   Mensagem: " . $e->getMessage() . "\n";
    echo "   Arquivo: " . $e->getFile() . "\n";
    echo "   Linha: " . $e->getLine() . "\n";
    echo "   Trace:\n" . $e->getTraceAsString() . "\n\n";
}

// Verificar logs
echo "📝 Últimas linhas do log:\n";
$logFile = storage_path('logs/laravel.log');
if (file_exists($logFile)) {
    $lines = file($logFile);
    $lastLines = array_slice($lines, -20);
    echo implode('', $lastLines) . "\n";
} else {
    echo "   Arquivo de log não encontrado!\n\n";
}

