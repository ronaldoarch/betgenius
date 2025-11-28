#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

TOKEN="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vYmV0Z2VuaXVzYnIuY29tIiwiaWF0IjoxNzY0MjgxMTIxLCJleHAiOjE3NjQyODQ3MjEsIm5iZiI6MTc2NDI4MTEyMSwianRpIjoiaGYxRGdPbkRjOWZQaEFhcyIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.h-4Qx7vngBfhLJEmEbmNb2lqCBlbceWib5ata7MiIZk"

echo "🧪 TESTANDO COM TOKEN VÁLIDO"
echo "============================="
echo ""

# 1. Fazer requisição
echo "1️⃣ Fazendo requisição com token válido..."
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
echo ""
echo "   Response:"
echo "$BODY" | head -30
echo ""

# 2. Verificar logs
echo "2️⃣ Verificando logs..."
sleep 1
tail -50 storage/logs/laravel.log | grep -i "JWTMiddleware\|DepositController\|Arkama\|error\|exception" | tail -15 || echo "   Nenhum log relevante encontrado"
echo ""

# 3. Interpretar resultado
if [ "$HTTP_CODE" = "200" ]; then
    echo "✅ SUCESSO! Requisição funcionou!"
    echo ""
    # Verificar se tem qrcode na resposta
    if echo "$BODY" | grep -q "qrcode"; then
        echo "✅ QR Code encontrado na resposta!"
    fi
elif [ "$HTTP_CODE" = "401" ]; then
    echo "❌ Token ainda está sendo rejeitado"
    echo "   Verifique os logs acima"
elif [ "$HTTP_CODE" = "500" ]; then
    echo "❌ Erro 500 - Verifique os logs acima"
else
    echo "⚠️  Status inesperado: $HTTP_CODE"
fi

echo ""
echo "✅ TESTE COMPLETO!"
