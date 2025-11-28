#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "═══════════════════════════════════════════════════════════════"
echo "🔧 CORRIGINDO .htaccess - Executar index.php para API"
echo "═══════════════════════════════════════════════════════════════"
echo ""

echo "1️⃣ Corrigindo .htaccess na raiz:"
echo "───────────────────────────────────────────────────────────────"
cp .htaccess .htaccess.backup.$(date +%Y%m%d_%H%M%S) 2>/dev/null

cat > .htaccess << 'EOF'
DirectoryIndex index.php index.html

Options +FollowSymLinks +SymLinksIfOwnerMatch
RewriteEngine On
RewriteBase /

# API, Admin e Storage → Executar index.php na raiz
RewriteCond %{REQUEST_URI} ^/api [NC,OR]
RewriteCond %{REQUEST_URI} ^/admin [NC,OR]
RewriteCond %{REQUEST_URI} ^/storage [NC]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^ index.php [L]

# Arquivos e diretórios existentes → Servir diretamente
RewriteCond %{REQUEST_FILENAME} -f
RewriteRule ^ - [L]

RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]

# Redirecionar tudo mais para public/
RewriteRule ^(.*)$ public/$1 [L]
EOF

chmod 644 .htaccess
echo "✅ .htaccess corrigido!"
echo ""
echo "2️⃣ Verificando conteúdo do .htaccess:"
echo "───────────────────────────────────────────────────────────────"
cat .htaccess
echo ""
echo ""

echo "3️⃣ Limpando log anterior:"
echo "───────────────────────────────────────────────────────────────"
rm -f index_executed.log
echo "✅ Log limpo"
echo ""

echo "4️⃣ Aguardando 3 segundos..."
sleep 3
echo ""

echo "5️⃣ Fazendo requisição para /api/games/all:"
echo "───────────────────────────────────────────────────────────────"
curl -s -H "Accept: application/json" https://betgeniusbr.com/api/games/all > /dev/null
echo "✅ Requisição feita"
echo ""

echo "6️⃣ Verificando se index.php foi executado:"
echo "───────────────────────────────────────────────────────────────"
sleep 2
if [ -f index_executed.log ]; then
    echo "✅ index.php FOI EXECUTADO!"
    cat index_executed.log
    echo ""
    echo "7️⃣ Testando resposta da API:"
    echo "───────────────────────────────────────────────────────────────"
    RESPONSE=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/games/all | head -c 300)
    echo "$RESPONSE"
    if [[ "$RESPONSE" == "{"* ]] || [[ "$RESPONSE" == "["* ]]; then
        echo ""
        echo "   ✅ SUCESSO! Retornou JSON"
    else
        echo ""
        echo "   ❌ Ainda retorna HTML"
    fi
else
    echo "❌ index.php AINDA NÃO FOI EXECUTADO!"
    echo "   Verificando .htaccess novamente..."
    cat .htaccess | grep -A 5 "API, Admin"
fi

echo ""
echo "═══════════════════════════════════════════════════════════════"

