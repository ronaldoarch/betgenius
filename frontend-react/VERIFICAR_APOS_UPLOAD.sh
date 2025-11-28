#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 VERIFICANDO BANNERS APÓS UPLOAD"
echo "═══════════════════════════════════════════════════════════════"
echo ""

# Criar script PHP para verificar
cat > verificar_banners_apos_upload.php << 'PHPEOF'
<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

$banners = \App\Models\Banner::all();
echo "Total de banners: " . $banners->count() . PHP_EOL . PHP_EOL;

$carouselBanners = [];
$homeBanners = [];

foreach ($banners as $banner) {
    $path = storage_path('app/public/' . $banner->image);
    $exists = file_exists($path);
    
    echo "Banner ID: " . $banner->id . " | Tipo: " . $banner->type . PHP_EOL;
    echo "  Image: " . $banner->image . PHP_EOL;
    echo "  Existe? " . ($exists ? "SIM" : "NAO") . PHP_EOL;
    
    if ($exists) {
        $size = filesize($path);
        $perms = substr(sprintf('%o', fileperms($path)), -4);
        echo "  Tamanho: " . number_format($size / 1024, 2) . " KB" . PHP_EOL;
        echo "  Permissoes: " . $perms . PHP_EOL;
        
        // Testar URL
        $url = "https://betgeniusbr.com/storage/" . $banner->image;
        echo "  URL: " . $url . PHP_EOL;
        
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_NOBODY, true);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $contentType = curl_getinfo($ch, CURLINFO_CONTENT_TYPE);
        curl_close($ch);
        
        echo "  HTTP Code: " . $httpCode . PHP_EOL;
        echo "  Content-Type: " . $contentType . PHP_EOL;
        
        if ($httpCode == 200 && strpos($contentType, 'image') !== false) {
            echo "  Status: OK - Acessivel" . PHP_EOL;
        } else {
            echo "  Status: ERRO - Nao acessivel ou retornando HTML" . PHP_EOL;
        }
        
        // Agrupar por tipo
        if ($banner->type === 'carousel') {
            $carouselBanners[] = $banner;
        } elseif ($banner->type === 'home' || $banner->type === 'top') {
            $homeBanners[] = $banner;
        }
    } else {
        echo "  PRECISA RE-UPLOAD!" . PHP_EOL;
    }
    echo "" . PHP_EOL;
}

echo "=== RESUMO ===" . PHP_EOL;
echo "Banners carousel (para carrossel): " . count($carouselBanners) . PHP_EOL;
echo "Banners home/top (para topo): " . count($homeBanners) . PHP_EOL;
echo "" . PHP_EOL;

// Verificar permissões do diretório storage
echo "=== PERMISSOES STORAGE ===" . PHP_EOL;
$storagePath = storage_path('app/public');
echo "Diretorio: " . $storagePath . PHP_EOL;
echo "Existe? " . (is_dir($storagePath) ? "SIM" : "NAO") . PHP_EOL;
if (is_dir($storagePath)) {
    echo "Permissoes: " . substr(sprintf('%o', fileperms($storagePath)), -4) . PHP_EOL;
    echo "Writable? " . (is_writable($storagePath) ? "SIM" : "NAO") . PHP_EOL;
}
echo "" . PHP_EOL;

// Verificar symlink
echo "=== SYMLINK ===" . PHP_EOL;
$symlinkPath = public_path('storage');
echo "Symlink: " . $symlinkPath . PHP_EOL;
echo "Existe? " . (file_exists($symlinkPath) ? "SIM" : "NAO") . PHP_EOL;
if (file_exists($symlinkPath)) {
    echo "E symlink? " . (is_link($symlinkPath) ? "SIM" : "NAO") . PHP_EOL;
    if (is_link($symlinkPath)) {
        echo "Aponta para: " . readlink($symlinkPath) . PHP_EOL;
    }
}
PHPEOF

# Executar verificação
php verificar_banners_apos_upload.php

# Limpar cache
echo ""
echo "=== Limpando cache ==="
php artisan config:clear
php artisan cache:clear
php artisan route:clear

# Remover script
rm verificar_banners_apos_upload.php

echo ""
echo "✅ Verificação concluída!"

