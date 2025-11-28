<?php
/**
 * Script para verificar se o middleware auth.jwt está bloqueando a requisição
 * Execute: php VERIFICAR_MIDDLEWARE.php
 */

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make('Illuminate\Contracts\Console\Kernel');
$kernel->bootstrap();

echo "🔍 VERIFICANDO MIDDLEWARE auth.jwt\n";
echo "===================================\n\n";

// Verificar se o middleware existe
$middleware = app('router')->getMiddleware();
echo "📋 Middlewares registrados:\n";
foreach ($middleware as $key => $value) {
    if (strpos($key, 'jwt') !== false || strpos($key, 'auth') !== false) {
        echo "   - $key => $value\n";
    }
}
echo "\n";

// Verificar se auth.jwt está registrado
if (isset($middleware['auth.jwt'])) {
    echo "✅ Middleware auth.jwt está registrado!\n";
    echo "   Classe: " . $middleware['auth.jwt'] . "\n\n";
    
    // Tentar instanciar o middleware
    try {
        $middlewareInstance = app($middleware['auth.jwt']);
        echo "✅ Middleware pode ser instanciado!\n\n";
    } catch (\Exception $e) {
        echo "❌ Erro ao instanciar middleware: " . $e->getMessage() . "\n";
        echo "   Arquivo: " . $e->getFile() . "\n";
        echo "   Linha: " . $e->getLine() . "\n\n";
    }
} else {
    echo "❌ Middleware auth.jwt NÃO está registrado!\n\n";
}

// Verificar a rota
echo "📍 Verificando rota...\n";
$routes = \Illuminate\Support\Facades\Route::getRoutes();
$depositRoute = null;

foreach ($routes as $route) {
    if (strpos($route->uri(), 'deposit/payment') !== false) {
        $depositRoute = $route;
        break;
    }
}

if ($depositRoute) {
    echo "✅ Rota encontrada: " . $depositRoute->uri() . "\n";
    echo "   Método: " . implode(', ', $depositRoute->methods()) . "\n";
    echo "   Controller: " . $depositRoute->getActionName() . "\n";
    
    $middlewares = $depositRoute->gatherMiddleware();
    echo "   Middlewares aplicados:\n";
    foreach ($middlewares as $mw) {
        echo "      - " . (is_string($mw) ? $mw : get_class($mw)) . "\n";
    }
    echo "\n";
} else {
    echo "❌ Rota não encontrada!\n\n";
}

// Testar requisição sem token (deve retornar 401)
echo "🧪 Testando requisição SEM token (deve retornar 401)...\n";
$request = \Illuminate\Http\Request::create(
    '/api/carteira_wallet/deposit/payment',
    'POST',
    ['amount' => 30, 'cpf' => '70206292295'],
    [],
    [],
    ['HTTP_ACCEPT' => 'application/json']
);

try {
    $response = $kernel->handle($request);
    echo "   Status: " . $response->getStatusCode() . "\n";
    echo "   Content: " . substr($response->getContent(), 0, 200) . "\n\n";
    
    if ($response->getStatusCode() === 401) {
        echo "✅ Middleware está funcionando (bloqueou requisição sem token)!\n\n";
    } else {
        echo "⚠️  Status inesperado! Esperado: 401, Recebido: " . $response->getStatusCode() . "\n\n";
    }
    
    $kernel->terminate($request, $response);
} catch (\Exception $e) {
    echo "❌ Erro ao processar requisição:\n";
    echo "   Mensagem: " . $e->getMessage() . "\n";
    echo "   Arquivo: " . $e->getFile() . "\n";
    echo "   Linha: " . $e->getLine() . "\n\n";
}

echo "📝 CONCLUSÃO:\n";
echo "Se o middleware está bloqueando, você deve ver:\n";
echo "1. Status 401 (Unauthorized) quando não há token\n";
echo "2. Nenhum log do DepositController (porque não chega no controller)\n";
echo "3. Erro no frontend: 'Ocorreu uma falha ao entrar em contato com o banco'\n\n";
echo "SOLUÇÃO: Verificar se o token JWT está sendo enviado corretamente no frontend!\n";

