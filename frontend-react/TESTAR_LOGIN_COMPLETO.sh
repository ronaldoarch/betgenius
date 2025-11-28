#!/bin/bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

cat > testar_login_completo.php << 'PHPEOF'
<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

echo "=== TESTE COMPLETO DE LOGIN ===\n\n";

// 1. Simular requisição do frontend
echo "1. Simulando requisição do frontend:\n";
echo "   URL: https://betgeniusbr.com/api/auth/login\n";
echo "   Method: POST\n";
echo "   Headers: Content-Type: application/json, Accept: application/json\n";
echo "\n";

// 2. Testar com credenciais incorretas (deve retornar erro)
echo "2. Testando com credenciais incorretas:\n";
$ch = curl_init('https://betgeniusbr.com/api/auth/login');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    'Content-Type: application/json',
    'Accept: application/json'
]);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode([
    'email' => 'test@test.com',
    'password' => 'senha_incorreta'
]));

$response = curl_exec($ch);
$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
curl_close($ch);

echo "   HTTP Code: $httpCode\n";
echo "   Response: $response\n";
echo "\n";

// 3. Verificar se a resposta está no formato correto
$data = json_decode($response, true);
if (json_last_error() === JSON_ERROR_NONE) {
    echo "   ✅ Resposta é JSON válido\n";
    if (isset($data['error'])) {
        echo "   ✅ Contém campo 'error': " . $data['error'] . "\n";
    }
} else {
    echo "   ❌ Resposta NÃO é JSON válido\n";
}
echo "\n";

// 4. Verificar CORS
echo "3. Verificando CORS:\n";
$ch = curl_init('https://betgeniusbr.com/api/auth/login');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HEADER, true);
curl_setopt($ch, CURLOPT_NOBODY, true);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    'Content-Type: application/json',
    'Accept: application/json',
    'Origin: https://betgeniusbr.com'
]);

$headers = curl_exec($ch);
curl_close($ch);

if (strpos($headers, 'access-control-allow-origin') !== false) {
    echo "   ✅ CORS configurado\n";
    preg_match('/access-control-allow-origin: (.+)/i', $headers, $matches);
    if (!empty($matches[1])) {
        echo "   Valor: " . trim($matches[1]) . "\n";
    }
} else {
    echo "   ⚠️  CORS não encontrado nos headers\n";
}
echo "\n";

// 5. Verificar se há usuários ativos
echo "4. Verificando usuários ativos:\n";
$users = \App\Models\User::where('status', 'active')
    ->where('banned', 0)
    ->limit(5)
    ->get(['id', 'email', 'name', 'status', 'banned']);
    
echo "   Total de usuários ativos: " . $users->count() . "\n";
if ($users->count() > 0) {
    echo "   Primeiros usuários ativos:\n";
    foreach ($users as $user) {
        echo "   - ID: {$user->id} | Email: {$user->email} | Nome: {$user->name}\n";
    }
} else {
    echo "   ⚠️  Nenhum usuário ativo encontrado\n";
}
echo "\n";

// 6. Verificar rotas da API
echo "5. Verificando rotas da API:\n";
$routes = \Illuminate\Support\Facades\Route::getRoutes();
$authRoutes = [];
foreach ($routes as $route) {
    $uri = $route->uri();
    if (strpos($uri, 'auth/login') !== false) {
        $authRoutes[] = [
            'uri' => $uri,
            'methods' => $route->methods(),
            'middleware' => $route->middleware()
        ];
    }
}

if (!empty($authRoutes)) {
    echo "   ✅ Rota /api/auth/login encontrada\n";
    foreach ($authRoutes as $route) {
        echo "   URI: " . $route['uri'] . "\n";
        echo "   Methods: " . implode(', ', $route['methods']) . "\n";
    }
} else {
    echo "   ❌ Rota /api/auth/login NÃO encontrada\n";
}
echo "\n";

echo "=== FIM DO TESTE ===\n";
echo "\n";
echo "CONCLUSÃO:\n";
echo "- Se o teste com credenciais incorretas retornou 400 com JSON válido, a API está funcionando corretamente.\n";
echo "- O problema pode ser:\n";
echo "  1. Credenciais incorretas no frontend\n";
echo "  2. Problema de CORS (mas parece estar configurado)\n";
echo "  3. Problema no frontend ao processar a resposta\n";
echo "\n";
PHPEOF

php testar_login_completo.php

