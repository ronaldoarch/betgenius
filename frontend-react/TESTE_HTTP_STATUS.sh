#!/bin/bash

# ============================================================
# ✅ TESTE HTTP STATUS - VER CÓDIGOS DE RESPOSTA
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 TESTE HTTP STATUS"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Testando acesso direto ao index.html..."
STATUS1=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/public/index.html)
echo "   URL: https://betgeniusbr.com/public/index.html"
echo "   Status HTTP: $STATUS1"
if [ "$STATUS1" = "200" ]; then
    echo "   ✅ SUCESSO - Arquivo acessível"
elif [ "$STATUS1" = "403" ]; then
    echo "   ❌ ERRO 403 - Acesso negado"
elif [ "$STATUS1" = "404" ]; then
    echo "   ❌ ERRO 404 - Arquivo não encontrado"
else
    echo "   ⚠️  Status: $STATUS1"
fi
echo ""

echo "2️⃣ Testando acesso à raiz..."
STATUS2=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/)
echo "   URL: https://betgeniusbr.com/"
echo "   Status HTTP: $STATUS2"
if [ "$STATUS2" = "200" ]; then
    echo "   ✅ SUCESSO - Site carregando"
elif [ "$STATUS2" = "403" ]; then
    echo "   ❌ ERRO 403 - Acesso negado"
elif [ "$STATUS2" = "404" ]; then
    echo "   ❌ ERRO 404 - Página não encontrada"
else
    echo "   ⚠️  Status: $STATUS2"
fi
echo ""

echo "3️⃣ Testando teste.txt..."
STATUS3=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/teste.txt)
echo "   URL: https://betgeniusbr.com/teste.txt"
echo "   Status HTTP: $STATUS3"
if [ "$STATUS3" = "200" ]; then
    echo "   ✅ SUCESSO - Arquivo acessível"
elif [ "$STATUS3" = "403" ]; then
    echo "   ❌ ERRO 403 - Acesso negado"
elif [ "$STATUS3" = "404" ]; then
    echo "   ❌ ERRO 404 - Arquivo não encontrado"
else
    echo "   ⚠️  Status: $STATUS3"
fi
echo ""

echo "4️⃣ Testando assets..."
STATUS4=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/assets/index-DrMwNlRZ.js)
echo "   URL: https://betgeniusbr.com/assets/index-DrMwNlRZ.js"
echo "   Status HTTP: $STATUS4"
if [ "$STATUS4" = "200" ]; then
    echo "   ✅ SUCESSO - Asset acessível"
elif [ "$STATUS4" = "403" ]; then
    echo "   ❌ ERRO 403 - Acesso negado"
elif [ "$STATUS4" = "404" ]; then
    echo "   ❌ ERRO 404 - Asset não encontrado"
else
    echo "   ⚠️  Status: $STATUS4"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "📋 DIAGNÓSTICO"
echo "═══════════════════════════════════════════════════════════════"
echo ""

if [ "$STATUS3" = "200" ] && [ "$STATUS2" = "403" ]; then
    echo "⚠️  PROBLEMA IDENTIFICADO:"
    echo "   - teste.txt funciona (200)"
    echo "   - Raiz retorna 403"
    echo ""
    echo "   Isso indica que o Document Root está em public_html/public"
    echo "   O servidor consegue acessar arquivos em public/, mas não"
    echo "   consegue processar o .htaccess na raiz para redirecionar."
    echo ""
    echo "   SOLUÇÃO: Alterar Document Root no hPanel para: public_html"
elif [ "$STATUS1" = "200" ] && [ "$STATUS2" = "403" ]; then
    echo "⚠️  PROBLEMA IDENTIFICADO:"
    echo "   - /public/index.html funciona (200)"
    echo "   - Raiz retorna 403"
    echo ""
    echo "   Isso indica que o .htaccess não está redirecionando corretamente."
    echo "   O Document Root pode estar correto, mas o .htaccess precisa"
    echo "   ser verificado."
elif [ "$STATUS2" = "403" ] && [ "$STATUS1" = "403" ] && [ "$STATUS3" = "403" ]; then
    echo "⚠️  PROBLEMA IDENTIFICADO:"
    echo "   - Todos os acessos retornam 403"
    echo ""
    echo "   Isso pode indicar:"
    echo "   1. Document Root incorreto"
    echo "   2. Permissões incorretas"
    echo "   3. Configuração do servidor bloqueando acesso"
    echo ""
    echo "   SOLUÇÃO: Verificar Document Root no hPanel"
elif [ "$STATUS2" = "200" ]; then
    echo "✅ TUDO FUNCIONANDO!"
    echo "   O site está carregando corretamente!"
else
    echo "⚠️  Situação não identificada. Verifique os status acima."
fi

echo ""
echo "═══════════════════════════════════════════════════════════════"

