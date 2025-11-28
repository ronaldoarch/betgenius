<?php

// Script para testar a rota completa de depósito
// Execute: php TESTAR_ROTA_COMPLETA.php

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make('Illuminate\Contracts\Console\Kernel');
$kernel->bootstrap();

echo "🧪 TESTANDO ROTA COMPLETA DE DEPÓSITO\n";
echo "=====================================\n\n";

// Verificar se a rota existe
$routes = \Illuminate\Support\Facades\Route::getRoutes();
$depositRoute = null;

foreach ($routes as $route) {
    if (strpos($route->uri(), 'deposit') !== false || strpos($route->uri(), 'payment') !== false) {
        echo "📍 Rota encontrada: " . $route->method() . " " . $route->uri() . "\n";
        echo "   Controller: " . ($route->getActionName() ?? 'closure') . "\n";
        
        if (strpos($route->uri(), 'payment') !== false) {
            $depositRoute = $route;
        }
    }
}

echo "\n";

// Verificar se encontrou a rota de payment
if (!$depositRoute) {
    echo "❌ Rota de payment não encontrada!\n";
    exit(1);
}

echo "✅ Rota de payment encontrada!\n";
echo "   URI: " . $depositRoute->uri() . "\n";
echo "   Método: " . implode(', ', $depositRoute->methods()) . "\n";
echo "   Controller: " . $depositRoute->getActionName() . "\n\n";

// Verificar middleware
$middleware = $depositRoute->gatherMiddleware();
echo "🔒 Middleware aplicado:\n";
foreach ($middleware as $mw) {
    echo "   - " . (is_string($mw) ? $mw : get_class($mw)) . "\n";
}
echo "\n";

// Verificar se o controller pode ser instanciado
try {
    $controllerClass = $depositRoute->getControllerClass();
    echo "📦 Controller class: " . $controllerClass . "\n";
    
    $controllerMethod = $depositRoute->getControllerMethod();
    echo "📦 Controller method: " . $controllerMethod . "\n\n";
    
    $controller = app($controllerClass);
    echo "✅ Controller instanciado!\n\n";
    
    if (method_exists($controller, $controllerMethod)) {
        echo "✅ Método " . $controllerMethod . " existe!\n\n";
    } else {
        echo "❌ Método " . $controllerMethod . " NÃO existe!\n\n";
        exit(1);
    }
} catch (\Exception $e) {
    echo "❌ Erro ao instanciar controller: " . $e->getMessage() . "\n";
    echo "   Arquivo: " . $e->getFile() . "\n";
    echo "   Linha: " . $e->getLine() . "\n\n";
    exit(1);
}

// Verificar gateway
$gw = \App\Models\Gateway::first();
if (!$gw) {
    echo "❌ Gateway não encontrado no banco!\n\n";
    exit(1);
}

echo "📋 Configuração do Gateway:\n";
echo "   Arkama ativo: " . ($gw->arkama_ativo ?? 0) . "\n";
echo "   Token: " . (empty($gw->arkama_api_token) ? 'VAZIO ❌' : 'OK ✅') . "\n";
echo "   URI: " . ($gw->arkama_uri ?? 'VAZIO') . "\n\n";

echo "✅ Tudo parece estar configurado corretamente!\n";
echo "   Se ainda houver erro, verifique:\n";
echo "   1. Se o token está correto\n";
echo "   2. Se a URI está correta\n";
echo "   3. Se há cache do servidor (LiteSpeed)\n";
echo "   4. Se o middleware auth.jwt está funcionando\n";

