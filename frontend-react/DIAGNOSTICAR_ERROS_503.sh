#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 DIAGNÓSTICO: ERROS 503"
echo "═══════════════════════════════════════════════════════════════"
echo ""

# 1. Testar endpoint de login
echo "=== 1. Testando endpoint /api/auth/login ==="
curl -s -I -X POST "https://betgeniusbr.com/api/auth/login" | head -5
echo ""

# 2. Verificar se há problemas com imagens de jogos
echo "=== 2. Testando uma imagem de jogo ==="
curl -s -I "https://betgeniusbr.com/storage/Games/Pragmatic_Oficial/vs10amm.webp" | head -5
echo ""

# 3. Verificar se o diretório de jogos existe
echo "=== 3. Verificando diretório de jogos ==="
if [ -d "storage/app/public/Games" ]; then
    echo "✅ Diretório Games existe"
    ls -la storage/app/public/Games/ | head -5
else
    echo "❌ Diretório Games NÃO existe"
fi
echo ""

# 4. Verificar permissões do storage
echo "=== 4. Verificando permissões ==="
ls -ld storage/app/public
ls -ld storage/app/public/Games 2>/dev/null || echo "Diretório Games não existe"
echo ""

# 5. Verificar se há problemas com o .htaccess
echo "=== 5. Verificando .htaccess na raiz ==="
grep -A 5 "storage" .htaccess | head -10
echo ""

# 6. Testar se o problema é timeout
echo "=== 6. Testando timeout ==="
timeout 5 curl -s -I "https://betgeniusbr.com/api/auth/login" 2>&1 | head -3
echo ""

echo "✅ Diagnóstico concluído!"

