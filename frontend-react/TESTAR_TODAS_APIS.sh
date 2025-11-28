#!/bin/bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

cat > testar_todas_apis.php << 'PHPEOF'
<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

echo "=== TESTANDO TODAS AS APIs DO FRONTEND ===\n\n";

$baseUrl = 'https://betgeniusbr.com/api';

// Função para testar API
function testAPI($name, $url, $method = 'GET', $data = null) {
    echo "Testando: $name\n";
    echo "  URL: $url\n";
    
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        'Accept: application/json',
        'Content-Type: application/json'
    ]);
    
    if ($method === 'POST') {
        curl_setopt($ch, CURLOPT_POST, true);
        if ($data) {
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
        }
    }
    
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $contentType = curl_getinfo($ch, CURLINFO_CONTENT_TYPE);
    curl_close($ch);
    
    echo "  HTTP Code: $httpCode\n";
    echo "  Content-Type: $contentType\n";
    
    if ($httpCode === 200) {
        $json = json_decode($response, true);
        if (json_last_error() === JSON_ERROR_NONE) {
            echo "  ✅ OK - Retornou JSON válido\n";
            if (isset($json['error'])) {
                echo "  ⚠️  Mas contém erro: " . $json['error'] . "\n";
            }
        } else {
            echo "  ❌ ERRO - Não é JSON válido\n";
            echo "  Resposta: " . substr($response, 0, 100) . "...\n";
        }
    } else {
        echo "  ❌ ERRO - HTTP $httpCode\n";
        echo "  Resposta: " . substr($response, 0, 200) . "...\n";
    }
    echo "\n";
}

// 1. Settings
testAPI('Settings', "$baseUrl/settings/data");

// 2. Banners
testAPI('Banners', "$baseUrl/settings/banners");

// 3. Games - All
testAPI('Games - All', "$baseUrl/games/all");

// 4. Games - Featured
testAPI('Games - Featured', "$baseUrl/featured/games");

// 5. Categories
testAPI('Categories', "$baseUrl/categories");

// 6. Auth - Login (com credenciais incorretas para testar)
testAPI('Auth - Login', "$baseUrl/auth/login", 'POST', [
    'email' => 'test@test.com',
    'password' => 'test'
]);

// 7. Auth - Register (com dados inválidos para testar)
testAPI('Auth - Register', "$baseUrl/auth/register", 'POST', [
    'name' => 'Test',
    'email' => 'test@test.com',
    'phone' => '1234567890',
    'password' => '123456'
]);

echo "=== FIM DOS TESTES ===\n";
PHPEOF

php testar_todas_apis.php

