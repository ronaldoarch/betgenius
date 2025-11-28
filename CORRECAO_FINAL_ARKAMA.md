# 🔧 CORREÇÃO FINAL ARKAMA

## ❌ PROBLEMAS IDENTIFICADOS:

1. **Token não está sendo salvo** - Mesmo após salvar no admin, o token aparece como VAZIO
2. **Rotas não aparecem** - A rota está no arquivo mas não é reconhecida pelo Laravel

---

## ✅ SOLUÇÕES:

### **1️⃣ CRIAR ARQUIVO DE ROTAS (VIA FILEZILLA):**

**Arquivo Local:**
```
/Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/routes/groups/gateways/arkama.php
```

**Destino no Servidor:**
```
/home/u127271520/domains/betgeniusbr.com/public_html/routes/groups/gateways/arkama.php
```

**Conteúdo do arquivo:**
```php
<?php

use App\Http\Controllers\Api\Wallet\DepositController;
use Illuminate\Support\Facades\Route;

/**
 * Rotas do Gateway Arkama
 */

// Webhook para depósitos (PIX-IN) - público
Route::post('/arkama/webhook', [DepositController::class, 'arkamaWebhook'])
    ->name('arkama.webhook');

// Webhook para saques (PIX-OUT) - público (se necessário)
Route::post('/arkama/webhook-pix-out', [DepositController::class, 'arkamaWebhookPixOut'])
    ->name('arkama.webhook.pix-out');
```

---

### **2️⃣ ADICIONAR INCLUSÃO NO routes/web.php:**

**Via FileZilla ou SSH:**

1. Abra o arquivo: `routes/web.php`
2. Encontre a linha 97 (onde está `include_once(__DIR__ . '/groups/gateways/cartwavehub.php');`)
3. Adicione **DEPOIS** dessa linha:

```php
include_once(__DIR__ . '/groups/gateways/arkama.php');
```

**Ou via SSH:**
```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Fazer backup
cp routes/web.php routes/web.php.backup

# Adicionar linha
sed -i "97a include_once(__DIR__ . '/groups/gateways/arkama.php');" routes/web.php
```

---

### **3️⃣ CORRIGIR PROBLEMA DO TOKEN:**

O token não está sendo salvo. Execute este SQL para verificar e corrigir:

```sql
-- Verificar se o token está no banco
SELECT arkama_api_token, arkama_uri, arkama_ativo FROM gateways LIMIT 1;

-- Se o token estiver NULL, atualize manualmente (substitua 'SEU_TOKEN_AQUI' pelo token real)
UPDATE gateways SET 
    arkama_api_token = 'D20UFflOrpUAyoTXt4IEGEHi0xB7SZaBt8mqevBrnM3LWEJY2YnSJO1WbdBD',
    arkama_uri = 'https://app.arkama.com.br/api/v1',
    arkama_ativo = 1
WHERE id = 1;
```

**OU** tente salvar novamente no admin:
1. Acesse: `https://betgeniusbr.com/admin`
2. Vá em **Gateway**
3. Role até **ARKAMA**
4. **APAGUE** o token e **DIGITE NOVAMENTE**
5. Digite a senha 2FA
6. Clique em **SALVAR**

---

### **4️⃣ LIMPAR CACHE:**

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
php artisan optimize:clear
killall -9 lsphp
```

---

### **5️⃣ VERIFICAR SE FUNCIONOU:**

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Verificar token
php artisan tinker --execute="
\$gw = \App\Models\Gateway::first();
echo 'Token: ' . (empty(\$gw->arkama_api_token) ? 'VAZIO ❌' : 'OK ✅') . PHP_EOL;
"

# Verificar rotas
php artisan route:list | grep -i arkama
```

---

## 📋 CHECKLIST:

- [ ] Criar arquivo `routes/groups/gateways/arkama.php` via FileZilla
- [ ] Adicionar `include_once` no `routes/web.php`
- [ ] Verificar/corrigir token no banco (SQL ou admin)
- [ ] Limpar cache
- [ ] Verificar rotas com `php artisan route:list | grep arkama`
- [ ] Testar depósito no site

---

## 🎯 RESULTADO ESPERADO:

Após seguir todos os passos:
- ✅ Token salvo no banco
- ✅ Rotas aparecem em `php artisan route:list`
- ✅ Depósito funciona sem erros
- ✅ QR Code aparece corretamente

