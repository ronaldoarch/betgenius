# 🔧 Instalação Manual do Cartwavehub

## Opção 1: Upload via FileZilla/FTP (RECOMENDADO)

### 1️⃣ Fazer Upload dos Arquivos

Use FileZilla com as seguintes configurações:
- **Host**: `betgeniusbr.com`
- **Porta**: `65002`
- **Usuário**: `u127271520`
- **Senha**: (sua senha SSH)
- **Protocolo**: SFTP

**Arquivos para enviar:**

```
LOCAL → SERVIDOR

app/Helpers/CartwavehubHelper.php
→ /home/u127271520/domains/betgeniusbr.com/public_html/app/Helpers/

app/Http/Controllers/Api/CartwavehubDepositController.php
→ /home/u127271520/domains/betgeniusbr.com/public_html/app/Http/Controllers/Api/

app/Http/Controllers/Api/CartwavehubWebhookController.php
→ /home/u127271520/domains/betgeniusbr.com/public_html/app/Http/Controllers/Api/

routes/api_cartwavehub.php
→ /home/u127271520/domains/betgeniusbr.com/public_html/routes/

limpar_cartwavehub_antigo.sh
→ /home/u127271520/domains/betgeniusbr.com/public_html/

verificar_estrutura_banco.sh
→ /home/u127271520/domains/betgeniusbr.com/public_html/
```

---

## Opção 2: Copiar e Colar via SSH

### 1️⃣ Conectar ao Servidor

```bash
ssh -p 65002 u127271520@betgeniusbr.com
cd /home/u127271520/domains/betgeniusbr.com/public_html
```

### 2️⃣ Criar Diretório Helpers (se não existir)

```bash
mkdir -p app/Helpers
```

### 3️⃣ Criar os Arquivos via Cat

#### A) CartwavehubHelper.php

```bash
cat > app/Helpers/CartwavehubHelper.php << 'HEREDOC'
<?php
[COPIE O CONTEÚDO DO ARQUIVO app/Helpers/CartwavehubHelper.php AQUI]
HEREDOC
```

#### B) CartwavehubDepositController.php

```bash
cat > app/Http/Controllers/Api/CartwavehubDepositController.php << 'HEREDOC'
<?php
[COPIE O CONTEÚDO DO ARQUIVO app/Http/Controllers/Api/CartwavehubDepositController.php AQUI]
HEREDOC
```

#### C) CartwavehubWebhookController.php

```bash
cat > app/Http/Controllers/Api/CartwavehubWebhookController.php << 'HEREDOC'
<?php
[COPIE O CONTEÚDO DO ARQUIVO app/Http/Controllers/Api/CartwavehubWebhookController.php AQUI]
HEREDOC
```

#### D) api_cartwavehub.php

```bash
cat > routes/api_cartwavehub.php << 'HEREDOC'
<?php
[COPIE O CONTEÚDO DO ARQUIVO routes/api_cartwavehub.php AQUI]
HEREDOC
```

---

## 📋 Configuração no Servidor (Após Upload)

Execute estes comandos via SSH:

```bash
ssh -p 65002 u127271520@betgeniusbr.com
cd /home/u127271520/domains/betgeniusbr.com/public_html
```

### 1️⃣ Incluir Rotas no routes/api.php

```bash
# Adicionar a linha de require no final do arquivo routes/api.php
echo "" >> routes/api.php
echo "// Cartwavehub (Cashtime) - Nova Implementação" >> routes/api.php
echo "require __DIR__ . '/api_cartwavehub.php';" >> routes/api.php
```

### 2️⃣ Limpar Cache do Laravel

```bash
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
php artisan optimize
```

### 3️⃣ Verificar se as Rotas foram Registradas

```bash
php artisan route:list | grep cartwavehub
```

**Resultado esperado:**
```
POST  api/cartwavehub/create-pix ....... cartwavehub.create-pix
GET   api/cartwavehub/my-deposits ...... cartwavehub.my-deposits
POST  api/cartwavehub/callback ......... cartwavehub.webhook
```

### 4️⃣ Verificar Estrutura do Banco de Dados

```bash
php artisan tinker
```

Dentro do Tinker, execute:

