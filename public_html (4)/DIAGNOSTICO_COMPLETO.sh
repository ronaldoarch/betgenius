#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "🔍 DIAGNÓSTICO COMPLETO - Por que não aparecem logs?"
echo "====================================================="
echo ""

# 1. Verificar se o arquivo existe e tem o tamanho correto
echo "1️⃣ Verificando arquivo..."
if [ -f "app/Http/Controllers/Api/Wallet/DepositController.php" ]; then
    LINHAS=$(wc -l < app/Http/Controllers/Api/Wallet/DepositController.php)
    echo "   ✅ Arquivo existe: $LINHAS linhas"
    
    # Verificar se tem o log no construtor
    if grep -q "Classe instanciada" app/Http/Controllers/Api/Wallet/DepositController.php; then
        echo "   ✅ Log no construtor encontrado"
    else
        echo "   ❌ Log no construtor NÃO encontrado!"
    fi
else
    echo "   ❌ Arquivo NÃO existe!"
    exit 1
fi
echo ""

# 2. Verificar sintaxe
echo "2️⃣ Verificando sintaxe..."
php -l app/Http/Controllers/Api/Wallet/DepositController.php 2>&1
echo ""

# 3. Verificar se a classe pode ser carregada
echo "3️⃣ Tentando carregar a classe..."
php artisan tinker --execute="
try {
    require_once 'app/Http/Controllers/Api/Wallet/DepositController.php';
    \$controller = new \App\Http\Controllers\Api\Wallet\DepositController();
    echo '✅ Classe carregada e instanciada!' . PHP_EOL;
} catch (\Exception \$e) {
    echo '❌ Erro: ' . \$e->getMessage() . PHP_EOL;
    echo 'Arquivo: ' . \$e->getFile() . PHP_EOL;
    echo 'Linha: ' . \$e->getLine() . PHP_EOL;
}
" 2>&1
echo ""

# 4. Verificar rotas
echo "4️⃣ Verificando rotas..."
php artisan route:list 2>&1 | grep -i "deposit\|payment" | head -10
echo ""

# 5. Verificar se há erro no route:list (VipController)
echo "5️⃣ Verificando erros conhecidos..."
php artisan route:list 2>&1 | grep -i "error\|exception\|VipController" | head -5
echo ""

# 6. Verificar logs recentes
echo "6️⃣ Últimas 30 linhas do log..."
tail -30 storage/logs/laravel.log 2>/dev/null | tail -10
echo ""

# 7. Verificar se há erro no servidor web
echo "7️⃣ Verificando logs do servidor web..."
if [ -f "/var/log/apache2/error.log" ]; then
    tail -5 /var/log/apache2/error.log 2>/dev/null | grep -i "deposit\|payment\|php" || echo "   Nenhum erro recente no Apache"
elif [ -f "/var/log/nginx/error.log" ]; then
    tail -5 /var/log/nginx/error.log 2>/dev/null | grep -i "deposit\|payment\|php" || echo "   Nenhum erro recente no Nginx"
else
    echo "   Logs do servidor web não encontrados"
fi
echo ""

# 8. Testar requisição direta via curl (sem autenticação primeiro)
echo "8️⃣ Testando requisição direta (sem auth)..."
curl -X POST http://localhost/api/carteira_wallet/deposit/payment \
  -H "Content-Type: application/json" \
  -d '{"amount":30,"cpf":"70206292295"}' \
  -v 2>&1 | head -30
echo ""

echo "✅ DIAGNÓSTICO COMPLETO!"
echo ""
echo "📝 Se não apareceu 'Classe instanciada' nos logs, significa que:"
echo "   1. A requisição não está chegando no controller"
echo "   2. O middleware está bloqueando"
echo "   3. Há um erro fatal antes do controller"
