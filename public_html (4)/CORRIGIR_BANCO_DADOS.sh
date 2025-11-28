#!/bin/bash

# =====================================
# CORREÇÃO DO BANCO DE DADOS
# Execute no servidor via SSH
# =====================================

echo "🔧 CORRIGINDO BANCO DE DADOS PARA CARTWAVEHUB"
echo "=============================================="
echo ""
echo "Esta correção adicionará a coluna 'external_id' na tabela 'deposits'"
echo ""

# Opção 1: Via Migration (Recomendado)
echo "OPÇÃO 1: Via Migration Laravel (RECOMENDADO)"
echo "---------------------------------------------"
echo ""
echo "1. Faça upload do arquivo:"
echo "   database/migrations/2025_01_26_000000_add_external_id_to_deposits.php"
echo ""
echo "2. Execute no servidor:"
echo ""
cat << 'CMD1'
php artisan migrate
CMD1
echo ""
echo ""

# Opção 2: SQL Direto
echo "OPÇÃO 2: Via SQL Direto (Alternativa)"
echo "--------------------------------------"
echo ""
echo "Se a migration não funcionar, execute este SQL direto no banco:"
echo ""
cat << 'SQL1'
ALTER TABLE deposits 
ADD COLUMN external_id VARCHAR(100) NULL UNIQUE AFTER id,
ADD INDEX idx_external_id (external_id);
SQL1
echo ""
echo ""

# Verificar se funcionou
echo "VERIFICAÇÃO APÓS CORREÇÃO"
echo "-------------------------"
echo ""
echo "Execute este comando para verificar:"
echo ""
cat << 'CMD2'
php artisan tinker --execute="
if (Schema::hasColumn('deposits', 'external_id')) {
    echo '✅ Coluna external_id foi criada com sucesso!' . PHP_EOL;
} else {
    echo '❌ ERRO: Coluna external_id ainda não existe' . PHP_EOL;
}
"
CMD2
echo ""
echo "=============================================="
echo ""

