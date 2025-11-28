#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

TOKEN="Yi65LYZGMxNYKOm5VIeisqiDFoV9Z410sAwVn8ydhwksruujPfUTrMK9C7VhNVOM"

echo "🔍 TESTANDO REQUISIÇÃO COM TOKEN JWT"
echo "===================================="
echo ""

# 1. Testar requisição com token
echo "1️⃣ Fazendo requisição com token..."
RESPONSE=$(curl -X POST https://betgeniusbr.com/api/carteira_wallet/deposit/payment \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  -d '{"amount":30,"cpf":"70206292295"}' \
  -w "\n%{http_code}" \
  -s 2>&1)

HTTP_CODE=$(echo "$RESPONSE" | tail -1)
BODY=$(echo "$RESPONSE" | head -n -1)

echo "   HTTP Status: $HTTP_CODE"
echo "   Response:"
echo "$BODY" | head -20
echo ""

# 2. Verificar logs
echo "2️⃣ Verificando logs..."
sleep 1
tail -30 storage/logs/laravel.log | grep -i "JWTMiddleware\|DepositController\|Arkama\|error\|exception" | tail -10 || echo "   Nenhum log relevante encontrado"
echo ""

# 3. Se retornou 200, verificar se tem qrcode
if [ "$HTTP_CODE" = "200" ]; then
    echo "✅ SUCESSO! Requisição funcionou!"
    echo ""
    echo "📋 Resposta completa:"
    echo "$BODY" | python3 -m json.tool 2>/dev/null || echo "$BODY"
elif [ "$HTTP_CODE" = "401" ]; then
    echo "❌ Token inválido ou expirado"
elif [ "$HTTP_CODE" = "500" ]; then
    echo "❌ Erro 500 - Verifique os logs acima"
else
    echo "⚠️  Status inesperado: $HTTP_CODE"
fi

echo ""
echo "✅ TESTE COMPLETO!"