```php
// Verificar se a tabela gateways tem as colunas necessárias
Schema::hasColumn('gateways', 'cartwavehub_api_secret');
Schema::hasColumn('gateways', 'cartwavehub_api_public');
Schema::hasColumn('gateways', 'cartwavehub_uri');

// Verificar se a tabela deposits tem a coluna external_id
Schema::hasColumn('deposits', 'external_id');

// Sair do Tinker
exit
```

Se alguma coluna não existir, você precisará criar uma migration ou adicionar diretamente via SQL.

---

## 🧪 Testar a Instalação

### 1️⃣ Verificar Logs

```bash
tail -f storage/logs/laravel.log
```

### 2️⃣ Testar Endpoint (precisará de um token válido)

```bash
curl -X POST https://betgeniusbr.com/api/cartwavehub/create-pix \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer SEU_TOKEN_AQUI' \
  -d '{"amount": 5.00}'
```

---

## 📊 Estrutura de Banco Necessária

### Tabela: gateways

Deve ter estas colunas:
- `cartwavehub_uri` (VARCHAR, nullable) - padrão: `https://api.cartwavehub.com.br`
- `cartwavehub_api_secret` (VARCHAR, nullable) - **OBRIGATÓRIO**
- `cartwavehub_api_public` (VARCHAR, nullable) - opcional

### Tabela: deposits

Deve ter estas colunas:
- `id` (INT, primary key)
- `user_id` (INT)
- `value` ou `amount` (DECIMAL)
- `type` (VARCHAR) - ex: 'pix'
- `status` (VARCHAR) - ex: 'pending', 'approved', 'rejected'
- `external_id` (VARCHAR, unique, nullable) - **IMPORTANTE**
- `proof` (TEXT, nullable) - para armazenar QR Code
- `created_at` (TIMESTAMP)
- `updated_at` (TIMESTAMP)

### Tabela: wallets

Deve ter estas colunas:
- `id` (INT, primary key)
- `user_id` (INT, unique)
- `balance` (DECIMAL)
- `created_at` (TIMESTAMP)
- `updated_at` (TIMESTAMP)

### Tabela: transactions

Deve ter estas colunas:
- `id` (INT, primary key)
- `wallet_id` (INT)
- `user_id` (INT)
- `type` (VARCHAR) - ex: 'deposit', 'withdrawal'
- `amount` (DECIMAL)
- `balance_before` (DECIMAL)
- `balance_after` (DECIMAL)
- `description` (TEXT)
- `reference_type` (VARCHAR, nullable) - ex: 'deposit'
- `reference_id` (INT, nullable)
- `created_at` (TIMESTAMP)
- `updated_at` (TIMESTAMP)

---

## ⚙️ Configurar no Admin (Filament)

1. Acesse: `https://betgeniusbr.com/admin`
2. Vá para **Configurações > Gateway** (ou similar)
3. Preencha:
   - **Cartwavehub URI**: `https://api.cartwavehub.com.br`
   - **Cartwavehub API Secret**: `sua_chave_secreta_aqui`
   - **Cartwavehub API Public**: `sua_chave_publica_aqui` (opcional)

---

## 🐛 Troubleshooting

### Erro: "Gateway não configurado"
- Verifique se preencheu as credenciais no admin
- Verifique se a tabela `gateways` tem as colunas necessárias

### Erro: "Route not found"
- Execute `php artisan route:clear`
- Verifique se o arquivo `routes/api.php` inclui o `api_cartwavehub.php`

### Erro: "Class not found"
- Execute `php artisan optimize`
- Verifique se o arquivo `CartwavehubHelper.php` está em `app/Helpers/`

### Webhook não está funcionando
- Verifique os logs em `storage/logs/laravel.log`
- Certifique-se de que a URL do webhook está configurada no Cartwavehub:
  ```
  https://betgeniusbr.com/api/cartwavehub/callback
  ```
- Teste o webhook manualmente com curl:
  ```bash
  curl -X POST https://betgeniusbr.com/api/cartwavehub/callback \
    -H 'Content-Type: application/json' \
    -d '{"id": "test123", "status": "paid", "amount": 500}'
  ```

---

## 📞 Suporte

Se encontrar problemas:
1. Verifique os logs: `storage/logs/laravel.log`
2. Execute `php artisan route:list` para ver se as rotas existem
3. Execute `php artisan tinker` e teste: `\App\Helpers\CartwavehubHelper::getBalance()`

