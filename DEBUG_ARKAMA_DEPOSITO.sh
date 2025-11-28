#!/bin/bash

echo "🔍 DEBUG COMPLETO - ARKAMA DEPÓSITO"
echo "===================================="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "1️⃣ Verificando configuração do Arkama no banco:"
php artisan tinker --execute="
\$gw = \App\Models\Gateway::first();
echo 'URI: ' . (\$gw->arkama_uri ?? 'VAZIO') . PHP_EOL;
echo 'Token: ' . (empty(\$gw->arkama_api_token) ? 'VAZIO ❌' : substr(\$gw->arkama_api_token, 0, 20) . '... ✅') . PHP_EOL;
echo 'Ativo: ' . (\$gw->arkama_ativo ?? 0) . PHP_EOL;
"
echo ""

echo "2️⃣ Verificando se o método requestQrcodeArkama existe no ArkamaTrait:"
grep -n "function requestQrcodeArkama" app/Traits/Gateways/ArkamaTrait.php
echo ""

echo "3️⃣ Verificando logs recentes de erro:"
tail -50 storage/logs/laravel.log | grep -i "arkama\|error\|exception" | tail -10
echo ""

echo "4️⃣ Limpando logs antigos e preparando para monitoramento:"
echo "   (Execute 'tail -f storage/logs/laravel.log | grep -i arkama' em outro terminal)"
echo ""

echo "✅ Pronto para testar! Tente fazer um depósito agora."

