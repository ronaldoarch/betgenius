#!/bin/bash

# ============================================================
# ✅ CORRIGIR INDEX.PHP NA RAIZ - NÃO INTERFERIR COM API
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO INDEX.PHP NA RAIZ"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Fazendo backup do index.php na raiz..."
if [ -f "index.php" ]; then
    cp index.php index.php.backup.$(date +%Y%m%d_%H%M%S)
    echo "✅ Backup criado"
else
    echo "⚠️  index.php não existe na raiz"
fi
echo ""

echo "2️⃣ Corrigindo index.php na raiz - não interferir com API..."
cat > index.php << 'EOFINDEX'
<?php
// Se for requisição de API, admin ou storage, redirecionar para public/index.php
$requestUri = $_SERVER['REQUEST_URI'] ?? '/';
if (preg_match('#^/(api|admin|storage)#', $requestUri)) {
    // Redirecionar para public/index.php mantendo o caminho
    $_SERVER['SCRIPT_NAME'] = '/index.php';
    require __DIR__ . '/public/index.php';
    exit;
}

// Caso contrário, servir o index.html do React
$indexPath = __DIR__ . '/public/index.html';
if (file_exists($indexPath)) {
    $content = file_get_contents($indexPath);
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

echo "3️⃣ Verificando .htaccess em public/..."
if [ -f "public/.htaccess" ]; then
    echo "✅ .htaccess existe em public/"
    echo "Verificando se está configurado corretamente:"
    if grep -q "RewriteCond %{REQUEST_URI} ^/api" public/.htaccess; then
        echo "✅ Regra para /api existe"
    else
        echo "⚠️  Regra para /api não encontrada"
    fi
else
    echo "❌ .htaccess não existe em public/"
fi
echo ""

echo "4️⃣ Testando se a API agora retorna JSON..."
echo "  Aguardando 3 segundos para o servidor processar..."
sleep 3
echo ""
echo "  GET /api/games:"
API_RESPONSE=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/games 2>&1 | head -c 500)
if echo "$API_RESPONSE" | grep -q "DOCTYPE\|html"; then
    echo "    ❌ Ainda retornando HTML"
    echo "    Primeiros caracteres:"
    echo "$API_RESPONSE" | head -c 200
    echo "..."
else
    echo "    ✅ Retornando JSON ou dados corretos"
    echo "    Primeiros caracteres:"
    echo "$API_RESPONSE"
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ CORREÇÃO APLICADA!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 TESTE AGORA:"
echo "   1. Limpe o cache do navegador (Ctrl+Shift+R)"
echo "   2. Teste: https://betgeniusbr.com/"
echo "   3. Verifique se os dados estão carregando"
echo ""
echo "═══════════════════════════════════════════════════════════════"

