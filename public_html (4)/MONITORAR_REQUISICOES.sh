#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "🔍 MONITORANDO REQUISIÇÕES EM TEMPO REAL"
echo "========================================"
echo ""
echo "📝 Instruções:"
echo "1. Deixe este terminal aberto"
echo "2. Abra o site no navegador"
echo "3. Faça login"
echo "4. Tente fazer um depósito"
echo "5. Observe os logs abaixo"
echo ""
echo "Pressione Ctrl+C para parar"
echo ""
echo "========================================"
echo ""

tail -f storage/logs/laravel.log | grep --line-buffered -i "JWTMiddleware\|DepositController\|Arkama\|error\|exception\|Authorization\|Bearer"
