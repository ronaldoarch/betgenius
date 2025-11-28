#!/bin/bash

# Script para reverter para estrutura original do Laravel
# Remove arquivos do React e restaura arquivos originais do Laravel

echo "🔄 REVERTENDO PARA ESTRUTURA ORIGINAL..."
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html/public

echo "📂 Diretório atual: $(pwd)"
echo ""

# 1. Backup dos arquivos atuais (opcional, mas seguro)
echo "1️⃣ Criando backup dos arquivos atuais..."
mkdir -p ../backup_react_$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="../backup_react_$(date +%Y%m%d_%H%M%S)"
if [ -f "index.html" ]; then
    cp index.html "$BACKUP_DIR/" 2>/dev/null
    echo "   ✅ Backup de index.html criado"
fi
if [ -d "assets" ]; then
    cp -r assets "$BACKUP_DIR/" 2>/dev/null
    echo "   ✅ Backup de assets/ criado"
fi
if [ -f "index_laravel.php" ]; then
    cp index_laravel.php "$BACKUP_DIR/" 2>/dev/null
    echo "   ✅ Backup de index_laravel.php criado"
fi
if [ -f ".htaccess" ]; then
    cp .htaccess "$BACKUP_DIR/" 2>/dev/null
    echo "   ✅ Backup de .htaccess criado"
fi
echo ""

# 2. Deletar arquivos do React
echo "2️⃣ Deletando arquivos do React..."
if [ -f "index.html" ]; then
    rm -f index.html
    echo "   ✅ index.html deletado"
else
    echo "   ⚠️  index.html não encontrado (já foi deletado?)"
fi

if [ -d "assets" ]; then
    rm -rf assets
    echo "   ✅ pasta assets/ deletada"
else
    echo "   ⚠️  pasta assets/ não encontrada (já foi deletada?)"
fi

if [ -f "index_laravel.php" ]; then
    rm -f index_laravel.php
    echo "   ✅ index_laravel.php deletado"
else
    echo "   ⚠️  index_laravel.php não encontrado (já foi deletado?)"
fi
echo ""

# 3. Restaurar index.php original do Laravel
echo "3️⃣ Restaurando index.php original do Laravel..."
cat > index.php << 'EOF'
<?php

use Illuminate\Contracts\Http\Kernel;
use Illuminate\Http\Request;

define('LARAVEL_START', microtime(true));

/*
|--------------------------------------------------------------------------
| Check If The Application Is Under Maintenance
|--------------------------------------------------------------------------
|
| If the application is in maintenance / demo mode via the "down" command
| we will load this file so that any pre-rendered content can be shown
| instead of starting the framework, which could cause an exception.
|
*/

if (file_exists($maintenance = __DIR__.'/../storage/framework/maintenance.php')) {
    require $maintenance;
}

/*
|--------------------------------------------------------------------------
| Register The Auto Loader
|--------------------------------------------------------------------------
|
| Composer provides a convenient, automatically generated class loader for
| this application. We just need to utilize it! We'll simply require it
| into the script here so we don't need to manually load our classes.
|
*/

require __DIR__.'/../vendor/autoload.php';

/*
|--------------------------------------------------------------------------
| Run The Application
|--------------------------------------------------------------------------
|
| Once we have the application, we can handle the incoming request using
| the application's HTTP kernel. Then, we will send the response back
| to this client's browser, allowing them to enjoy our application.
|
*/

$app = require_once __DIR__.'/../bootstrap/app.php';

$kernel = $app->make(Kernel::class);

$response = $kernel->handle(
    $request = Request::capture()
)->send();

$kernel->terminate($request, $response);
EOF
chmod 644 index.php
echo "   ✅ index.php restaurado"
echo ""

# 4. Restaurar .htaccess original do Laravel
echo "4️⃣ Restaurando .htaccess original do Laravel..."
cat > .htaccess << 'EOF'
<IfModule mod_rewrite.c>
    <IfModule mod_negotiation.c>
        Options -MultiViews -Indexes
    </IfModule>

    RewriteEngine On

    # Handle Authorization Header
    RewriteCond %{HTTP:Authorization} .
    RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]

    # Redirect Trailing Slashes If Not A Folder...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_URI} ^(.+)/$
    RewriteRule ^ %1 [L,R=301]

    # Send Requests To Front Controller...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^ index.php [L]
</IfModule>
EOF
chmod 644 .htaccess
echo "   ✅ .htaccess restaurado"
echo ""

# 5. Ajustar permissões
echo "5️⃣ Ajustando permissões..."
chmod 644 index.php
chmod 644 .htaccess
echo "   ✅ Permissões ajustadas"
echo ""

# 6. Limpar cache do Laravel
echo "6️⃣ Limpando cache do Laravel..."
cd ..
php artisan config:clear 2>/dev/null && echo "   ✅ Config cache limpo" || echo "   ⚠️  Erro ao limpar config cache"
php artisan cache:clear 2>/dev/null && echo "   ✅ Application cache limpo" || echo "   ⚠️  Erro ao limpar application cache"
php artisan route:clear 2>/dev/null && echo "   ✅ Route cache limpo" || echo "   ⚠️  Erro ao limpar route cache"
php artisan view:clear 2>/dev/null && echo "   ✅ View cache limpo" || echo "   ⚠️  Erro ao limpar view cache"
php artisan optimize:clear 2>/dev/null && echo "   ✅ Optimize cache limpo" || echo "   ⚠️  Erro ao limpar optimize cache"
echo ""

# 7. Verificar estrutura final
echo "7️⃣ Verificando estrutura final..."
echo ""
echo "📁 Arquivos em public/:"
ls -lah public/ | grep -E "index\.php|\.htaccess" || echo "   ⚠️  Arquivos não encontrados"
echo ""

# 8. Resumo
echo "═══════════════════════════════════════════════════════════════"
echo "✅ REVERSÃO CONCLUÍDA!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 O que foi feito:"
echo "   ✅ Arquivos do React deletados"
echo "   ✅ index.php original do Laravel restaurado"
echo "   ✅ .htaccess original do Laravel restaurado"
echo "   ✅ Permissões ajustadas"
echo "   ✅ Cache do Laravel limpo"
echo ""
echo "📦 Backup criado em: $BACKUP_DIR"
echo ""
echo "🧪 TESTAR AGORA:"
echo "   🌐 Site: https://betgeniusbr.com/"
echo "   🔐 Admin: https://betgeniusbr.com/admin"
echo "   🔌 API: https://betgeniusbr.com/api/..."
echo ""
echo "═══════════════════════════════════════════════════════════════"

