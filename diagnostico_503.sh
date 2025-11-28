#!/bin/bash

# Script para diagnosticar erro 503
# Execute via SSH

echo "=== DIAGNÓSTICO DE ERRO 503 ==="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html || {
    echo "❌ Erro: Não foi possível acessar o diretório"
    exit 1
}

echo "1. Load do servidor:"
uptime
echo ""

echo "2. Processos PHP-FPM:"
php_processes=$(ps aux | grep php-fpm | grep -v grep | wc -l)
echo "   Total: $php_processes processos"
if [ "$php_processes" -gt 50 ]; then
    echo "   ⚠️  Muitos processos PHP (pode estar sobrecarregado)"
fi
echo ""

echo "3. Uso de memória:"
free -h | grep -E "Mem|Swap"
echo ""

echo "4. Verificando se API está respondendo:"
api_response=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/api/settings/data 2>/dev/null)
echo "   Status da API: $api_response"
if [ "$api_response" = "503" ]; then
    echo "   ❌ API retornando 503"
elif [ "$api_response" = "200" ]; then
    echo "   ✅ API funcionando"
else
    echo "   ⚠️  API retornando código: $api_response"
fi
echo ""

echo "5. Últimos erros do Laravel relacionados a 503/timeout/memory:"
tail -50 storage/logs/laravel.log | grep -i "503\|timeout\|memory\|fatal\|allowed memory" | tail -10 || echo "   Nenhum erro específico encontrado"
echo ""

echo "6. Verificando limites do PHP:"
php -r "echo '   memory_limit: ' . ini_get('memory_limit') . PHP_EOL;"
php -r "echo '   max_execution_time: ' . ini_get('max_execution_time') . PHP_EOL;"
php -r "echo '   max_input_time: ' . ini_get('max_input_time') . PHP_EOL;"
echo ""

echo "7. Verificando se há processos travados:"
stuck_processes=$(ps aux | grep php | grep -v grep | awk '{if ($3 > 50) print $2 " (" $3 "%)"}' | head -5)
if [ -n "$stuck_processes" ]; then
    echo "   ⚠️  Processos com alto uso de CPU:"
    echo "$stuck_processes" | sed 's/^/      /'
else
    echo "   ✅ Nenhum processo travado detectado"
fi
echo ""

echo "=== RESUMO ==="
echo ""
if [ "$api_response" = "503" ]; then
    echo "❌ PROBLEMA CONFIRMADO: API retornando 503"
    echo ""
    echo "Possíveis soluções:"
    echo "1. Aguardar alguns minutos (pode ser pico de tráfego)"
    echo "2. Verificar logs do servidor web (Apache/Nginx)"
    echo "3. Contatar suporte da hospedagem"
    echo "4. Verificar se há scripts em loop"
else
    echo "✅ API parece estar funcionando agora"
    echo "   O erro pode ter sido temporário"
fi
echo ""

