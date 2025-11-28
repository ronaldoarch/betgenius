#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "=== Corrigindo index.php na raiz para não processar /storage/ se arquivo existir ==="

# Backup
cp index.php index.php.backup.$(date +%Y%m%d_%H%M%S)

# Criar novo index.php
cat > index.php << 'EOF'
<?php
/**
 * Router para separar React (site) e Laravel (admin/API)
 */

$requestUri = $_SERVER['REQUEST_URI'] ?? '/';
$requestPath = parse_url($requestUri, PHP_URL_PATH);

// IMPORTANTE: Se for /storage/ e o arquivo existir, deixar o Apache servir diretamente
if (preg_match('#^/storage/(.+)$#', $requestPath, $matches)) {
    $storageFile = __DIR__ . '/public/storage/' . $matches[1];
    if (file_exists($storageFile) && is_file($storageFile)) {
        // Arquivo existe, deixar Apache servir (não fazer nada)
        return false; // Retorna false para não processar
    }
}

// Se for API, Admin (zirigui) ou Storage (mas arquivo não existe), redirecionar para Laravel
if (preg_match('#^/(api|zirigui|storage)#', $requestPath)) {
    // Mudar para o diretório public e chamar Laravel
    chdir(__DIR__ . '/public');
    
    // Definir variáveis SERVER necessárias para o Laravel
    $_SERVER['SCRIPT_NAME'] = '/index.php';
    $_SERVER['PHP_SELF'] = '/index.php';
    $_SERVER['REQUEST_URI'] = $requestUri;
    
    require __DIR__ . '/public/index.php';
    exit;
}

// Caso contrário, servir React
$indexPath = __DIR__ . '/public/index.html';
if (file_exists($indexPath)) {
    header('Content-Type: text/html; charset=utf-8');
    readfile($indexPath);
    exit;
}

http_response_code(404);
echo 'Not Found';
EOF

echo "✅ index.php atualizado"
echo ""

# Testar se o banner agora retorna imagem
echo "=== Testando banner ID 44 ==="
curl -s -I "https://betgeniusbr.com/storage/01KB5DHBYFVPQ63F10K40F1V40.jpg" | head -5
echo ""

echo "✅ Correção concluída!"

