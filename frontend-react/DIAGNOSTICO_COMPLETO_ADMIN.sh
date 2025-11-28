#!/bin/bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

cat > diagnostico_completo_admin.php << 'PHPEOF'
<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

echo "=== DIAGNÓSTICO COMPLETO - ADMIN E FRONTEND ===\n\n";

// 1. Verificar conexão com banco
echo "1. Verificando conexão com banco de dados:\n";
try {
    \DB::connection()->getPdo();
    echo "   ✅ Conexão com banco OK\n";
} catch (Exception $e) {
    echo "   ❌ Erro na conexão: " . $e->getMessage() . "\n";
    exit(1);
}
echo "\n";

// 2. Verificar tabela settings
echo "2. Verificando tabela 'settings':\n";
try {
    $settingsCount = \App\Models\Setting::count();
    echo "   Total de registros: $settingsCount\n";
    
    if ($settingsCount > 0) {
        $setting = \App\Models\Setting::first();
        echo "   ✅ Tabela settings tem dados\n";
        echo "   - ID: " . $setting->id . "\n";
        echo "   - Software Name: " . ($setting->software_name ?? 'NULL') . "\n";
        echo "   - Logo White: " . ($setting->software_logo_white ?? 'NULL') . "\n";
        echo "   - Logo Black: " . ($setting->software_logo_black ?? 'NULL') . "\n";
    } else {
        echo "   ⚠️  Tabela settings está VAZIA!\n";
    }
} catch (Exception $e) {
    echo "   ❌ Erro ao acessar settings: " . $e->getMessage() . "\n";
}
echo "\n";

// 3. Verificar Helper::getSetting()
echo "3. Testando Helper::getSetting():\n";
try {
    $setting = \Helper::getSetting();
    if ($setting) {
        echo "   ✅ Helper::getSetting() retornou dados\n";
        echo "   - Software Name: " . ($setting->software_name ?? 'NULL') . "\n";
        echo "   - Logo White: " . ($setting->software_logo_white ?? 'NULL') . "\n";
        echo "   - Logo Black: " . ($setting->software_logo_black ?? 'NULL') . "\n";
        echo "   - Custom Layout existe? " . (isset($setting->custom) ? "SIM" : "NÃO") . "\n";
    } else {
        echo "   ❌ Helper::getSetting() retornou NULL\n";
    }
} catch (Exception $e) {
    echo "   ❌ Erro em Helper::getSetting(): " . $e->getMessage() . "\n";
    echo "   Stack trace: " . $e->getTraceAsString() . "\n";
}
echo "\n";

// 4. Verificar tabela custom_layouts
echo "4. Verificando tabela 'custom_layouts':\n";
try {
    $customLayoutsCount = \App\Models\CustomLayout::count();
    echo "   Total de registros: $customLayoutsCount\n";
    
    if ($customLayoutsCount > 0) {
        $layout = \App\Models\CustomLayout::first();
        echo "   ✅ Tabela custom_layouts tem dados\n";
        echo "   - ID: " . $layout->id . "\n";
    } else {
        echo "   ⚠️  Tabela custom_layouts está VAZIA!\n";
    }
} catch (Exception $e) {
    echo "   ❌ Erro ao acessar custom_layouts: " . $e->getMessage() . "\n";
}
echo "\n";

// 5. Testar API /api/settings/data
echo "5. Testando API /api/settings/data:\n";
try {
    $controller = new \App\Http\Controllers\Api\Settings\SettingController();
    $response = $controller->index();
    $data = json_decode($response->getContent(), true);
    
    if ($data && isset($data['setting'])) {
        echo "   ✅ API retornou dados\n";
        echo "   - Setting existe? " . (isset($data['setting']) ? "SIM" : "NÃO") . "\n";
        if (isset($data['setting'])) {
            $setting = $data['setting'];
            echo "   - Software Name: " . ($setting['software_name'] ?? 'NULL') . "\n";
            echo "   - Logo White: " . ($setting['software_logo_white'] ?? 'NULL') . "\n";
            echo "   - Logo Black: " . ($setting['software_logo_black'] ?? 'NULL') . "\n";
        }
    } else {
        echo "   ❌ API não retornou dados corretos\n";
        echo "   Resposta: " . json_encode($data, JSON_PRETTY_PRINT) . "\n";
    }
} catch (Exception $e) {
    echo "   ❌ Erro ao testar API: " . $e->getMessage() . "\n";
}
echo "\n";

// 6. Testar via HTTP (curl)
echo "6. Testando API via HTTP (curl):\n";
$ch = curl_init('https://betgeniusbr.com/api/settings/data');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    'Accept: application/json',
    'Content-Type: application/json'
]);
$response = curl_exec($ch);
$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
curl_close($ch);

echo "   HTTP Code: $httpCode\n";
if ($httpCode === 200) {
    $data = json_decode($response, true);
    if ($data && isset($data['setting'])) {
        echo "   ✅ API HTTP funcionando corretamente\n";
    } else {
        echo "   ⚠️  API retornou 200 mas sem dados corretos\n";
        echo "   Resposta: " . substr($response, 0, 200) . "...\n";
    }
} else {
    echo "   ❌ API HTTP retornou erro\n";
    echo "   Resposta: " . substr($response, 0, 200) . "...\n";
}
echo "\n";

// 7. Verificar rotas da API
echo "7. Verificando rotas da API:\n";
$routes = \Illuminate\Support\Facades\Route::getRoutes();
$apiRoutes = [];
foreach ($routes as $route) {
    $uri = $route->uri();
    if (strpos($uri, 'api/settings') !== false || 
        strpos($uri, 'api/auth') !== false ||
        strpos($uri, 'api/games') !== false ||
        strpos($uri, 'api/banners') !== false) {
        $apiRoutes[] = [
            'uri' => $uri,
            'methods' => $route->methods()
        ];
    }
}

if (!empty($apiRoutes)) {
    echo "   ✅ Rotas da API encontradas:\n";
    foreach ($apiRoutes as $route) {
        echo "   - " . implode(', ', $route['methods']) . " " . $route['uri'] . "\n";
    }
} else {
    echo "   ⚠️  Nenhuma rota da API encontrada\n";
}
echo "\n";

// 8. Verificar banners
echo "8. Verificando banners:\n";
try {
    $bannersCount = \App\Models\Banner::count();
    echo "   Total de banners: $bannersCount\n";
    
    if ($bannersCount > 0) {
        $carouselBanners = \App\Models\Banner::where('type', 'carousel')->count();
        $homeBanners = \App\Models\Banner::where('type', 'home')->count();
        echo "   - Banners carousel: $carouselBanners\n";
        echo "   - Banners home: $homeBanners\n";
    }
} catch (Exception $e) {
    echo "   ❌ Erro ao verificar banners: " . $e->getMessage() . "\n";
}
echo "\n";

// 9. Verificar jogos
echo "9. Verificando jogos:\n";
try {
    $gamesCount = \App\Models\Game::count();
    echo "   Total de jogos: $gamesCount\n";
} catch (Exception $e) {
    echo "   ❌ Erro ao verificar jogos: " . $e->getMessage() . "\n";
}
echo "\n";

// 10. Verificar categorias
echo "10. Verificando categorias:\n";
try {
    $categoriesCount = \App\Models\Category::count();
    echo "   Total de categorias: $categoriesCount\n";
} catch (Exception $e) {
    echo "   ❌ Erro ao verificar categorias: " . $e->getMessage() . "\n";
}
echo "\n";

echo "=== FIM DO DIAGNÓSTICO ===\n";
PHPEOF

php diagnostico_completo_admin.php

