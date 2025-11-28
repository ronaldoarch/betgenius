#!/bin/bash

# Script para aplicar correções de jogos no servidor
# Execute via SSH: ssh -p 65002 u127271520@betgeniusbr.com

echo "=== APLICANDO CORREÇÕES DE JOGOS ==="
echo ""

# Ir para o diretório do projeto
cd /home/u127271520/domains/betgeniusbr.com/public_html || {
    echo "❌ Erro: Não foi possível acessar o diretório do projeto"
    exit 1
}

echo "✅ Diretório: $(pwd)"
echo ""

# Limpar todos os caches do Laravel
echo "1. Limpando caches do Laravel..."
php artisan cache:clear && echo "   ✅ Cache limpo"
php artisan config:clear && echo "   ✅ Config limpo"
php artisan route:clear && echo "   ✅ Rotas limpas"
php artisan view:clear && echo "   ✅ Views limpas"
echo ""

# Limpar cache de jogos especificamente
echo "2. Limpando cache de jogos..."
php artisan tinker --execute="
Cache::forget('api.games.providers');
Cache::forget('api.games.categories');
Cache::forget('api.games.featured');
echo '   ✅ Cache de jogos limpo!';
" 2>/dev/null || {
    echo "   ⚠️  Não foi possível limpar via tinker, mas não é crítico"
}
echo ""

# Verificar se os arquivos foram atualizados
echo "3. Verificando arquivos modificados..."
if grep -q "clearGamesCache" app/Filament/Resources/GameResource.php 2>/dev/null; then
    echo "   ✅ GameResource.php atualizado"
else
    echo "   ⚠️  GameResource.php pode não estar atualizado"
fi

if grep -q "public function source" app/Http/Controllers/Api/Games/GameController.php 2>/dev/null; then
    echo "   ✅ GameController.php atualizado"
else
    echo "   ⚠️  GameController.php pode não estar atualizado"
fi
echo ""

# Verificar se os métodos existem
echo "4. Verificando métodos..."
php artisan tinker --execute="
if (method_exists(new App\Http\Controllers\Api\Games\GameController(), 'source')) {
    echo '   ✅ Método source() existe';
} else {
    echo '   ❌ Método source() NÃO existe';
}

if (method_exists('App\Filament\Resources\GameResource', 'clearGamesCache')) {
    echo '   ✅ Função clearGamesCache() existe';
} else {
    echo '   ❌ Função clearGamesCache() NÃO existe';
}
" 2>/dev/null || echo "   ⚠️  Não foi possível verificar métodos"
echo ""

echo "=== CORREÇÕES APLICADAS ==="
echo ""
echo "📋 Próximos passos:"
echo "1. Acesse o admin: https://betgeniusbr.com/zirigui"
echo "2. Vá em 'TODOS OS JOGOS'"
echo "3. Verifique se aparece o botão 'Limpar Cache de Jogos'"
echo "4. Teste ativar/desativar um jogo"
echo ""

