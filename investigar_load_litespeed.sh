#!/bin/bash

# Script para investigar load alto em servidor LiteSpeed
# Execute via SSH

echo "=== INVESTIGANDO LOAD ALTO (LiteSpeed) ==="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html || exit 1

echo "1. Verificando processos lsphp (LiteSpeed PHP):"
ps aux | grep lsphp | grep -v grep
echo "   Total: $(ps aux | grep lsphp | grep -v grep | wc -l) processos"
echo ""

echo "2. Verificando I/O wait (pode causar load alto):"
top -bn1 | head -5
echo ""

echo "3. Verificando conexões HTTP/HTTPS (usando ss):"
ss -tn | grep -E ":80|:443" | wc -l
echo "   Conexões ativas"
echo ""

echo "4. Verificando processos do sistema (top 15):"
ps aux --sort=-%cpu | head -16 | tail -15
echo ""

echo "5. Verificando uso de disco I/O:"
iostat -x 1 2 2>/dev/null | tail -5 || echo "   iostat não disponível"
echo ""

echo "6. Verificando se há muitos processos lsphp em outros diretórios:"
ps aux | grep lsphp | grep -v grep | awk '{print $NF}' | sort | uniq -c | sort -rn | head -10
echo ""

echo "7. Verificando load por core (se disponível):"
nproc 2>/dev/null && echo "   CPUs disponíveis" || echo "   Não foi possível determinar"
echo ""

echo "=== ANÁLISE ==="
echo ""
echo "Se o load está alto mas seus processos têm CPU baixa, pode ser:"
echo "1. I/O wait (disco lento)"
echo "2. Outros usuários no servidor compartilhado"
echo "3. Processos do sistema"
echo "4. Muitas conexões simultâneas"
echo ""

