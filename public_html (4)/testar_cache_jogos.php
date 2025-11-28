<?php
/**
 * Script para testar limpeza de cache de jogos
 * Execute: php testar_cache_jogos.php
 */

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

use Illuminate\Support\Facades\Cache;
use App\Models\Game;

echo "=== TESTE DE CACHE DE JOGOS ===\n\n";

// 1. Verificar se há cache
echo "1. Verificando caches existentes:\n";
$cacheKeys = [
    'api.games.providers',
    'api.games.categories',
    'api.games.featured',
];

foreach ($cacheKeys as $key) {
    $exists = Cache::has($key);
    echo "   - $key: " . ($exists ? "EXISTE" : "NÃO EXISTE") . "\n";
}

// 2. Limpar cache
echo "\n2. Limpando cache...\n";
Cache::forget('api.games.providers');
Cache::forget('api.games.categories');
Cache::forget('api.games.featured');
echo "   ✅ Cache limpo!\n";

// 3. Verificar se foi limpo
echo "\n3. Verificando se cache foi limpo:\n";
foreach ($cacheKeys as $key) {
    $exists = Cache::has($key);
    echo "   - $key: " . ($exists ? "EXISTE" : "NÃO EXISTE") . "\n";
}

// 4. Testar método clearGamesCache do GameResource
echo "\n4. Testando método clearGamesCache do GameResource:\n";
try {
    \App\Filament\Resources\GameResource::clearGamesCache();
    echo "   ✅ Método executado com sucesso!\n";
} catch (\Exception $e) {
    echo "   ❌ Erro: " . $e->getMessage() . "\n";
}

// 5. Verificar quantos jogos ativos existem
echo "\n5. Verificando jogos no banco:\n";
$totalGames = Game::count();
$activeGames = Game::where('status', 1)->count();
$inactiveGames = Game::where('status', 0)->count();
echo "   - Total de jogos: $totalGames\n";
echo "   - Jogos ativos: $activeGames\n";
echo "   - Jogos inativos: $inactiveGames\n";

// 6. Testar endpoint source
echo "\n6. Testando se método source existe no GameController:\n";
try {
    $controller = new \App\Http\Controllers\Api\Games\GameController();
    $reflection = new ReflectionClass($controller);
    if ($reflection->hasMethod('source')) {
        echo "   ✅ Método 'source' existe!\n";
    } else {
        echo "   ❌ Método 'source' NÃO existe!\n";
    }
} catch (\Exception $e) {
    echo "   ❌ Erro: " . $e->getMessage() . "\n";
}

echo "\n=== FIM DO TESTE ===\n";

