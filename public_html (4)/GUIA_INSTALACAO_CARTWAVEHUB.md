# 🚀 Guia de Instalação Completa do Cartwavehub

**Reimplementação seguindo o guia oficial à risca**

---

## 📋 Índice

1. [Visão Geral](#visão-geral)
2. [Arquivos Criados](#arquivos-criados)
3. [Instalação Passo a Passo](#instalação-passo-a-passo)
4. [Configuração](#configuração)
5. [Testes](#testes)
6. [Troubleshooting](#troubleshooting)

---

## 🎯 Visão Geral

Esta é uma reimplementação completa do Cartwavehub seguindo o guia oficial, adaptada para Laravel mas mantendo a lógica exata do guia.

### O Que Foi Implementado

✅ **Helper Class** (`CartwavehubHelper.php`)
- Busca credenciais do banco
- Cria transações PIX
- Lista transações
- Busca saldo

✅ **Controller de Depósito** (`CartwavehubDepositController.php`)
- Endpoint: `POST /api/cartwavehub/create-pix`
- Valida usuário autenticado
- Valida valor (min R$ 5, max R$ 10.000)
- Chama API Cartwavehub
- Salva no banco

✅ **Controller de Webhook** (`CartwavehubWebhookController.php`)
- Endpoint: `POST /cartwavehub/callback`
- Mapeia status (paid, approved, completed → 1)
- Usa transação de banco com FOR UPDATE
- Credita saldo automaticamente
- SEMPRE retorna HTTP 200

✅ **Rotas API** (`api_cartwavehub.php`)
- Webhook público
- Endpoints autenticados

✅ **Scripts de Instalação**
- `instalar_cartwavehub_completo.sh`
- `limpar_cartwavehub_antigo.sh`
- `verificar_estrutura_banco.sh`

---

## 📁 Arquivos Criados

```
public_html (4)/
├── app/
│   ├── Helpers/
│   │   └── CartwavehubHelper.php            (NOVO)
│   └── Http/
│       └── Controllers/
│           └── Api/
│               ├── CartwavehubDepositController.php    (NOVO)
│               └── CartwavehubWebhookController.php    (NOVO)
├── routes/
│   └── api_cartwavehub.php                  (NOVO)
├── instalar_cartwavehub_completo.sh         (NOVO)
├── limpar_cartwavehub_antigo.sh             (NOVO)
├── verificar_estrutura_banco.sh             (NOVO)
└── GUIA_INSTALACAO_CARTWAVEHUB.md           (ESTE ARQUIVO)
```

---

## 🔧 Instalação Passo a Passo

### **Passo 1: Dar Permissão ao Script**

No seu **Mac** (terminal local):

```bash
cd "/Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/public_html (4)"
chmod +x instalar_cartwavehub_completo.sh
chmod +x limpar_cartwavehub_antigo.sh
chmod +x verificar_estrutura_banco.sh
```

### **Passo 2: Executar Instalação**

```bash
./instalar_cartwavehub_completo.sh
```

Digite a senha SSH quando pedir (6 vezes - uma para cada arquivo).

### **Passo 3: Conectar ao SSH**

```bash
ssh -p 65002 u127271520@betgeniusbr.com
```

### **Passo 4: Limpar Implementação Antiga**

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html
chmod +x limpar_cartwavehub_antigo.sh
./limpar_cartwavehub_antigo.sh
```

### **Passo 5: Verificar Estrutura do Banco**

```bash
chmod +x verificar_estrutura_banco.sh
./verificar_estrutura_banco.sh
```

Você verá algo assim:

```
1️⃣ Verificando tabela GATEWAYS:
  ✓ cartwavehub_uri
  ✓ cartwavehub_api_secret
  ✓ cartwavehub_api_public

2️⃣ Verificando tabela DEPOSITS:
  ✓ Tabela deposits existe (X colunas)

3️⃣ Verificando tabela WALLETS:
  ✓ Tabela wallets existe

4️⃣ Verificando tabela TRANSACTIONS:
  ✓ Tabela transactions existe
```

### **Passo 6: Incluir Rotas no `routes/api.php`**

Edite o arquivo `routes/api.php` e adicione no final:

```php
// Cartwavehub (Cashtime)
require __DIR__ . '/api_cartwavehub.php';
```

Ou execute:

```bash
echo "" >> routes/api.php
echo "// Cartwavehub (Cashtime)" >> routes/api.php
echo "require __DIR__ . '/api_cartwavehub.php';" >> routes/api.php
```

### **Passo 7: Criar Diretório de Helpers (se não existir)**

```bash
mkdir -p app/Helpers
```

### **Passo 8: Limpar Cache**

```bash
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
php artisan optimize
```

### **Passo 9: Verificar Rotas**

```bash
php artisan route:list | grep cartwavehub
```

Deve mostrar:

```
POST  api/cartwavehub/create-pix .... cartwavehub.create-pix
GET   api/cartwavehub/my-deposits ... cartwavehub.my-deposits
POST  cartwavehub/callback .......... cartwavehub.webhook
```

---

## ⚙️ Configuração

### **1. Configurar Credenciais no Banco**

No **painel admin** do site:

1. Acesse: `https://betgeniusbr.com/admin`
2. Vá em: **Configurações** → **Gateway de Pagamento**
3. Seção **CARTWAVEHUB**:
   - **API URL**: `https://api.cartwavehub.com.br`
   - **API SECRET**: Sua chave secreta do Cashtime
   - **API PUBLIC**: Deixe em branco (opcional)
4. Senha de 2FA: `491653`
5. Salvar

### **2. Configurar Webhook no Painel Cashtime**

1. Acesse: https://dashboard.cashtime.com.br
2. Vá em: **Configurações** → **Webhooks**
3. URL do Webhook: `https://betgeniusbr.com/cartwavehub/callback`
4. Salvar

---

## 🧪 Testes

### **Teste 1: Verificar Endpoint (Via Postman/Insomnia)**

```bash
POST https://betgeniusbr.com/api/cartwavehub/create-pix
Headers:
  Content-Type: application/json
  Authorization: Bearer SEU_TOKEN_AQUI
Body:
  {
    "amount": 5.00
  }
```

**Resposta Esperada:**

```json
{
  "success": true,
  "deposit_id": 123,
  "pix": {
    "qr_code": "data:image/png;base64,...",
    "pix_key": "00020126...",
    "expires_at": "2025-01-20T10:30:00Z"
  },
  "amount": 5.00,
  "message": "QR Code PIX gerado com sucesso"
}
```

### **Teste 2: Verificar Webhook (Manualmente)**

```bash
curl -X POST https://betgeniusbr.com/cartwavehub/callback \
  -H "Content-Type: application/json" \
  -d '{
    "id": "test_123",
    "status": "paid",
    "amount": 500,
    "paidAt": "2025-01-20T10:25:00Z"
  }'
```

**Resposta Esperada:**

```json
{
  "success": true,
  "message": "Webhook processado com sucesso"
}
```

### **Teste 3: Verificar Logs**

```bash
tail -f storage/logs/laravel.log | grep Cartwavehub
```

Deve mostrar:

```
[Cartwavehub] Criando PIX...
[Cartwavehub] PIX criado com sucesso...
[Cartwavehub Webhook] Recebido...
[Cartwavehub] Saldo creditado...
```

### **Teste 4: Teste Real (Valor Mínimo)**

1. Acesse: `https://betgeniusbr.com`
2. Faça login
3. Vá em **Carteira** → **Depósito**
4. Digite: **R$ 5,00**
5. Clique em **DEPOSITAR**
6. Deve gerar QR Code
7. Pague via PIX no app do banco
8. Aguarde 5-10 segundos
9. Saldo deve ser creditado automaticamente

---

## 🆘 Troubleshooting

### **Problema 1: Erro 404 ao criar PIX**

**Causa:** Rotas não incluídas

**Solução:**

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html
grep -q "api_cartwavehub.php" routes/api.php || echo "require __DIR__ . '/api_cartwavehub.php';" >> routes/api.php
php artisan route:clear
php artisan route:cache
```

### **Problema 2: Erro 401 Unauthorized na API Cashtime**

**Causa:** API Secret incorreto

**Solução:**

1. Verificar no banco:

```bash
php artisan tinker
```

```php
$g = \App\Models\Gateway::first();
echo $g->cartwavehub_api_secret;
```

2. Se estiver incorreto, corrigir no admin

### **Problema 3: Webhook não chega**

**Causa:** URL incorreta no painel Cashtime

**Solução:**

1. Verificar URL configurada: `https://betgeniusbr.com/cartwavehub/callback`
2. Testar manualmente com curl (Teste 2 acima)
3. Verificar logs: `tail -f storage/logs/laravel.log`

### **Problema 4: Saldo não credita**

**Causa:** Erro na lógica do webhook

**Solução:**

1. Verificar logs:

```bash
tail -f storage/logs/laravel.log | grep "Cartwavehub"
```

2. Verificar status no banco:

```bash
php artisan tinker
```

```php
\App\Models\Deposit::latest()->first();
```

3. Se status não está 1, webhook não processou

### **Problema 5: Class CartwavehubHelper not found**

**Causa:** Autoload não atualizado ou diretório não existe

**Solução:**

```bash
mkdir -p app/Helpers
composer dump-autoload
php artisan optimize:clear
```

---

## ✅ Checklist de Instalação

- [ ] Executei `instalar_cartwavehub_completo.sh`
- [ ] Executei `limpar_cartwavehub_antigo.sh`
- [ ] Executei `verificar_estrutura_banco.sh`
- [ ] Adicionei `require __DIR__ . '/api_cartwavehub.php';` no `routes/api.php`
- [ ] Criei diretório `app/Helpers`
- [ ] Limpei o cache (config, cache, route, view)
- [ ] Verifiquei rotas com `php artisan route:list`
- [ ] Configurei credenciais no admin
- [ ] Configurei webhook no painel Cashtime
- [ ] Testei criação de PIX (Teste 1)
- [ ] Testei webhook manual (Teste 2)
- [ ] Fiz teste real com R$ 5,00
- [ ] Saldo foi creditado automaticamente

---

## 📊 Mapeamento de Status

| Status Cashtime | Status no DB | Ação |
|----------------|--------------|------|
| `paid` | 1 (completed) | Creditar saldo |
| `approved` | 1 (completed) | Creditar saldo |
| `completed` | 1 (completed) | Creditar saldo |
| `pending` | 0 (pending) | Aguardar |
| `failed` | 2 (cancelled) | Não creditar |
| `cancelled` | 2 (cancelled) | Não creditar |
| `expired` | 2 (cancelled) | Não creditar |

---

## 🔐 Segurança

✅ **Implementado conforme guia:**
- HTTPS obrigatório
- Autenticação em endpoints
- Validação de valores (min/max)
- Transação de banco com FOR UPDATE
- Sempre retorna HTTP 200 no webhook
- CPF sanitizado (apenas números)
- Prepared statements
- Logs sem expor credenciais

---

## 📞 Suporte

- **Documentação Cashtime**: https://api-docs.cashtime.com.br
- **Notion**: https://cartwavehub.notion.site/
- **Dashboard**: https://dashboard.cashtime.com.br

---

## 🎯 Próximos Passos

Após instalação bem-sucedida:

1. ✅ Monitorar logs por 24h
2. ✅ Testar com diferentes valores
3. ✅ Testar com múltiplos usuários
4. ✅ Documentar processo para equipe
5. ✅ Configurar alertas de erro (opcional)

---

**Instalação estimada: 15-30 minutos**

**Reimplementado conforme guia oficial em:** {{ date }}

