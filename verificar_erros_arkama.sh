#!/bin/bash

echo "🔍 VERIFICANDO ERROS RECENTES NO LOG"
echo "====================================="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "📋 Últimos 50 erros do Laravel:"
echo ""

# Buscar erros recentes
tail -n 200 storage/logs/laravel.log | grep -A 10 -B 5 -i "error\|exception\|fatal" | tail -n 100

echo ""
echo "====================================="
echo ""

echo "🔍 Erros específicos do Arkama:"
tail -n 500 storage/logs/laravel.log | grep -i "arkama" | tail -n 20

echo ""
echo "====================================="
echo ""

echo "✅ Verificação concluída!"

