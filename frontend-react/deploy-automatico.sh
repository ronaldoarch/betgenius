#!/bin/bash

echo "🚀 DEPLOY AUTOMÁTICO - Frontend React"
echo "======================================"
echo ""

# Verificar se está no diretório correto
if [ ! -f "package.json" ]; then
    echo "❌ Erro: Execute na pasta frontend-react"
    exit 1
fi

# 1. Build
echo "📦 Fazendo build..."
npm run build

if [ ! -d "dist" ]; then
    echo "❌ Erro: Build falhou"
    exit 1
fi

echo "✅ Build concluído!"
echo ""

# 2. Compactar
echo "📦 Compactando arquivos..."
cd dist
tar -czf ../frontend-react.tar.gz .
cd ..

echo "✅ Arquivos compactados!"
echo ""
echo "📋 PRÓXIMOS PASSOS:"
echo ""
echo "1. Upload do arquivo frontend-react.tar.gz via FileZilla para:"
echo "   /tmp/ no servidor"
echo ""
echo "2. OU execute no servidor via SSH:"
echo ""
echo "   ssh u127271520@betgeniusbr.com"
echo "   cd /home/u127271520/domains/betgeniusbr.com/public_html/public"
echo "   mkdir -p app"
echo "   cd /tmp"
echo "   tar -xzf frontend-react.tar.gz"
echo "   mv * /home/u127271520/domains/betgeniusbr.com/public_html/public/app/"
echo "   chmod -R 755 /home/u127271520/domains/betgeniusbr.com/public_html/public/app"
echo ""
echo "3. Acesse: https://betgeniusbr.com/app/"
echo ""
echo "📁 Arquivo pronto: frontend-react.tar.gz"
ls -lh frontend-react.tar.gz
