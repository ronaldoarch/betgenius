#!/bin/bash

# ============================================================
# ✅ VERIFICAR E CORRIGIR TUDO - ERRO 403
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔍 VERIFICAÇÃO COMPLETA - ERRO 403"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando estrutura de diretórios..."
echo "Diretório atual:"
pwd
echo ""
echo "Conteúdo da raiz:"
ls -la | head -15
echo ""

echo "2️⃣ Verificando se public/index.php existe..."
if [ -f "public/index.php" ]; then
    echo "✅ public/index.php existe"
    ls -la public/index.php
    echo ""
    echo "Primeiras linhas do arquivo:"
    head -5 public/index.php
else
    echo "❌ public/index.php NÃO existe!"
    echo "⚠️  PROBLEMA GRAVE: O arquivo index.php não existe em public/"
fi
echo ""

echo "3️⃣ Verificando index.php na raiz..."
if [ -f "index.php" ]; then
    echo "⚠️  index.php existe na raiz (pode causar conflito)"
    echo "Primeiras linhas:"
    head -5 index.php
    echo ""
    echo "💡 RECOMENDAÇÃO: Remover este arquivo"
else
    echo "✅ Não há index.php na raiz (correto)"
fi
echo ""

echo "4️⃣ Verificando .htaccess na raiz..."
if [ -f ".htaccess" ]; then
    echo "✅ .htaccess existe na raiz"
    echo "Conteúdo:"
    cat .htaccess
else
    echo "❌ .htaccess NÃO existe na raiz!"
    echo "💡 RECOMENDAÇÃO: Criar .htaccess"
fi
echo ""

echo "5️⃣ Verificando .htaccess em public/..."
if [ -f "public/.htaccess" ]; then
    echo "✅ .htaccess existe em public/"
    echo "Conteúdo:"
    cat public/.htaccess
else
    echo "❌ .htaccess NÃO existe em public/!"
    echo "💡 RECOMENDAÇÃO: Criar .htaccess"
fi
echo ""

echo "6️⃣ Verificando permissões..."
echo "Permissões da raiz:"
ls -ld . | awk '{print "  " $1 " " $3 " " $4}'
echo ""
echo "Permissões de public/:"
ls -ld public/ | awk '{print "  " $1 " " $3 " " $4}'
echo ""
echo "Permissões de public/index.php:"
ls -l public/index.php 2>/dev/null | awk '{print "  " $1 " " $3 " " $4}' || echo "  Arquivo não encontrado"
echo ""

echo "7️⃣ Verificando se consegue ler public/index.php..."
if [ -f "public/index.php" ]; then
    if [ -r "public/index.php" ]; then
        echo "✅ Arquivo é legível"
    else
        echo "❌ Arquivo NÃO é legível!"
        echo "💡 RECOMENDAÇÃO: Ajustar permissões (chmod 644 public/index.php)"
    fi
else
    echo "❌ Arquivo não existe"
fi
echo ""

echo "8️⃣ Verificando configuração do PHP..."
php -v | head -1
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "📋 DIAGNÓSTICO"
echo "═══════════════════════════════════════════════════════════════"
echo ""

# Verificar problemas comuns
PROBLEMAS=0

if [ ! -f "public/index.php" ]; then
    echo "❌ PROBLEMA: public/index.php não existe"
    PROBLEMAS=$((PROBLEMAS + 1))
fi

if [ -f "index.php" ]; then
    echo "⚠️  AVISO: index.php existe na raiz (pode causar conflito)"
fi

if [ ! -f ".htaccess" ]; then
    echo "❌ PROBLEMA: .htaccess não existe na raiz"
    PROBLEMAS=$((PROBLEMAS + 1))
fi

if [ ! -f "public/.htaccess" ]; then
    echo "❌ PROBLEMA: .htaccess não existe em public/"
    PROBLEMAS=$((PROBLEMAS + 1))
fi

echo ""
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
    echo "❌ Encontrados $PROBLEMAS problema(s) na estrutura de arquivos"
    echo ""
    echo "💡 Execute o script de correção:"
    echo "   ./SOLUCAO_DEFINITIVA_403.sh"
fi

echo ""
echo "═══════════════════════════════════════════════════════════════"

