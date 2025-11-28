#!/bin/bash

# Script de diagnóstico completo
# Execute via SSH: ssh -p 65002 u127271520@betgeniusbr.com

echo "=== DIAGNÓSTICO COMPLETO ==="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html || {
    echo "❌ Erro: Não foi possível acessar o diretório"
    exit 1
}

echo "1. VERIFICANDO IMAGENS..."
webp_count=$(find public/storage -name "*.webp" 2>/dev/null | wc -l)
echo "   📊 Total de arquivos .webp: $webp_count"
if [ "$webp_count" -eq 0 ]; then
    echo "   ❌ NENHUMA IMAGEM ENCONTRADA!"
    echo "   💡 Execute: Baixar e Extrair Imagens via admin"
else
    echo "   ✅ Imagens encontradas"
fi
echo ""

echo "2. VERIFICANDO ARQUIVOS CORRIGIDOS..."
if [ -f "app/Http/Controllers/Api/Games/GameController.php" ]; then
    if grep -q "try {" app/Http/Controllers/Api/Games/GameController.php; then
        echo "   ✅ GameController.php tem tratamento de erro"
    else
        echo "   ⚠️  GameController.php pode não estar atualizado"
    fi
else
    echo "   ❌ GameController.php não encontrado!"
fi
echo ""

echo "3. VERIFICANDO .htaccess..."
if [ -f ".htaccess" ]; then
    if grep -q "storage" .htaccess; then
        echo "   ✅ .htaccess (raiz) tem regras para storage"
    else
        echo "   ⚠️  .htaccess (raiz) pode não estar atualizado"
    fi
else
    echo "   ❌ .htaccess (raiz) não encontrado!"
fi

if [ -f "public/.htaccess" ]; then
    echo "   ✅ public/.htaccess existe"
else
    echo "   ⚠️  public/.htaccess não encontrado"
fi
echo ""

echo "4. VERIFICANDO ÚLTIMOS ERROS..."
if [ -f "storage/logs/laravel.log" ]; then
    error_count=$(tail -100 storage/logs/laravel.log | grep -i "error\|exception" | wc -l)
    echo "   📊 Erros nas últimas 100 linhas: $error_count"
    if [ "$error_count" -gt 0 ]; then
        echo "   ⚠️  Últimos erros:"
        tail -100 storage/logs/laravel.log | grep -i "error\|exception" | tail -3 | sed 's/^/      /'
    fi
else
    echo "   ⚠️  Arquivo de log não encontrado"
fi
echo ""

echo "5. VERIFICANDO CACHE..."
php artisan tinker --execute="
echo '   Cache providers: ' . (Cache::has('api.games.providers') ? 'EXISTE' : 'NÃO EXISTE') . PHP_EOL;
echo '   Cache categories: ' . (Cache::has('api.games.categories') ? 'EXISTE' : 'NÃO EXISTE') . PHP_EOL;
echo '   Cache featured: ' . (Cache::has('api.games.featured') ? 'EXISTE' : 'NÃO EXISTE') . PHP_EOL;
" 2>/dev/null || echo "   ⚠️  Não foi possível verificar cache"
echo ""

echo "=== RESUMO ==="
echo ""
if [ "$webp_count" -eq 0 ]; then
    echo "❌ AÇÃO NECESSÁRIA: Baixar imagens via admin!"
    echo "   Acesse: https://betgeniusbr.com/zirigui"
    echo "   Vá em: Gerenciamento de Jogos"
    echo "   Clique em: Baixar e Extrair Imagens"
fi
echo ""
echo "✅ Execute os comandos de limpeza de cache se necessário:"
echo "   php artisan cache:clear"
echo "   php artisan config:clear"
echo ""

