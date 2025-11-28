#!/bin/bash

# Comandos para executar no servidor via SSH
# Você já está conectado, então execute estes comandos:

echo "=== DIAGNÓSTICO DE ERROS 500 ==="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1. Verificando últimos erros no log..."
echo ""
tail -100 storage/logs/laravel.log | grep -A 10 "Exception\|Error" | tail -50
echo ""

echo "2. Verificando se GameController tem tratamento de erro..."
if grep -q "try {" app/Http/Controllers/Api/Games/GameController.php 2>/dev/null; then
    echo "   ✅ GameController tem try/catch"
else
    echo "   ❌ GameController NÃO tem try/catch - precisa atualizar!"
fi
echo ""

echo "3. Verificando sintaxe do GameController..."
php -l app/Http/Controllers/Api/Games/GameController.php
echo ""

echo "4. Verificando quantas imagens existem..."
webp_count=$(find public/storage -name "*.webp" 2>/dev/null | wc -l)
echo "   Total de imagens .webp: $webp_count"
if [ "$webp_count" -eq 0 ]; then
    echo "   ⚠️  NENHUMA IMAGEM - Precisa baixar via admin!"
fi
echo ""

echo "5. Testando se há erros de sintaxe nas rotas..."
php artisan route:list 2>&1 | head -20
echo ""

echo "=== FIM DO DIAGNÓSTICO ==="
echo ""
echo "📋 Próximos passos baseados no resultado acima:"
echo ""

