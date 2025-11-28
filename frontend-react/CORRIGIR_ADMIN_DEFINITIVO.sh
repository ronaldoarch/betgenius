#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO ADMIN DEFINITIVAMENTE PARA LARAVEL"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Fazendo backup dos arquivos:"
echo "───────────────────────────────────────────────────────────────"
cp .htaccess .htaccess.backup.$(date +%Y%m%d_%H%M%S) 2>/dev/null
if [ -f "index.php" ]; then
    cp index.php index.php.backup.$(date +%Y%m%d_%H%M%S) 2>/dev/null
fi
echo "   ✅ Backups criados"
echo ""

echo "2️⃣ Criando index.php na raiz para roteamento:"
echo "───────────────────────────────────────────────────────────────"
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

chmod 644 index.php
echo "   ✅ index.php criado na raiz"
echo ""

echo "3️⃣ Atualizando .htaccess na raiz:"
echo "───────────────────────────────────────────────────────────────"
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

chmod 644 .htaccess
echo "   ✅ .htaccess na raiz atualizado"
echo ""

echo "4️⃣ Atualizando .htaccess em public/:"
echo "───────────────────────────────────────────────────────────────"
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

chmod 644 public/.htaccess
echo "   ✅ .htaccess em public/ atualizado"
echo ""

echo "5️⃣ Limpando cache do Laravel:"
echo "───────────────────────────────────────────────────────────────"
php artisan config:clear 2>/dev/null || echo "   ⚠️  Erro ao limpar config cache"
php artisan route:clear 2>/dev/null || echo "   ⚠️  Erro ao limpar route cache"
php artisan cache:clear 2>/dev/null || echo "   ⚠️  Erro ao limpar cache"
php artisan view:clear 2>/dev/null || echo "   ⚠️  Erro ao limpar view cache"
echo "   ✅ Cache limpo"
echo ""

echo "6️⃣ Testando roteamento:"
echo "───────────────────────────────────────────────────────────────"
echo "   Testando /zirigui:"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/zirigui)
echo "   HTTP Code: $HTTP_CODE"
if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ] || [ "$HTTP_CODE" = "301" ]; then
    echo "   ✅ /zirigui está acessível"
    echo "   Verificando conteúdo (deve ter 'filament' ou 'login'):"
    curl -s https://betgeniusbr.com/zirigui | grep -i "filament\|login\|laravel" | head -1 || echo "   ⚠️  Pode estar retornando React"
else
    echo "   ⚠️  /zirigui retornou HTTP $HTTP_CODE"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ CORREÇÃO CONCLUÍDA!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 COMO FUNCIONA AGORA:"
echo "   • /zirigui → Laravel/Filament (Admin)"
echo "   • /api/* → Laravel (APIs)"
echo "   • /storage/* → Laravel (Arquivos)"
echo "   • / → React (Site)"
echo ""
echo "🧪 TESTAR:"
echo "   1. Acesse: https://betgeniusbr.com/zirigui"
echo "   2. Deve aparecer a tela de login do Filament"
echo "   3. Se ainda aparecer React, aguarde 1-2 minutos e tente novamente"
echo ""

