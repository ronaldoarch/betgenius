<?php
require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

$banners = \App\Models\Banner::all();
echo "Total de banners: " . $banners->count() . PHP_EOL . PHP_EOL;

foreach ($banners as $banner) {
    $path = storage_path('app/public/' . $banner->image);
    $exists = file_exists($path);
    echo "Banner ID: " . $banner->id . " | Tipo: " . $banner->type . PHP_EOL;
    echo "  Image: " . $banner->image . PHP_EOL;
    echo "  Existe? " . ($exists ? "✅ SIM" : "❌ NÃO") . PHP_EOL;
    if (!$exists) {
        echo "  ⚠️  PRECISA RE-UPLOAD!" . PHP_EOL;
    }
    echo "" . PHP_EOL;
}

// Verificar logos também
echo "=== LOGOS ===" . PHP_EOL;
$settings = \Helper::getSetting();
if ($settings) {
    if (!empty($settings['software_logo_white'])) {
        $path = storage_path('app/public/' . $settings['software_logo_white']);
        $exists = file_exists($path);
        echo "Logo White: " . $settings['software_logo_white'] . PHP_EOL;
        echo "  Existe? " . ($exists ? "✅ SIM" : "❌ NÃO") . PHP_EOL;
    }
    if (!empty($settings['software_logo_black'])) {
        $path = storage_path('app/public/' . $settings['software_logo_black']);
        $exists = file_exists($path);
        echo "Logo Black: " . $settings['software_logo_black'] . PHP_EOL;
        echo "  Existe? " . ($exists ? "✅ SIM" : "❌ NÃO") . PHP_EOL;
    }
}

