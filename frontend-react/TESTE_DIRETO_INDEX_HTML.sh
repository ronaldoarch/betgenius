#!/bin/bash

# ============================================================
# ✅ TESTE DIRETO - VERIFICAR SE INDEX.HTML É ACESSÍVEL
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 TESTE DIRETO - VERIFICAR ACESSO AO INDEX.HTML"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando se index.html existe e é legível..."
if [ -f "public/index.html" ] && [ -r "public/index.html" ]; then
    echo "✅ index.html existe e é legível"
    ls -lh public/index.html
else
    echo "❌ index.html não existe ou não é legível!"
    exit 1
fi
echo ""

echo "2️⃣ Testando acesso direto via curl..."
echo "Testando: https://betgeniusbr.com/public/index.html"
curl -I https://betgeniusbr.com/public/index.html 2>&1 | head -5
echo ""

echo "3️⃣ Testando acesso à raiz..."
echo "Testando: https://betgeniusbr.com/"
curl -I https://betgeniusbr.com/ 2>&1 | head -5
echo ""

echo "4️⃣ Verificando se o servidor está seguindo o .htaccess..."
echo "Testando: https://betgeniusbr.com/teste.txt"
curl -I https://betgeniusbr.com/teste.txt 2>&1 | head -5
echo ""

echo "5️⃣ Verificando permissões detalhadas..."
echo "Permissões de public/:"
ls -ld public/ | awk '{print "   " $1 " " $3 " " $4}'
echo ""
echo "Permissões de index.html:"
ls -l public/index.html | awk '{print "   " $1 " " $3 " " $4}'
echo ""

echo "6️⃣ Verificando se há algum arquivo .htaccess bloqueando..."
if [ -f ".htaccess" ]; then
    echo "✅ .htaccess na raiz existe"
    echo "Verificando se há regras que possam bloquear:"
    grep -i "deny\|forbidden\|403" .htaccess || echo "   Nenhuma regra de bloqueio encontrada"
fi
echo ""

if [ -f "public/.htaccess" ]; then
    echo "✅ .htaccess em public/ existe"
    echo "Verificando se há regras que possam bloquear:"
    grep -i "deny\|forbidden\|403" public/.htaccess || echo "   Nenhuma regra de bloqueio encontrada"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "📋 DIAGNÓSTICO"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "Se o curl retornar 403 para /public/index.html mas 200 para /teste.txt:"
echo "   → O problema é que o Document Root está apontando para public_html/public"
echo ""
echo "Se o curl retornar 403 para tudo:"
echo "   → O problema pode ser configuração do servidor ou permissões"
echo ""
echo "Se o curl retornar 200 para /public/index.html:"
echo "   → O problema é o .htaccess não redirecionando corretamente"
echo ""
echo "═══════════════════════════════════════════════════════════════"

