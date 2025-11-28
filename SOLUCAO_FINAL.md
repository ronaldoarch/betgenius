# 🔧 SOLUÇÃO FINAL - Erro 500 sem Logs

## 📋 Passos para Resolver

### 1. **FAZER UPLOAD DO ARQUIVO ATUALIZADO**

Faça upload do arquivo `DepositController_Arkama.php` para o servidor:
- **Origem:** `DepositController_Arkama.php` (local)
- **Destino:** `app/Http/Controllers/Api/Wallet/DepositController.php` (servidor)

### 2. **EXECUTAR NO SERVIDOR (SSH)**

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

# 1. Verificar sintaxe
php -l app/Http/Controllers/Api/Wallet/DepositController.php

# 2. Verificar se o arquivo foi atualizado (deve ter ~401 linhas)
wc -l app/Http/Controllers/Api/Wallet/DepositController.php

# 3. Regenerar autoload
composer dump-autoload -o

# 4. Limpar TODOS os caches
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
php artisan optimize:clear

# 5. Forçar purge do LiteSpeed
echo "Purge: *" > public/.litespeed_purge
killall -9 lsphp 2>/dev/null || true

# 6. Verificar se a classe pode ser carregada
php artisan tinker --execute="
try {
    \$controller = new \App\Http\Controllers\Api\Wallet\DepositController();
    echo '✅ Classe carregada com sucesso!' . PHP_EOL;
} catch (\Exception \$e) {
    echo '❌ Erro: ' . \$e->getMessage() . PHP_EOL;
    echo 'Arquivo: ' . \$e->getFile() . PHP_EOL;
    echo 'Linha: ' . \$e->getLine() . PHP_EOL;
}
"

# 7. Verificar se o método existe
php artisan tinker --execute="
\$controller = new \App\Http\Controllers\Api\Wallet\DepositController();
if (method_exists(\$controller, 'submitPayment')) {
    echo '✅ Método submitPayment existe!' . PHP_EOL;
} else {
    echo '❌ Método submitPayment NÃO existe!' . PHP_EOL;
}
if (method_exists(\$controller, 'requestQrcodeArkama')) {
    echo '✅ Método requestQrcodeArkama existe!' . PHP_EOL;
} else {
    echo '❌ Método requestQrcodeArkama NÃO existe!' . PHP_EOL;
}
"
```

### 3. **VERIFICAR ROTAS**

```bash
php artisan route:list | grep -i "deposit\|payment"
```

**Deve aparecer algo como:**
```
POST   api/carteira_wallet/deposit/payment  ... DepositController@submitPayment
```

### 4. **VERIFICAR GATEWAY**

```bash
php artisan tinker --execute="
\$gw = \App\Models\Gateway::first();
echo 'Arkama ativo: ' . (\$gw->arkama_ativo ?? 0) . PHP_EOL;
echo 'Token: ' . (empty(\$gw->arkama_api_token) ? 'VAZIO ❌' : 'OK ✅') . PHP_EOL;
echo 'URI: ' . (\$gw->arkama_uri ?? 'VAZIO') . PHP_EOL;
"
```

### 5. **MONITORAR LOGS EM TEMPO REAL**

Em um terminal separado, execute:

```bash
tail -f storage/logs/laravel.log | grep -i "DepositController\|Arkama\|error\|exception"
```

### 6. **TESTAR NO NAVEGADOR**

1. Abra o site no navegador
2. Vá para a página de depósito
3. Preencha os campos (valor e CPF)
4. Clique em "DEPOSITAR"
5. **IMEDIATAMENTE** verifique o terminal com `tail -f` para ver se aparecem logs

### 7. **SE AINDA NÃO FUNCIONAR**

Execute este teste direto da API:

```bash
# Obter token de autenticação (substitua pelo token real)
TOKEN="seu_token_jwt_aqui"

# Fazer requisição direta
curl -X POST https://betgeniusbr.com/api/carteira_wallet/deposit/payment \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  -d '{
    "amount": 30.00,
    "cpf": "70206292295"
  }' \
  -v
```

## 🔍 O QUE VERIFICAR

1. **Arquivo atualizado?** → `wc -l` deve mostrar ~401 linhas
2. **Sintaxe OK?** → `php -l` não deve mostrar erros
3. **Classe carregável?** → `tinker` deve instanciar sem erro
4. **Método existe?** → `method_exists` deve retornar `true`
5. **Gateway configurado?** → Token e URI devem estar preenchidos
6. **Logs aparecem?** → `tail -f` deve mostrar logs quando clicar em DEPOSITAR

## ⚠️ POSSÍVEIS PROBLEMAS

### Problema 1: Arquivo não foi atualizado
**Solução:** Verifique se o upload foi feito corretamente

### Problema 2: Cache do servidor
**Solução:** Execute todos os comandos de limpeza de cache

### Problema 3: Middleware bloqueando
**Solução:** Verifique se o token JWT está sendo enviado corretamente

### Problema 4: Erro antes do método
**Solução:** Verifique os logs do servidor web (Apache/Nginx)

## 📝 LOGS ESPERADOS

Quando funcionar, você deve ver nos logs:

```
[DepositController] Classe instanciada
[DepositController] submitPayment chamado
[DepositController] Auto-detectando gateway
[DepositController] Gateway detectado: arkama
[DepositController] Gateway final
[Arkama] requestQrcodeArkama chamado
```

Se não aparecer **NENHUM** log, significa que:
- A requisição não está chegando no método
- Há um erro antes do método ser chamado
- O middleware está bloqueando
- Há cache do servidor

