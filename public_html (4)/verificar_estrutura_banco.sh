#!/bin/bash

# ====================================
# VERIFICAR ESTRUTURA DO BANCO
# Execute no SERVIDOR SSH
# ====================================

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "🔍 VERIFICANDO ESTRUTURA DO BANCO DE DADOS"
echo "=========================================="
echo ""

echo "📋 Tabelas necessárias para Cartwavehub:"
echo "  1. gateways (configurações)"
echo "  2. deposits (pagamentos PIX)"
echo "  3. wallets (carteiras)"
echo "  4. transactions (transações)"
echo ""

php artisan tinker --execute="
echo '1️⃣ Verificando tabela GATEWAYS:\n';
\$gateway = \App\Models\Gateway::first();
if (\$gateway) {
    \$attrs = \$gateway->getAttributes();
    echo 'Colunas Cartwavehub existentes:\n';
    if (isset(\$attrs['cartwavehub_uri'])) echo '  ✓ cartwavehub_uri\n';
    if (isset(\$attrs['cartwavehub_api_secret'])) echo '  ✓ cartwavehub_api_secret\n';
    if (isset(\$attrs['cartwavehub_api_public'])) echo '  ✓ cartwavehub_api_public\n';
} else {
    echo '  ❌ Nenhum gateway configurado\n';
}
echo '\n';

echo '2️⃣ Verificando tabela DEPOSITS:\n';
if (\Schema::hasTable('deposits')) {
    \$columns = \DB::select('DESCRIBE deposits');
    echo '  ✓ Tabela deposits existe (' . count(\$columns) . ' colunas)\n';
} else {
    echo '  ❌ Tabela deposits não existe\n';
}
echo '\n';

echo '3️⃣ Verificando tabela WALLETS:\n';
if (\Schema::hasTable('wallets')) {
    echo '  ✓ Tabela wallets existe\n';
} else {
    echo '  ❌ Tabela wallets não existe\n';
}
echo '\n';

echo '4️⃣ Verificando tabela TRANSACTIONS:\n';
if (\Schema::hasTable('transactions')) {
    echo '  ✓ Tabela transactions existe\n';
} else {
    echo '  ❌ Tabela transactions não existe\n';
}
"

echo ""
echo "=========================================="
echo "✅ VERIFICAÇÃO CONCLUÍDA"
echo "=========================================="

