#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "🔍 VERIFICANDO PERMISSÕES DO LOG"
echo "================================="
echo ""

# 1. Verificar se o arquivo existe
echo "1️⃣ Arquivo de log existe?"
if [ -f "storage/logs/laravel.log" ]; then
    echo "   ✅ SIM"
    ls -la storage/logs/laravel.log
else
    echo "   ❌ NÃO - Criando..."
    touch storage/logs/laravel.log
    chmod 666 storage/logs/laravel.log
    ls -la storage/logs/laravel.log
fi
echo ""

# 2. Verificar permissões do diretório
echo "2️⃣ Permissões do diretório storage/logs:"
ls -ld storage/logs/
echo ""

# 3. Tentar escrever no log
echo "3️⃣ Testando escrita no log..."
php -r "
file_put_contents('storage/logs/laravel.log', '[' . date('Y-m-d H:i:s') . '] TESTE: Permissões OK' . PHP_EOL, FILE_APPEND);
echo '✅ Escrita OK' . PHP_EOL;
" 2>&1

if [ $? -eq 0 ]; then
    echo "   ✅ Permissões OK"
else
    echo "   ❌ Erro ao escrever - Corrigindo permissões..."
    chmod -R 777 storage/logs/
    chown -R $(whoami):$(whoami) storage/logs/ 2>/dev/null || true
fi
echo ""

# 4. Verificar se o log foi escrito
echo "4️⃣ Última linha do log:"
tail -1 storage/logs/laravel.log 2>/dev/null || echo "   Arquivo vazio ou não acessível"
echo ""

echo "✅ VERIFICAÇÃO COMPLETA!"
