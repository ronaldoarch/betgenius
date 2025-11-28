#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "🔍 DIAGNÓSTICO: Requisição não chega no Laravel"
echo "================================================"
echo ""

# 1. Verificar se o arquivo do middleware foi atualizado
echo "1️⃣ Verificando middleware atualizado..."
if grep -q "JWTMiddleware.*Verificando autenticação" app/Http/Middleware/JwtMiddleWare.php 2>/dev/null; then
    echo "   ✅ Middleware tem logs adicionados"
else
    echo "   ❌ Middleware NÃO foi atualizado!"
    echo "   Execute: fazer upload do arquivo JwtMiddleWare.php"
fi
echo ""

# 2. Verificar logs do servidor web (Apache/Nginx/LiteSpeed)
echo "2️⃣ Verificando logs do servidor web..."
if [ -f "/usr/local/lsws/logs/error.log" ]; then
    echo "   📋 LiteSpeed error.log (últimas 5 linhas):"
    tail -5 /usr/local/lsws/logs/error.log 2>/dev/null | grep -i "deposit\|payment\|php\|error" || echo "   Nenhum erro relacionado encontrado"
elif [ -f "/var/log/apache2/error.log" ]; then
    echo "   📋 Apache error.log (últimas 5 linhas):"
    tail -5 /var/log/apache2/error.log 2>/dev/null | grep -i "deposit\|payment\|php\|error" || echo "   Nenhum erro relacionado encontrado"
elif [ -f "/var/log/nginx/error.log" ]; then
    echo "   📋 Nginx error.log (últimas 5 linhas):"
    tail -5 /var/log/nginx/error.log 2>/dev/null | grep -i "deposit\|payment\|php\|error" || echo "   Nenhum erro relacionado encontrado"
else
    echo "   ⚠️  Logs do servidor web não encontrados nos locais padrão"
fi
echo ""

# 3. Testar requisição direta via curl (localhost)
echo "3️⃣ Testando requisição direta (localhost)..."
curl -X POST http://localhost/api/carteira_wallet/deposit/payment \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{"amount":30,"cpf":"70206292295"}' \
  -w "\nHTTP Status: %{http_code}\n" \
  -s 2>&1 | tail -10
echo ""

# 4. Testar requisição com domínio completo
echo "4️⃣ Testando requisição com domínio completo..."
curl -X POST https://betgeniusbr.com/api/carteira_wallet/deposit/payment \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{"amount":30,"cpf":"70206292295"}' \
  -w "\nHTTP Status: %{http_code}\n" \
  -s 2>&1 | tail -10
echo ""

# 5. Verificar se a rota está registrada
echo "5️⃣ Verificando se a rota está registrada..."
php artisan route:list 2>&1 | grep -i "deposit/payment" | head -3
echo ""

# 6. Verificar logs do Laravel (últimas 20 linhas)
echo "6️⃣ Últimas 20 linhas do laravel.log..."
tail -20 storage/logs/laravel.log 2>/dev/null | tail -10
echo ""

# 7. Verificar se há arquivo .htaccess
echo "7️⃣ Verificando .htaccess..."
if [ -f "public/.htaccess" ]; then
    echo "   ✅ .htaccess existe"
    echo "   Primeiras 10 linhas:"
    head -10 public/.htaccess
else
    echo "   ❌ .htaccess NÃO existe!"
fi
echo ""

# 8. Verificar permissões
echo "8️⃣ Verificando permissões..."
ls -la storage/logs/laravel.log 2>/dev/null | head -1
echo ""

echo "✅ DIAGNÓSTICO COMPLETO!"
echo ""
echo "📝 INTERPRETAÇÃO:"
echo "   - Se curl retornou 404: Rota não encontrada"
echo "   - Se curl retornou 500: Erro no servidor (ver logs do servidor web)"
echo "   - Se curl retornou 401: Middleware bloqueou (deve aparecer log)"
echo "   - Se curl retornou HTML: Problema de roteamento"
echo "   - Se não apareceu NENHUM log: Requisição não chegou no Laravel"
