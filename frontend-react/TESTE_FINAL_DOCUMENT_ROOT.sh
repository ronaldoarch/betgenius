#!/bin/bash

# ============================================================
# ✅ TESTE FINAL - VERIFICAR DOCUMENT ROOT REAL
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 TESTE FINAL - VERIFICAR DOCUMENT ROOT REAL"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Criando arquivo de teste na raiz..."
echo "TESTE RAIZ" > teste_raiz.txt
chmod 644 teste_raiz.txt
echo "✅ Arquivo teste_raiz.txt criado na raiz"
echo ""

echo "2️⃣ Criando arquivo de teste em public/..."
echo "TESTE PUBLIC" > public/teste_public.txt
chmod 644 public/teste_public.txt
echo "✅ Arquivo teste_public.txt criado em public/"
echo ""

echo "3️⃣ Testando acesso aos arquivos via HTTP..."
echo ""
echo "Testando: https://betgeniusbr.com/teste_raiz.txt"
STATUS1=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/teste_raiz.txt)
echo "   Status: $STATUS1"
if [ "$STATUS1" = "200" ]; then
    echo "   ✅ Arquivo na raiz é acessível - Document Root está em public_html"
elif [ "$STATUS1" = "404" ]; then
    echo "   ❌ Arquivo na raiz NÃO é acessível - Document Root pode estar em public_html/public"
else
    echo "   ⚠️  Status: $STATUS1"
fi
echo ""

echo "Testando: https://betgeniusbr.com/teste_public.txt"
STATUS2=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/teste_public.txt)
echo "   Status: $STATUS2"
if [ "$STATUS2" = "200" ]; then
    echo "   ✅ Arquivo em public/ é acessível"
elif [ "$STATUS2" = "404" ]; then
    echo "   ❌ Arquivo em public/ NÃO é acessível"
else
    echo "   ⚠️  Status: $STATUS2"
fi
echo ""

echo "Testando: https://betgeniusbr.com/public/teste_public.txt"
STATUS3=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/public/teste_public.txt)
echo "   Status: $STATUS3"
if [ "$STATUS3" = "200" ]; then
    echo "   ✅ Arquivo via /public/ é acessível"
elif [ "$STATUS3" = "404" ]; then
    echo "   ❌ Arquivo via /public/ NÃO é acessível"
else
    echo "   ⚠️  Status: $STATUS3"
fi
echo ""

echo "Testando: https://betgeniusbr.com/"
STATUS4=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/)
echo "   Status: $STATUS4"
if [ "$STATUS4" = "200" ]; then
    echo "   ✅ Raiz está funcionando!"
elif [ "$STATUS4" = "403" ]; then
    echo "   ❌ Raiz retorna 403"
else
    echo "   ⚠️  Status: $STATUS4"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "📋 DIAGNÓSTICO FINAL"
echo "═══════════════════════════════════════════════════════════════"
echo ""

if [ "$STATUS1" = "200" ] && [ "$STATUS4" = "403" ]; then
    echo "⚠️  Document Root está em public_html, mas a raiz retorna 403"
    echo "   Isso pode indicar:"
    echo "   - Problema com o .htaccess processando a raiz"
    echo "   - Problema de permissões"
    echo "   - Configuração do servidor bloqueando acesso à raiz"
elif [ "$STATUS1" = "404" ] && [ "$STATUS3" = "200" ]; then
    echo "⚠️  Document Root está em public_html/public"
    echo "   Arquivos na raiz não são acessíveis, mas via /public/ sim"
    echo "   SOLUÇÃO: Contate suporte para alterar Document Root para public_html"
elif [ "$STATUS4" = "200" ]; then
    echo "✅ TUDO FUNCIONANDO!"
    echo "   O site está carregando corretamente!"
else
    echo "⚠️  Situação não identificada. Verifique os status acima."
fi

echo ""
echo "═══════════════════════════════════════════════════════════════"

