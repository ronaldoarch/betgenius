#!/bin/bash

# ============================================================
# ✅ FAZER UPLOAD DO INDEX.HTML VIA SSH
# ============================================================

echo "═══════════════════════════════════════════════════════════════"
echo "📤 FAZENDO UPLOAD DO INDEX.HTML"
echo "═══════════════════════════════════════════════════════════════"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Criando index.html em public/..."
cat > public/index.html << 'EOFHTML'
<!DOCTYPE html>
<html lang="pt-BR">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>BetGenius - Cassino Online</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;400;700&display=swap" rel="stylesheet">
    <script type="module" crossorigin src="/assets/index-DrMwNlRZ.js"></script>
    <link rel="stylesheet" crossorigin href="/assets/index-R46pBGYW.css">
  </head>
  <body>
    <div id="root"></div>
  </body>
</html>
EOFHTML

chmod 644 public/index.html
echo "✅ index.html criado!"
echo ""

echo "2️⃣ Verificando se foi criado corretamente..."
if [ -f "public/index.html" ]; then
    echo "✅ index.html existe!"
    ls -lh public/index.html
    echo ""
    echo "Primeiras linhas:"
    head -5 public/index.html
else
    echo "❌ Erro ao criar index.html"
fi
echo ""

echo "3️⃣ Verificando se assets existem..."
if [ -f "public/assets/index-DrMwNlRZ.js" ]; then
    echo "✅ JavaScript encontrado"
    ls -lh public/assets/index-DrMwNlRZ.js
fi
if [ -f "public/assets/index-R46pBGYW.css" ]; then
    echo "✅ CSS encontrado"
    ls -lh public/assets/index-R46pBGYW.css
fi
echo ""

echo "═══════════════════════════════════════════════════════════════"
echo "✅ UPLOAD CONCLUÍDO!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 TESTE AGORA:"
echo "   1. Limpe o cache do navegador (Ctrl+Shift+R)"
echo "   2. Acesse: https://betgeniusbr.com/"
echo "   3. O site React deve carregar!"
echo ""
echo "═══════════════════════════════════════════════════════════════"

