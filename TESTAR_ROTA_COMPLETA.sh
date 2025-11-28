#!/bin/bash

echo "🧪 TESTANDO ROTA ARKAMA COM URL COMPLETA"
echo "========================================"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Testando com URL completa do site..."
curl -X POST https://betgeniusbr.com/arkama/webhook \
  -H "Content-Type: application/json" \
  -d '{"id": "test123", "status": "pending", "external_id": "DEP-1-123"}' \
  -v 2>&1 | grep -E "HTTP|message|error" | head -10

echo ""
echo ""
echo "2️⃣ Verificando se precisa estar em routes/api.php..."
echo "   Vou adicionar a rota também em routes/api.php para garantir"

echo ""
echo "3️⃣ Verificando se outras rotas de webhook funcionam..."
curl -X POST https://betgeniusbr.com/cartwavehub/callback \
  -H "Content-Type: application/json" \
  -d '{"test": "data"}' \
  -v 2>&1 | grep -E "HTTP|404|200" | head -5

echo ""
echo "============================"
echo "✅ TESTE CONCLUÍDO!"

