#!/bin/bash

# 🚀 Script de Deploy - Transformar React no Site Principal
# Este script automatiza o processo de deploy do React para a raiz do site

echo "🚀 Iniciando deploy do React como site principal..."
echo ""

# Cores para output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Verificar se está no diretório correto
if [ ! -f "package.json" ]; then
    echo -e "${RED}❌ Erro: Execute este script na pasta frontend-react${NC}"
    exit 1
fi

# 1. Verificar se o build está atualizado
echo -e "${YELLOW}📦 Verificando build...${NC}"
if [ ! -d "dist" ] || [ -z "$(ls -A dist)" ]; then
    echo -e "${YELLOW}⚠️  Pasta dist/ vazia ou não existe. Fazendo build...${NC}"
    npm run build
    if [ $? -ne 0 ]; then
        echo -e "${RED}❌ Erro ao fazer build!${NC}"
        exit 1
    fi
else
    echo -e "${GREEN}✅ Build encontrado${NC}"
    read -p "Deseja fazer um novo build? (s/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Ss]$ ]]; then
        npm run build
        if [ $? -ne 0 ]; then
            echo -e "${RED}❌ Erro ao fazer build!${NC}"
            exit 1
        fi
    fi
fi

echo ""
echo -e "${GREEN}✅ Build pronto!${NC}"
echo ""
echo "📋 Próximos passos:"
echo ""
echo "1. Conecte ao servidor via FileZilla ou SSH"
echo "2. Navegue até: /home/u127271520/domains/betgeniusbr.com/public_html/public/"
echo "3. Faça backup dos arquivos atuais:"
echo "   - cp index.php index.php.backup"
echo "   - cp .htaccess .htaccess.backup"
echo ""
echo "4. Upload dos arquivos do React:"
echo "   - Upload: dist/index.html → public/index.html"
echo "   - Upload: dist/assets/* → public/assets/*"
echo "   - Upload: .htaccess-react-root → public/.htaccess"
echo ""
echo "5. No servidor, execute:"
echo "   cd /home/u127271520/domains/betgeniusbr.com/public_html/public"
echo "   cp index.php index_laravel.php"
echo ""
echo "6. Teste:"
echo "   - https://betgeniusbr.com/ → Deve mostrar o React"
echo "   - https://betgeniusbr.com/api/ → Deve funcionar (Laravel)"
echo "   - https://betgeniusbr.com/admin/ → Deve funcionar (Admin)"
echo ""
echo -e "${GREEN}✅ Arquivos prontos em: dist/${NC}"
echo ""
echo "📁 Arquivos para upload:"
ls -lh dist/ | head -5
echo ""

