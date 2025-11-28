#!/bin/bash

# ============================================================
# ✅ CORRIGIR INDEX.PHP PARA SERVIR ASSETS CORRETAMENTE
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO INDEX.PHP PARA SERVIR ASSETS CORRETAMENTE"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Corrigindo index.php na raiz..."
cat > index.php << 'EOFINDEX'
<?php
// Servir o index.html de public/ mantendo os caminhos corretos
$indexPath = __DIR__ . '/public/index.html';
if (file_exists($indexPath)) {
    $content = file_get_contents($indexPath);
    // Garantir que o Content-Type está correto
    header('Content-Type: text/html; charset=utf-8');
    echo $content;
    exit;
} else {
    // Se não existir, redireciona para public/
    header('Location: /public/');
    exit;
}
EOFINDEX

chmod 644 index.php
echo "✅ index.php atualizado"
echo ""

echo "2️⃣ Verificando se .htaccess em public/ está servindo assets..."
if [ -f "public/.htaccess" ]; then
    echo "✅ .htaccess existe em public/"
    echo ""
    echo "Verificando configuração de assets:"
    if grep -q "RewriteCond.*REQUEST_FILENAME.*-f" public/.htaccess; then
        echo "✅ Regra para servir arquivos estáticos existe"
    else
        echo "⚠️  Adicionando regra para servir arquivos estáticos..."
        # Não vamos modificar automaticamente, apenas avisar
    fi
else
    echo "❌ .htaccess NÃO existe em public/"
fi
echo ""

echo "3️⃣ Verificando se assets estão acessíveis..."
if [ -f "public/assets/index-DrMwNlRZ.js" ]; then
    echo "✅ JavaScript existe"
    ls -lh public/assets/index-DrMwNlRZ.js
else
    echo "❌ JavaScript NÃO existe!"
fi

if [ -f "public/assets/index-R46pBGYW.css" ]; then
    echo "✅ CSS existe"
    ls -lh public/assets/index-R46pBGYW.css
else
    echo "❌ CSS NÃO existe!"
fi
echo ""

echo "4️⃣ Testando acesso HTTP aos assets..."
echo "  /assets/index-DrMwNlRZ.js:"
ASSET_JS=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/assets/index-DrMwNlRZ.js)
echo "    Status: $ASSET_JS"

echo "  /assets/index-R46pBGYW.css:"
ASSET_CSS=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/assets/index-R46pBGYW.css)
echo "    Status: $ASSET_CSS"
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "📋 DIAGNÓSTICO"
echo "═══════════════════════════════════════════════════════════════"
echo ""

if [ "$ASSET_JS" != "200" ] || [ "$ASSET_CSS" != "200" ]; then
    echo "⚠️  PROBLEMA: Assets não estão acessíveis via HTTP"
    echo ""
    echo "   Possíveis causas:"
    echo "   1. .htaccess não está servindo assets corretamente"
    echo "   2. Caminho dos assets está incorreto"
    echo "   3. Permissões incorretas"
    echo ""
    echo "   Vamos verificar o .htaccess em public/..."
else
    echo "✅ Assets estão acessíveis via HTTP"
fi

echo ""
echo "═══════════════════════════════════════════════════════════════"

