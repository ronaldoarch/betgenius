#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

# Backup dos arquivos
cp .htaccess .htaccess.backup.$(date +%Y%m%d_%H%M%S)
if [ -f "index.php" ]; then
    cp index.php index.php.backup.$(date +%Y%m%d_%H%M%S)
fi

# Criar index.php na raiz (router)
cat > index.php << 'EOF'
<?php
/**
 * Router para separar React (site) e Laravel (admin/API)
 */
$requestUri = $_SERVER['REQUEST_URI'] ?? '/';
$requestPath = parse_url($requestUri, PHP_URL_PATH);

// Se for API, Admin (zirigui) ou Storage, redirecionar para Laravel
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

# Criar .htaccess na raiz
cat > .htaccess << 'EOF'
DirectoryIndex index.php index.html
Options +FollowSymLinks +SymLinksIfOwnerMatch
RewriteEngine On
RewriteBase /

# Arquivos e diretórios existentes → Servir diretamente (PRIMEIRO!)
RewriteCond %{REQUEST_FILENAME} -f
RewriteRule ^ - [L]

RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]

# API, Admin (zirigui) ou Storage → index.php na raiz (que roteia para Laravel)
RewriteCond %{REQUEST_URI} ^/(api|zirigui|storage) [NC]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^ index.php [L]

# Redirecionar tudo mais para public/ (React será servido pelo index.php da raiz)
RewriteRule ^(.*)$ public/$1 [L]
EOF

# Criar .htaccess em public/
cat > public/.htaccess << 'EOF'
<IfModule mod_rewrite.c>
    <IfModule mod_negotiation.c>
        Options -MultiViews -Indexes
    </IfModule>

    RewriteEngine On
    RewriteBase /

    # Handle Authorization Header
    RewriteCond %{HTTP:Authorization} .
    RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]

    # Arquivos e diretórios existentes → Servir diretamente (PRIMEIRO!)
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteRule ^ - [L]

    RewriteCond %{REQUEST_FILENAME} -d
    RewriteRule ^ - [L]

    # API → Laravel (index.php)
    RewriteCond %{REQUEST_URI} ^/api [NC]
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule ^ index.php [L]

    # Admin (zirigui) → Laravel (index.php)
    RewriteCond %{REQUEST_URI} ^/zirigui [NC]
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule ^ index.php [L]

    # Redirect Trailing Slashes If Not A Folder...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_URI} ^(.+)/$
    RewriteRule ^ %1 [L,R=301]

    # Tudo mais → Laravel (index.php) - para outras rotas do Laravel
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^ index.php [L]
</IfModule>
EOF

# Ajustar permissões e limpar cache
chmod 644 index.php .htaccess public/.htaccess
php artisan config:clear
php artisan route:clear
php artisan cache:clear

echo "✅ Admin configurado para Laravel!"
echo ""
echo "=== Testando /zirigui ==="
curl -s -I "https://betgeniusbr.com/zirigui" | head -10
echo ""

