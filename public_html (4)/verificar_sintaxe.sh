#!/bin/bash

# Script para verificar sintaxe do DepositController.php no servidor

echo "🔍 Verificando sintaxe do DepositController.php..."
echo ""

# Verificar sintaxe PHP
php -l app/Http/Controllers/Api/Wallet/DepositController.php

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Sintaxe PHP: OK"
    echo ""
    echo "📊 Informações do arquivo:"
    ls -lh app/Http/Controllers/Api/Wallet/DepositController.php
    echo ""
    echo "📝 Primeiras linhas:"
    head -30 app/Http/Controllers/Api/Wallet/DepositController.php
else
    echo ""
    echo "❌ ERRO DE SINTAXE DETECTADO!"
    echo "O arquivo está corrompido ou incompleto."
    echo "Faça o upload novamente via FileZilla."
fi

