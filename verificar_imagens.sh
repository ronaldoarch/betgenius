#!/bin/bash

# Script para verificar se as imagens existem e estão acessíveis
# Execute via SSH: ssh -p 65002 u127271520@betgeniusbr.com

echo "=== VERIFICAÇÃO DE IMAGENS ==="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html || {
    echo "❌ Erro: Não foi possível acessar o diretório"
    exit 1
}

echo "1. Verificando quantas imagens .webp existem..."
webp_count=$(find public/storage -name "*.webp" 2>/dev/null | wc -l)
echo "   📊 Total de arquivos .webp: $webp_count"
echo ""

if [ "$webp_count" -eq 0 ]; then
    echo "   ⚠️  NENHUMA IMAGEM ENCONTRADA!"
    echo ""
    echo "   💡 Você precisa baixar as imagens via admin:"
    echo "      1. Acesse: https://betgeniusbr.com/zirigui"
    echo "      2. Vá em 'Gerenciamento de Jogos'"
    echo "      3. Clique em 'Baixar Imagens' (ou botão similar)"
    echo ""
else
    echo "   ✅ Imagens encontradas!"
    echo ""
    echo "2. Listando algumas imagens de exemplo:"
    find public/storage -name "*.webp" 2>/dev/null | head -5 | while read img; do
        filename=$(basename "$img")
        size=$(stat -c "%s" "$img" 2>/dev/null || stat -f "%z" "$img" 2>/dev/null)
        echo "   - $filename ($size bytes)"
    done
    echo ""
    
    echo "3. Testando acesso a uma imagem..."
    test_file=$(find public/storage -name "*.webp" 2>/dev/null | head -1)
    if [ -n "$test_file" ]; then
        relative_path=${test_file#public/}
        echo "   📸 Testando: $relative_path"
        if [ -f "$test_file" ]; then
            echo "   ✅ Arquivo existe fisicamente"
            echo "   🌐 URL de teste: https://betgeniusbr.com/storage/$(basename "$test_file")"
        fi
    fi
    echo ""
fi

echo "4. Verificando estrutura do storage..."
if [ -d "public/storage" ]; then
    echo "   ✅ Diretório public/storage existe"
    if [ -L "public/storage" ]; then
        echo "   ✅ É um symlink (correto)"
        echo "   🔗 Aponta para: $(readlink -f public/storage)"
    else
        echo "   ⚠️  É um diretório (não symlink) - pode estar OK se as imagens estão lá"
    fi
else
    echo "   ❌ Diretório public/storage NÃO existe!"
fi
echo ""

echo "=== FIM DA VERIFICAÇÃO ==="
echo ""
if [ "$webp_count" -eq 0 ]; then
    echo "⚠️  AÇÃO NECESSÁRIA: Baixe as imagens via admin!"
else
    echo "✅ Imagens encontradas. Verifique no navegador se os erros 503 desapareceram."
fi
echo ""

