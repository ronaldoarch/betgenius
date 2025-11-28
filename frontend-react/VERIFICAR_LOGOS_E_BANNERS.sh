#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 DIAGNÓSTICO: LOGOS E BANNERS"
echo "═══════════════════════════════════════════════════════════════"
echo ""

# 1. Verificar symlink do storage
echo "=== 1. Verificando symlink public/storage ==="
if [ -L "public/storage" ]; then
    echo "✅ Symlink existe"
    ls -la public/storage | head -3
    echo "Aponta para: $(readlink public/storage)"
else
    echo "❌ Symlink NÃO existe!"
    echo "Criando symlink..."
    php artisan storage:link
    echo "✅ Symlink criado"
fi
echo ""

# 2. Verificar se o diretório storage/app/public existe
echo "=== 2. Verificando storage/app/public ==="
if [ -d "storage/app/public" ]; then
    echo "✅ Diretório existe"
    echo "Conteúdo:"
    ls -la storage/app/public/ | head -10
else
    echo "❌ Diretório NÃO existe!"
    mkdir -p storage/app/public
    chmod -R 775 storage/app/public
    echo "✅ Diretório criado"
fi
echo ""

# 3. Verificar logos via API
echo "=== 3. Verificando logos via API ==="
echo "Testando: https://betgeniusbr.com/api/settings/data"
curl -s "https://betgeniusbr.com/api/settings/data" | php -r "
\$data = json_decode(file_get_contents('php://stdin'), true);
if (\$data && isset(\$data['data']['setting'])) {
    \$setting = \$data['data']['setting'];
    echo 'software_logo_white: ' . (\$setting['software_logo_white'] ?? 'NÃO DEFINIDO') . PHP_EOL;
    echo 'software_logo_black: ' . (\$setting['software_logo_black'] ?? 'NÃO DEFINIDO') . PHP_EOL;
    
    if (!empty(\$setting['software_logo_white'])) {
        \$path = 'storage/app/public/' . \$setting['software_logo_white'];
        echo 'Logo white existe no servidor? ' . (file_exists(\$path) ? 'SIM' : 'NÃO') . PHP_EOL;
    }
    if (!empty(\$setting['software_logo_black'])) {
        \$path = 'storage/app/public/' . \$setting['software_logo_black'];
        echo 'Logo black existe no servidor? ' . (file_exists(\$path) ? 'SIM' : 'NÃO') . PHP_EOL;
    }
} else {
    echo '❌ Erro ao buscar dados da API' . PHP_EOL;
}
"
echo ""

# 4. Verificar banners via API
echo "=== 4. Verificando banners via API ==="
echo "Testando: https://betgeniusbr.com/api/settings/banners"
curl -s "https://betgeniusbr.com/api/settings/banners" | php -r "
\$data = json_decode(file_get_contents('php://stdin'), true);
if (\$data && isset(\$data['banners'])) {
    \$banners = \$data['banners'];
    echo 'Total de banners: ' . count(\$banners) . PHP_EOL;
    echo '' . PHP_EOL;
    
    foreach (\$banners as \$banner) {
        echo 'Banner ID: ' . \$banner['id'] . PHP_EOL;
        echo '  Tipo: ' . (\$banner['type'] ?? 'N/A') . PHP_EOL;
        echo '  Image: ' . (\$banner['image'] ?? 'NÃO DEFINIDO') . PHP_EOL;
        
        if (!empty(\$banner['image'])) {
            \$path = 'storage/app/public/' . \$banner['image'];
            \$exists = file_exists(\$path);
            echo '  Arquivo existe? ' . (\$exists ? 'SIM' : 'NÃO') . PHP_EOL;
            
            if (\$exists) {
                \$size = filesize(\$path);
                echo '  Tamanho: ' . number_format(\$size / 1024, 2) . ' KB' . PHP_EOL;
            } else {
                echo '  ⚠️  ARQUIVO FALTANDO!' . PHP_EOL;
            }
        }
        echo '' . PHP_EOL;
    }
} else {
    echo '❌ Erro ao buscar banners da API' . PHP_EOL;
}
"
echo ""

# 5. Testar acesso direto às URLs
echo "=== 5. Testando acesso direto às URLs ==="
echo "Testando um banner (se existir)..."
BANNER_IMAGE=$(curl -s "https://betgeniusbr.com/api/settings/banners" | php -r "
\$data = json_decode(file_get_contents('php://stdin'), true);
if (\$data && isset(\$data['banners'][0]['image'])) {
    echo \$data['banners'][0]['image'];
}
")

if [ ! -z "$BANNER_IMAGE" ]; then
    echo "Banner de teste: $BANNER_IMAGE"
    URL="https://betgeniusbr.com/storage/$BANNER_IMAGE"
    echo "URL: $URL"
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")
    CONTENT_TYPE=$(curl -s -I "$URL" | grep -i "content-type" | head -1)
    echo "HTTP Code: $HTTP_CODE"
    echo "Content-Type: $CONTENT_TYPE"
    
    if [ "$HTTP_CODE" = "200" ] && echo "$CONTENT_TYPE" | grep -qi "image"; then
        echo "✅ Banner acessível!"
    else
        echo "❌ Banner NÃO acessível ou retornando HTML"
    fi
else
    echo "Nenhum banner encontrado para testar"
fi
echo ""

# 6. Verificar permissões
echo "=== 6. Verificando permissões ==="
echo "storage/app/public:"
ls -ld storage/app/public
echo ""
echo "public/storage:"
ls -ld public/storage
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ DIAGNÓSTICO CONCLUÍDO!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 PRÓXIMOS PASSOS:"
echo "1. Se os arquivos não existem, re-upload via admin panel (/zirigui)"
echo "2. Se o symlink não existe, execute: php artisan storage:link"
echo "3. Se as URLs retornam HTML, verifique o .htaccess"
echo ""

