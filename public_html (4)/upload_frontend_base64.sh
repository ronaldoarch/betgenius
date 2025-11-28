#!/bin/bash

# Script para fazer upload do frontend-completo-home.html via SSH usando base64
# Uso: ./upload_frontend_base64.sh

echo "📤 Codificando arquivo em base64..."
base64 -i "/Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/frontend-completo-home.html" > /tmp/frontend_base64.txt

echo "📤 Fazendo upload via SSH..."
ssh u127271520@betgeniusbr.com << 'SSH_EOF'
cd /home/u127271520/domains/betgeniusbr.com/public_html/public

echo "📥 Recebendo arquivo..."
cat > /tmp/frontend_base64.txt << 'BASE64_EOF'
SSH_EOF

cat /tmp/frontend_base64.txt >> upload_frontend_base64.sh

cat >> upload_frontend_base64.sh << 'SCRIPT_EOF'
BASE64_EOF

echo "🔄 Decodificando arquivo..."
base64 -d /tmp/frontend_base64.txt > frontend-completo-home.html
rm /tmp/frontend_base64.txt

echo "✅ Arquivo criado com sucesso!"
echo ""
echo "📋 Verificando arquivo..."
ls -lh frontend-completo-home.html
echo ""
echo "✅ Upload concluído!"
echo "🌐 Acesse: https://betgeniusbr.com/frontend-completo-home.html"
SSH_EOF

rm /tmp/frontend_base64.txt
echo ""
echo "✅ Upload concluído com sucesso!"
