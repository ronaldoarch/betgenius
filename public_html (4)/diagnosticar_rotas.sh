#!/bin/bash

# =====================================
# DIAGNÓSTICO RÁPIDO DE ROTAS
# Execute no servidor via SSH
# =====================================

echo "🔍 DIAGNÓSTICO DE ROTAS - betgeniusbr.com"
echo "=========================================="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

# 1. Verificar rotas de depósito
echo "1️⃣  ROTAS DE DEPÓSITO:"
echo "---------------------"
php artisan route:list | grep -E "deposit|Deposit" | head -10
echo ""

# 2. Verificar rotas de profile
echo "2️⃣  ROTAS DE PROFILE:"
echo "--------------------"
php artisan route:list | grep -E "profile|Profile" | head -10
echo ""

# 3. Verificar rotas de Cartwavehub
echo "3️⃣  ROTAS DE CARTWAVEHUB:"
echo "------------------------"
php artisan route:list | grep -i cartwavehub
echo ""

# 4. Testar se a API responde
echo "4️⃣  TESTE DE CONECTIVIDADE:"
echo "---------------------------"
echo "Testando: GET /api/carteira_wallet/deposit"
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/api/carteira_wallet/deposit)
if [ "$RESPONSE" = "401" ]; then
    echo "✅ Rota existe (401 = Precisa autenticação)"
elif [ "$RESPONSE" = "404" ]; then
    echo "❌ Rota NÃO existe (404 = Not Found)"
elif [ "$RESPONSE" = "200" ]; then
    echo "✅ Rota existe e está acessível"
else
    echo "⚠️  Código HTTP: $RESPONSE"
fi
echo ""

# 5. Verificar arquivos de rotas
echo "5️⃣  ARQUIVOS DE ROTAS:"
echo "---------------------"
echo "✓ routes/api.php:" $([ -f routes/api.php ] && echo "EXISTE" || echo "NÃO EXISTE")
echo "✓ routes/web.php:" $([ -f routes/web.php ] && echo "EXISTE" || echo "NÃO EXISTE")
echo "✓ routes/groups/api/wallet/deposit.php:" $([ -f routes/groups/api/wallet/deposit.php ] && echo "EXISTE" || echo "NÃO EXISTE")
echo "✓ routes/api_cartwavehub.php:" $([ -f routes/api_cartwavehub.php ] && echo "EXISTE" || echo "NÃO EXISTE")
echo ""

# 6. Verificar se api_cartwavehub está incluído
echo "6️⃣  INCLUSÃO DO CARTWAVEHUB:"
echo "----------------------------"
if grep -q "api_cartwavehub.php" routes/api.php; then
    echo "✅ routes/api.php INCLUI api_cartwavehub.php"
else
    echo "❌ routes/api.php NÃO INCLUI api_cartwavehub.php"
    echo ""
    echo "   💡 Execute este comando para corrigir:"
    echo '   echo "require __DIR__ . '\''/api_cartwavehub.php'\'';" >> routes/api.php'
fi
echo ""

# 7. Cache do Laravel
echo "7️⃣  STATUS DO CACHE:"
echo "--------------------"
if [ -d bootstrap/cache ]; then
    CACHE_FILES=$(ls -1 bootstrap/cache/*.php 2>/dev/null | wc -l)
    echo "Arquivos em bootstrap/cache: $CACHE_FILES"
    if [ $CACHE_FILES -gt 0 ]; then
        echo "⚠️  Recomendado limpar cache: php artisan optimize"
    else
        echo "✅ Cache limpo"
    fi
else
    echo "⚠️  Diretório bootstrap/cache não encontrado"
fi
echo ""

# 8. Permissões
echo "8️⃣  PERMISSÕES:"
echo "--------------"
echo "routes/api.php:" $(stat -c "%a" routes/api.php 2>/dev/null || stat -f "%Lp" routes/api.php 2>/dev/null || echo "N/A")
echo "storage:" $(stat -c "%a" storage 2>/dev/null || stat -f "%Lp" storage 2>/dev/null || echo "N/A")
echo ""

echo "=========================================="
echo "✅ DIAGNÓSTICO CONCLUÍDO"
echo ""
echo "📋 PRÓXIMOS PASSOS:"
echo ""
echo "Se houver rotas faltando:"
echo "  1. php artisan route:clear"
echo "  2. php artisan cache:clear"
echo "  3. php artisan optimize"
echo ""
echo "Se o Cartwavehub não estiver incluído:"
echo '  echo "" >> routes/api.php'
echo '  echo "// Cartwavehub (Cashtime)" >> routes/api.php'
echo '  echo "require __DIR__ . '\''/api_cartwavehub.php'\'';" >> routes/api.php'
echo ""

