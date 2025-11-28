#!/bin/bash

# ============================================================
# ✅ DIAGNÓSTICO COMPLETO FINAL - ERRO 403
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 DIAGNÓSTICO COMPLETO FINAL"
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

echo "3️⃣ Verificando public/..."
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

echo "5️⃣ Verificando permissões detalhadas..."
echo "Permissões da raiz:"
ls -ld . | awk '{print "   " $1 " " $3 " " $4 " " $9}'
echo ""
echo "Permissões de public/:"
ls -ld public/ | awk '{print "   " $1 " " $3 " " $4 " " $9}'
echo ""
echo "Permissões de arquivos:"
ls -l public/index.html public/index.php .htaccess public/.htaccess 2>/dev/null | awk '{print "   " $1 " " $9}'
echo ""

echo "6️⃣ Verificando .htaccess..."
echo "Na raiz:"
if [ -f ".htaccess" ]; then
    echo "✅ .htaccess existe"
    echo "Conteúdo:"
    cat .htaccess
else
    echo "❌ .htaccess NÃO existe"
fi
echo ""
echo "Em public/:"
if [ -f "public/.htaccess" ]; then
    echo "✅ .htaccess existe"
    echo "Conteúdo:"
    cat public/.htaccess
else
    echo "❌ .htaccess NÃO existe"
fi
echo ""

echo "7️⃣ Testando acesso a arquivos..."
if [ -f "public/index.html" ]; then
    if [ -r "public/index.html" ]; then
        echo "✅ public/index.html é legível"
        echo "Primeiras linhas:"
        head -3 public/index.html
    else
        echo "❌ public/index.html NÃO é legível!"
    fi
else
    echo "❌ public/index.html NÃO existe!"
fi
echo ""

if [ -f "public/teste.txt" ]; then
    if [ -r "public/teste.txt" ]; then
        echo "✅ public/teste.txt é legível"
        echo "Conteúdo:"
        cat public/teste.txt
    else
        echo "❌ public/teste.txt NÃO é legível!"
    fi
else
    echo "⚠️  public/teste.txt não existe"
fi
echo ""

echo "8️⃣ Verificando se o servidor web consegue acessar..."
echo "Testando com PHP:"
php -r "echo 'PHP funciona: ' . (file_exists('public/index.html') ? 'SIM' : 'NÃO') . PHP_EOL;"
echo ""

echo "9️⃣ Verificando variáveis de ambiente do servidor..."
echo "USER: $USER"
echo "HOME: $HOME"
echo "PWD: $PWD"
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "📋 RESUMO DO DIAGNÓSTICO"
echo "═══════════════════════════════════════════════════════════════"
echo ""

PROBLEMAS=0

if [ ! -d "public" ]; then
    echo "❌ PROBLEMA CRÍTICO: Diretório public/ não existe"
    PROBLEMAS=$((PROBLEMAS + 1))
fi

if [ ! -f "public/index.html" ] && [ ! -f "public/index.php" ]; then
    echo "❌ PROBLEMA CRÍTICO: Nenhum arquivo index encontrado em public/"
    PROBLEMAS=$((PROBLEMAS + 1))
fi

if [ ! -f ".htaccess" ]; then
    echo "⚠️  AVISO: .htaccess não existe na raiz"
fi

if [ ! -f "public/.htaccess" ]; then
    echo "⚠️  AVISO: .htaccess não existe em public/"
fi

if [ -f "index.php" ]; then
    echo "⚠️  AVISO: index.php existe na raiz (pode causar conflito)"
fi

PERM_R=$(ls -ld . | awk '{print $1}' | cut -c1-10)
if [[ ! "$PERM_R" =~ "drwx" ]]; then
    echo "⚠️  AVISO: Permissões da raiz podem estar incorretas"
fi

PERM_P=$(ls -ld public/ | awk '{print $1}' | cut -c1-10)
if [[ ! "$PERM_P" =~ "drwx" ]]; then
    echo "⚠️  AVISO: Permissões de public/ podem estar incorretas"
fi

if [ $PROBLEMAS -eq 0 ]; then
    echo "✅ Estrutura de arquivos parece correta"
    echo ""
    echo "⚠️  Se ainda houver erro 403, o problema provavelmente é:"
    echo "   1. Document Root incorreto no hPanel (MAIS PROVÁVEL)"
    echo "   2. Configuração do servidor web bloqueando acesso"
    echo "   3. Problema com o usuário do servidor web"
    echo ""
    echo "💡 AÇÃO NECESSÁRIA:"
    echo "   Verifique o Document Root no hPanel:"
    echo "   - Deve estar: public_html"
    echo "   - NÃO deve estar: public_html/public"
    echo ""
    echo "   Veja o guia completo em: VERIFICAR_DOCUMENT_ROOT.md"
else
    echo "❌ Encontrados $PROBLEMAS problema(s) crítico(s)"
fi

echo ""
echo "═══════════════════════════════════════════════════════════════"

