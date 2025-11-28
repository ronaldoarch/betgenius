#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "🔍 TESTANDO SERVIDOR WEB"
echo "========================"
echo ""

# 1. Verificar DocumentRoot (se possível)
echo "1️⃣ Verificando estrutura de diretórios..."
echo "   DocumentRoot deve apontar para: public_html/public"
ls -la public/index.php 2>/dev/null && echo "   ✅ public/index.php existe" || echo "   ❌ public/index.php NÃO existe"
echo ""

# 2. Testar com domínio completo (HTTPS)
echo "2️⃣ Testando com domínio completo (HTTPS)..."
curl -X POST https://betgeniusbr.com/api/carteira_wallet/deposit/payment \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{"amount":30,"cpf":"70206292295"}' \
  -w "\nHTTP Status: %{http_code}\n" \
  -s 2>&1 | head -30
echo ""

# 3. Testar com domínio completo (HTTP)
echo "3️⃣ Testando com domínio completo (HTTP)..."
curl -X POST http://betgeniusbr.com/api/carteira_wallet/deposit/payment \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{"amount":30,"cpf":"70206292295"}' \
  -w "\nHTTP Status: %{http_code}\n" \
  -s 2>&1 | head -30
echo ""

# 4. Verificar se há arquivo index.php no public
echo "4️⃣ Verificando index.php..."
if [ -f "public/index.php" ]; then
    echo "   ✅ public/index.php existe"
    head -5 public/index.php
else
    echo "   ❌ public/index.php NÃO existe!"
fi
echo ""

# 5. Verificar .htaccess
echo "5️⃣ Verificando .htaccess..."
if [ -f "public/.htaccess" ]; then
    echo "   ✅ public/.htaccess existe"
    cat public/.htaccess
else
    echo "   ❌ public/.htaccess NÃO existe!"
fi
echo ""

# 6. Testar se o Laravel responde via HTTP
echo "6️⃣ Testando rota simples (GET) para verificar se Laravel responde..."
curl -X GET https://betgeniusbr.com/api/promocoes \
  -H "Accept: application/json" \
  -w "\nHTTP Status: %{http_code}\n" \
  -s 2>&1 | head -10
echo ""

echo "✅ TESTE COMPLETO!"
echo ""
echo "📝 INTERPRETAÇÃO:"
echo "   - Se retornou 404: DocumentRoot pode estar errado"
echo "   - Se retornou 401: Requisição chegou no Laravel (middleware bloqueou)"
echo "   - Se retornou HTML: Problema de roteamento"
echo "   - Se retornou JSON: Laravel está funcionando!"
