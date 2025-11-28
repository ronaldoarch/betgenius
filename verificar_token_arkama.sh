#!/bin/bash

echo "🔍 VERIFICANDO TOKEN ARKAMA"
echo "============================"
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

php artisan tinker --execute="
\$gw = \App\Models\Gateway::first();
if (\$gw) {
    echo 'Arkama Ativo: ' . (\$gw->arkama_ativo ?? 0) . PHP_EOL;
    echo 'Arkama URI: ' . (\$gw->arkama_uri ?? 'VAZIO') . PHP_EOL;
    echo 'Arkama Token: ' . (empty(\$gw->arkama_api_token) ? 'VAZIO ❌ - PRECISA SALVAR NO ADMIN!' : 'CONFIGURADO ✅ (' . substr(\$gw->arkama_api_token, 0, 20) . '...)') . PHP_EOL;
} else {
    echo '❌ Nenhum gateway encontrado!' . PHP_EOL;
}
"

echo ""
echo "============================"
echo "✅ VERIFICAÇÃO CONCLUÍDA!"

