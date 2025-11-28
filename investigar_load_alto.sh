#!/bin/bash

# Script para investigar o que está causando load alto
# Execute via SSH

echo "=== INVESTIGANDO LOAD ALTO ==="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html || exit 1

echo "1. Top 10 processos usando mais CPU:"
ps aux --sort=-%cpu | head -11 | tail -10
echo ""

echo "2. Top 10 processos usando mais memória:"
ps aux --sort=-%mem | head -11 | tail -10
echo ""

echo "3. Verificando processos PHP em detalhes:"
ps aux | grep -E "php|fpm" | grep -v grep
echo ""

echo "4. Contando processos por tipo:"
echo "   PHP-FPM: $(ps aux | grep php-fpm | grep -v grep | wc -l)"
echo "   PHP CLI: $(ps aux | grep 'php ' | grep -v grep | grep -v fpm | wc -l)"
echo "   Total PHP: $(ps aux | grep php | grep -v grep | wc -l)"
echo ""

echo "5. Verificando se há processos travados (mais de 5 minutos de CPU time):"
ps -eo pid,etime,pcpu,pmem,cmd | grep -E "php|fpm" | awk '{if ($2 ~ /[0-9]+:[0-9]+:[0-9]+/ || $2 ~ /[0-9]+-[0-9]+:[0-9]+/) print $0}'
echo ""

echo "6. Verificando conexões de rede ativas:"
netstat -an | grep :80 | wc -l
echo "   Conexões HTTP ativas"
netstat -an | grep :443 | wc -l
echo "   Conexões HTTPS ativas"
echo ""

echo "7. Verificando se há queries lentas no MySQL:"
mysql -e "SHOW PROCESSLIST;" 2>/dev/null | head -20 || echo "   Não foi possível conectar ao MySQL"
echo ""

echo "=== PRÓXIMOS PASSOS ==="
echo ""
echo "Se encontrar processos PHP travados, pode ser necessário:"
echo "1. Reiniciar PHP-FPM (se tiver permissão)"
echo "2. Contatar suporte da hospedagem"
echo "3. Verificar se há scripts em loop"
echo ""

