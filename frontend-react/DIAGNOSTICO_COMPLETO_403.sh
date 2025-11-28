#!/bin/bash

# ============================================================
# ✅ DIAGNÓSTICO COMPLETO - ERRO 403
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 DIAGNÓSTICO COMPLETO - ERRO 403"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando diretório atual..."
pwd
echo ""

echo "2️⃣ Verificando estrutura de diretórios..."
echo "Conteúdo da raiz:"
ls -la | head -15
echo ""

echo "3️⃣ Verificando se public/ existe..."
if [ -d "public" ]; then
    echo "✅ Diretório public/ existe"
    echo "Conteúdo de public/:"
    ls -la public/ | head -15
else
    echo "❌ Diretório public/ NÃO existe!"
fi
echo ""

echo "4️⃣ Verificando arquivos index..."
echo "Na raiz:"
ls -la index.* 2>/dev/null || echo "   Nenhum arquivo index.* na raiz"
echo ""
echo "Em public/:"
ls -la public/index.* 2>/dev/null || echo "   Nenhum arquivo index.* em public/"
echo ""

echo "5️⃣ Verificando .htaccess..."
echo "Na raiz:"
if [ -f ".htaccess" ]; then
    echo "✅ .htaccess existe na raiz"
    echo "Conteúdo:"
    cat .htaccess
else
    echo "❌ .htaccess NÃO existe na raiz"
fi
echo ""
echo "Em public/:"
if [ -f "public/.htaccess" ]; then
    echo "✅ .htaccess existe em public/"
    echo "Conteúdo:"
    cat public/.htaccess
else
    echo "❌ .htaccess NÃO existe em public/"
fi
echo ""

echo "6️⃣ Verificando permissões..."
echo "Permissões da raiz:"
ls -ld . | awk '{print "   " $1 " " $3 " " $4 " " $9}'
echo ""
echo "Permissões de public/:"
ls -ld public/ | awk '{print "   " $1 " " $3 " " $4 " " $9}'
echo ""
echo "Permissões de arquivos importantes:"
ls -l public/index.php public/index.html .htaccess public/.htaccess 2>/dev/null | awk '{print "   " $1 " " $9}'
echo ""

echo "7️⃣ Testando se consegue ler arquivos..."
if [ -f "public/index.php" ]; then
    if [ -r "public/index.php" ]; then
        echo "✅ public/index.php é legível"
    else
        echo "❌ public/index.php NÃO é legível!"
    fi
fi
if [ -f "public/index.html" ]; then
    if [ -r "public/index.html" ]; then
        echo "✅ public/index.html é legível"
    else
        echo "❌ public/index.html NÃO é legível!"
    fi
else
    echo "⚠️  public/index.html não existe"
fi
echo ""

echo "8️⃣ Verificando configuração do PHP..."
php -v | head -1
echo ""

echo "9️⃣ Verificando se o servidor web consegue acessar..."
echo "Testando com PHP:"
php -r "echo 'PHP funciona: ' . (file_exists('public/index.php') ? 'SIM' : 'NÃO') . PHP_EOL;"
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "📋 DIAGNÓSTICO"
echo "═══════════════════════════════════════════════════════════════"
echo ""

PROBLEMAS=0

if [ ! -d "public" ]; then
    echo "❌ PROBLEMA CRÍTICO: Diretório public/ não existe"
    PROBLEMAS=$((PROBLEMAS + 1))
fi

if [ ! -f "public/index.php" ] && [ ! -f "public/index.html" ]; then
    echo "❌ PROBLEMA CRÍTICO: Nenhum arquivo index encontrado em public/"
    PROBLEMAS=$((PROBLEMAS + 1))
fi

if [ -f "index.php" ]; then
    echo "⚠️  AVISO: index.php existe na raiz (pode causar conflito)"
fi

if [ $PROBLEMAS -eq 0 ]; then
    echo "✅ Estrutura de arquivos parece correta"
    echo ""
    echo "⚠️  Se ainda houver erro 403, o problema provavelmente é:"
    echo "   1. Document Root incorreto no hPanel"
    echo "   2. Configuração do servidor web"
    echo ""
    echo "💡 AÇÃO NECESSÁRIA:"
    echo "   Verifique o Document Root no hPanel:"
    echo "   - Deve estar: public_html"
    echo "   - NÃO deve estar: public_html/public"
    echo ""
    echo "   Veja o guia completo em: GUIA_DOCUMENT_ROOT.md"
else
    echo "❌ Encontrados $PROBLEMAS problema(s) crítico(s)"
fi

echo ""
echo "═══════════════════════════════════════════════════════════════"
