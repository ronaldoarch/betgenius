#!/bin/bash

# Script para verificar qual endpoint está causando erro 500
# Execute via SSH: ssh -p 65002 u127271520@betgeniusbr.com

echo "=== VERIFICANDO ERRO 500 ==="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html || {
    echo "❌ Erro: Não foi possível acessar o diretório"
    exit 1
}

echo "1. Verificando últimos erros no log do Laravel..."
echo ""
if [ -f "storage/logs/laravel.log" ]; then
    echo "   Últimos erros 500:"
    tail -100 storage/logs/laravel.log | grep -A 5 -B 5 "500\|Exception\|Error" | tail -30
else
    echo "   ⚠️  Arquivo de log não encontrado"
fi
echo ""

echo "2. Verificando se o GameController tem tratamento de erro..."
if [ -f "app/Http/Controllers/Api/Games/GameController.php" ]; then
    if grep -q "try {" app/Http/Controllers/Api/Games/GameController.php; then
        echo "   ✅ GameController tem try/catch"
    else
        echo "   ❌ GameController NÃO tem try/catch - precisa atualizar!"
    fi
else
    echo "   ❌ GameController não encontrado!"
fi
echo ""

echo "3. Testando endpoint de jogos..."
php artisan tinker --execute="
try {
    \$controller = new App\Http\Controllers\Api\Games\GameController();
    echo '   ✅ GameController pode ser instanciado' . PHP_EOL;
} catch (Exception \$e) {
    echo '   ❌ Erro ao instanciar: ' . \$e->getMessage() . PHP_EOL;
}
" 2>/dev/null || echo "   ⚠️  Não foi possível testar"
echo ""

echo "4. Verificando permissões de arquivos..."
ls -la app/Http/Controllers/Api/Games/GameController.php 2>/dev/null | awk '{print "   Permissões: " $1 " | Proprietário: " $3 ":" $4}'
echo ""

echo "=== PRÓXIMOS PASSOS ==="
echo ""
echo "1. Verifique os logs acima para ver qual endpoint está falhando"
echo "2. Se o GameController não tem try/catch, faça upload da versão corrigida"
echo "3. Limpe o cache: php artisan cache:clear"
echo "4. Verifique se há erros de sintaxe: php artisan route:list"
echo ""

