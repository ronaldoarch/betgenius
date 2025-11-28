#!/bin/bash

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "🔍 TESTANDO SISTEMA DE LOGS"
echo "============================"
echo ""

# 1. Testar Log::info diretamente
echo "1️⃣ Testando Log::info diretamente..."
php artisan tinker --execute="
\Illuminate\Support\Facades\Log::info('[TESTE] Log::info funcionando');
echo '✅ Log::info executado' . PHP_EOL;
" 2>&1

sleep 1

echo "   Verificando se apareceu no log:"
tail -5 storage/logs/laravel.log | grep -i "TESTE" || echo "   ⚠️  Não apareceu no log"
echo ""

# 2. Verificar configuração de logs
echo "2️⃣ Verificando configuração de logs..."
php artisan tinker --execute="
\$config = config('logging.default');
echo 'Canal padrão: ' . \$config . PHP_EOL;
\$channels = config('logging.channels');
if (isset(\$channels['single'])) {
    echo 'Canal single configurado: ' . (\$channels['single']['path'] ?? 'não definido') . PHP_EOL;
}
" 2>&1
echo ""

# 3. Verificar se o arquivo de log está sendo usado
echo "3️⃣ Verificando arquivo de log..."
ls -la storage/logs/laravel.log
echo "   Última modificação:"
stat -c %y storage/logs/laravel.log 2>/dev/null || stat -f "%Sm" storage/logs/laravel.log 2>/dev/null || echo "   Não foi possível verificar"
echo ""

# 4. Testar escrever diretamente no arquivo
echo "4️⃣ Testando escrita direta no arquivo..."
php -r "
\$logFile = 'storage/logs/laravel.log';
\$message = '[' . date('Y-m-d H:i:s') . '] TESTE_DIRETO: Escrita direta OK' . PHP_EOL;
file_put_contents(\$logFile, \$message, FILE_APPEND);
echo '✅ Escrita direta OK' . PHP_EOL;
" 2>&1

tail -1 storage/logs/laravel.log
echo ""

# 5. Verificar se há outros arquivos de log
echo "5️⃣ Verificando outros arquivos de log..."
ls -la storage/logs/*.log 2>/dev/null | head -5
echo ""

echo "✅ TESTE COMPLETO!"
