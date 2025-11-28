#!/bin/bash

# Script para fazer upload dos arquivos assets do React

echo "🚀 Fazendo upload dos arquivos assets..."
echo ""

SERVER="u127271520@betgeniusbr.com"
PORT="65002"
REMOTE_PATH="/home/u127271520/domains/betgeniusbr.com/public_html/public/app/assets"
LOCAL_PATH="/Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/frontend-react/dist/assets"

cd "$(dirname "$LOCAL_PATH")/.."

echo "📂 Arquivos locais:"
ls -lh dist/assets/index-*.js dist/assets/index-*.css 2>&1
echo ""

echo "📤 Fazendo upload..."
scp -P $PORT "$LOCAL_PATH/index-DrMwNlRZ.js" "$SERVER:$REMOTE_PATH/" && echo "✅ index-DrMwNlRZ.js enviado" || echo "❌ Erro ao enviar index-DrMwNlRZ.js"
scp -P $PORT "$LOCAL_PATH/index-R46pBGYW.css" "$SERVER:$REMOTE_PATH/" && echo "✅ index-R46pBGYW.css enviado" || echo "❌ Erro ao enviar index-R46pBGYW.css"

echo ""
echo "✅ Upload concluído!"
echo ""
echo "🔧 Ajustar permissões no servidor (via SSH):"
echo "cd /home/u127271520/domains/betgeniusbr.com/public_html/public/app/assets"
echo "chmod 644 index-*.js index-*.css"

