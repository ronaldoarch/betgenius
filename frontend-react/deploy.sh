#!/bin/bash

echo "🚀 Iniciando deploy do Frontend React..."
echo ""

# Verificar se está no diretório correto
if [ ! -f "package.json" ]; then
    echo "❌ Erro: Execute este script na pasta frontend-react"
    exit 1
fi

# 1. Instalar dependências (se necessário)
if [ ! -d "node_modules" ]; then
    echo "📦 Instalando dependências..."
    npm install
fi

# 2. Build
echo "🔨 Fazendo build..."
npm run build

if [ ! -d "dist" ]; then
    echo "❌ Erro: Build falhou - pasta dist não encontrada"
    exit 1
fi

echo "✅ Build concluído!"
echo ""
echo "📋 Próximos passos:"
echo "1. Abra o FileZilla"
echo "2. Conecte ao servidor: betgeniusbr.com"
echo "3. Navegue até: /public_html/public/"
echo "4. Crie uma pasta: app (ou outro nome)"
echo "5. Faça upload de TODOS os arquivos de dist/ para app/"
echo ""
echo "📁 Arquivos prontos em: $(pwd)/dist/"
echo "🌐 Após upload, acesse: https://betgeniusbr.com/app/"
echo ""
ls -lh dist/ | head -10
