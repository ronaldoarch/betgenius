#!/bin/bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

cat > diagnosticar_login.php << 'PHPEOF'
<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

echo "=== DIAGNÓSTICO DE LOGIN ===\n\n";

// 1. Verificar se existem usuários no banco
echo "1. Verificando usuários no banco:\n";
$users = \App\Models\User::all();
echo "   Total de usuários: " . $users->count() . "\n";
if ($users->count() > 0) {
    $firstUser = $users->first();
    echo "   Primeiro usuário:\n";
    echo "   - ID: " . $firstUser->id . "\n";
    echo "   - Email: " . $firstUser->email . "\n";
    echo "   - Nome: " . $firstUser->name . "\n";
    echo "   - Senha hash existe? " . (!empty($firstUser->password) ? "SIM" : "NÃO") . "\n";
} else {
    echo "   ⚠️  NENHUM USUÁRIO ENCONTRADO NO BANCO!\n";
}
echo "\n";

// 2. Verificar método respondWithToken
echo "2. Verificando formato de resposta do token:\n";
$controller = new \App\Http\Controllers\Api\Auth\AuthController();
$reflection = new ReflectionClass($controller);
if ($reflection->hasMethod('respondWithToken')) {
    echo "   ✅ Método respondWithToken existe\n";
    $method = $reflection->getMethod('respondWithToken');
    $method->setAccessible(true);
    
    // Criar um token de teste
    try {
        $testUser = $users->first();
        if ($testUser) {
            $token = auth('api')->login($testUser);
            if ($token) {
                $response = $method->invoke($controller, $token);
                $data = json_decode($response->getContent(), true);
                echo "   Formato da resposta:\n";
                echo "   " . json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) . "\n";
                
                // Verificar se tem access_token
                if (isset($data['access_token'])) {
                    echo "   ✅ Resposta contém 'access_token'\n";
                } else {
                    echo "   ⚠️  Resposta NÃO contém 'access_token'\n";
                    echo "   Chaves disponíveis: " . implode(', ', array_keys($data)) . "\n";
                }
            } else {
                echo "   ⚠️  Não foi possível gerar token de teste\n";
            }
        } else {
            echo "   ⚠️  Não há usuários para testar\n";
        }
    } catch (Exception $e) {
        echo "   ❌ Erro ao testar: " . $e->getMessage() . "\n";
    }
} else {
    echo "   ❌ Método respondWithToken NÃO encontrado\n";
}
echo "\n";

// 3. Testar autenticação com credenciais de teste
echo "3. Testando autenticação:\n";
if ($users->count() > 0) {
    $testUser = $users->first();
    echo "   Testando com email: " . $testUser->email . "\n";
    
    // Tentar autenticar (sem senha, apenas verificar se o método funciona)
    try {
        $credentials = ['email' => $testUser->email, 'password' => 'senha_incorreta'];
        $result = auth('api')->attempt($credentials);
        if ($result) {
            echo "   ⚠️  Autenticação funcionou (senha pode estar correta ou vazia)\n";
        } else {
            echo "   ✅ Autenticação rejeitou credenciais incorretas (comportamento esperado)\n";
        }
    } catch (Exception $e) {
        echo "   ❌ Erro na autenticação: " . $e->getMessage() . "\n";
    }
} else {
    echo "   ⚠️  Não há usuários para testar\n";
}
echo "\n";

// 4. Verificar configuração JWT
echo "4. Verificando configuração JWT:\n";
$jwtSecret = config('jwt.secret');
if (empty($jwtSecret) || $jwtSecret === 'your-secret-key') {
    echo "   ❌ JWT_SECRET não configurado corretamente\n";
} else {
    echo "   ✅ JWT_SECRET configurado\n";
}
echo "\n";

// 5. Verificar o código do AuthController
echo "5. Verificando código do AuthController:\n";
$controllerFile = app_path('Http/Controllers/Api/Auth/AuthController.php');
if (file_exists($controllerFile)) {
    $content = file_get_contents($controllerFile);
    if (strpos($content, 'respondWithToken') !== false) {
        echo "   ✅ Método respondWithToken encontrado no código\n";
        // Extrair o método
        preg_match('/private function respondWithToken\([^)]*\)\s*\{[^}]*\}/s', $content, $matches);
        if (!empty($matches[0])) {
            echo "   Código do método:\n";
            echo "   " . str_replace("\n", "\n   ", $matches[0]) . "\n";
        }
    } else {
        echo "   ❌ Método respondWithToken NÃO encontrado no código\n";
    }
} else {
    echo "   ❌ Arquivo AuthController não encontrado\n";
}
echo "\n";

echo "=== FIM DO DIAGNÓSTICO ===\n";
PHPEOF

php diagnosticar_login.php
