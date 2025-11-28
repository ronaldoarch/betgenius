# 🚀 INTEGRAÇÃO CARTWAVEHUB - INSTRUÇÕES COMPLETAS

## ✅ ARQUIVOS CRIADOS/MODIFICADOS

### Arquivos Novos Criados:
1. ✅ `database/migrations/2025_01_20_100000_add_cartwavehub_to_gateways.php`
2. ✅ `app/Traits/Gateways/CartwavehubTrait.php`
3. ✅ `app/Http/Controllers/Gateway/CartwavehubController.php`
4. ✅ `routes/groups/gateways/cartwavehub.php`

### Arquivos Modificados:
1. ✅ `app/Models/Gateway.php`
2. ✅ `routes/web.php`
3. ✅ `app/Http/Controllers/Api/Wallet/DepositController.php`
4. ✅ `app/Http/Controllers/Api/Profile/WalletController.php`
5. ✅ `app/Filament/Pages/GatewayPage.php`

---

## 📋 PASSO A PASSO PARA ATIVAÇÃO

### **1. CONECTAR AO SSH:**

```bash
ssh -p 65002 u127271520@212.85.6.24
```

Depois:
```bash
cd domains/betgeniusbr.com/public_html
```

---

### **2. RODAR A MIGRATION (Adicionar Colunas no Banco):**

```bash
php artisan migrate
```

Esse comando vai adicionar as colunas:
- `cartwavehub_uri`
- `cartwavehub_api_secret`
- `cartwavehub_api_public`

na tabela `gateways`.

---

### **3. LIMPAR CACHE:**

```bash
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
php artisan optimize
echo "✅ Cache limpo!"
```

---

### **4. CONFIGURAR CREDENCIAIS NO PAINEL ADMIN:**

1. Acesse: `https://betgeniusbr.com/zirigui`
2. Faça login como admin
3. No menu lateral, procure por **"Gateway"** ou **"DEFINIÇÕES DE PAGAMENTO"**
4. Role até a seção **"CARTWAVEHUB"**
5. Preencha os campos:
   - **API URL:** `https://api.cartwavehub.com.br`
   - **API SECRET (x-authorization-key):** (Seu api-secret do painel Cartwavehub)
   - **API PUBLIC (x-store-key):** (Opcional - apenas se sua conta possuir chave pública)
6. Digite a **senha 2FA** no final
7. Clique em **"Atualizar dados"**

**Nota:** A chave pública (x-store-key) é opcional. Algumas contas podem não possuir essa chave. Se sua conta não tiver, deixe o campo em branco.

---

### **5. ATIVAR O CARTWAVEHUB COMO GATEWAY ATIVO:**

1. Ainda no painel admin, vá em: **"Definições da Plataforma"** → **"Central Financeira"**
2. Em **"RESPONSÁVEL PELO SISTEMA DE SAQUE"**, selecione: **"Cartwavehub"**
3. Em **"GATEWAYS DE PAGAMENTO"**, **ATIVE** o toggle **"Cartwavehub"**
4. Clique em **"Salvar Alterações"**

---

### **6. CONFIGURAR WEBHOOKS NO PAINEL CARTWAVEHUB:**

No painel da Cartwavehub (https://api.cartwavehub.com.br), configure os webhooks:

#### **Webhook para Depósitos (PIX-IN):**
```
https://betgeniusbr.com/cartwavehub/callback
```

#### **Webhook para Saques (PIX-OUT):**
```
https://betgeniusbr.com/cartwavehub/callback-withdrawal
```

---

## 🎮 COMO FUNCIONA

### **Fluxo de Depósito:**
1. Usuário solicita depósito via PIX
2. Sistema chama `CartwavehubTrait::requestQrcodeCartwavehub()`
3. API Cartwavehub retorna QR Code (base64) e código PIX Copia e Cola
4. Usuário paga o PIX
5. Cartwavehub envia webhook para `/cartwavehub/callback`
6. Sistema confirma pagamento e credita saldo

### **Fluxo de Saque:**
1. Usuário solicita saque
2. Admin aprova no painel
3. Sistema chama `CartwavehubTrait::pixCashOutCartwavehub()`
4. API Cartwavehub processa o saque
5. Cartwavehub envia webhook para `/cartwavehub/callback-withdrawal`
6. Sistema atualiza status do saque

---

## 📊 FUNCIONALIDADES IMPLEMENTADAS

### **Cash-in (PIX IN):**
- ✅ Criar transações PIX IN
- ✅ Receber QR Code em base64
- ✅ Receber código PIX Copia e Cola
- ✅ Suporte a campos opcionais (externalCode, ip, metadata, subseller)
- ✅ Webhook de confirmação de pagamento

### **Cash-out (PIX OUT):**
- ✅ Criar transações PIX OUT
- ✅ Suporte a todos os tipos de chave PIX (CPF, CNPJ, phone, email, random)
- ✅ Webhook de confirmação de saque
- ✅ Tratamento de status (Successfull, Failure, Canceled, Reversed)

### **Consultas:**
- ✅ Consultar saldo disponível
- ✅ Listar transações com paginação

### **Gestão de Disputas (MEDs):**
- ⚠️ **Nota:** A funcionalidade de MEDs está documentada na API, mas não foi implementada nesta versão inicial. Pode ser adicionada futuramente se necessário.

---

## 🔧 TROUBLESHOOTING

### **Erro: "Unauthorized access. Check your credentials"**
- Verifique se o `api-secret` está correto no campo **API SECRET**
- Confirme se a chave está ativa no painel Cartwavehub
- Verifique se não há espaços extras ao copiar a chave

### **Erro: "headers 'x-store-key' is missing"**
- Se sua conta requer chave pública, preencha o campo **API PUBLIC**
- Se sua conta não possui chave pública, deixe o campo em branco (é opcional)

### **Depósito não é confirmado automaticamente:**
- Verifique se o webhook está configurado no painel Cartwavehub
- Confirme que a URL do webhook está correta: `https://betgeniusbr.com/cartwavehub/callback`
- Teste o webhook manualmente
- Verifique os logs: `tail -100 storage/logs/cartwavehub.log`
- Verifique os logs do Laravel: `tail -100 storage/logs/laravel.log`

### **Saque não é processado:**
- Verifique se selecionou "Cartwavehub" como responsável pelo saque
- Confirme se há saldo disponível na conta Cartwavehub
- Verifique se o tipo de chave PIX está correto
- Verifique os logs de erro

### **Erro: "Minimum withdraw value is R$1.00"**
- O valor mínimo de saque é R$ 1,00 (100 centavos)
- Verifique se o valor do saque está acima do mínimo

### **Erro: "Insufficient Balance"**
- O saldo disponível não é suficiente para cobrir o valor do saque + taxas
- Verifique o saldo disponível na conta Cartwavehub

### **Erro: "Daily limit exceeded"**
- O limite diário de saques foi atingido
- Aguarde o próximo dia para realizar novos saques

---

## 📊 ROTAS CRIADAS

- `POST /api/deposit` - Com `gateway=cartwavehub` (para depósitos)
- `POST /cartwavehub/callback` - Webhook de depósitos
- `POST /cartwavehub/callback-withdrawal` - Webhook de saques
- `POST /cartwavehub/process-withdrawal` - Processar saque manualmente (requer auth)
- `GET /cartwavehub/balance` - Consultar saldo (requer auth)
- `GET /cartwavehub/transactions` - Listar transações (requer auth)

---

## 🔐 SEGURANÇA

- ✅ Credenciais são protegidas no modo DEMO
- ✅ Webhooks validam transações pelo ID único
- ✅ Logs de todas as transações em `storage/logs/cartwavehub.log`
- ✅ Validação de SSL/TLS nas requisições
- ✅ Autenticação via header `x-authorization-key`
- ✅ Suporte a autenticação em dois fatores (2FA) para alterações

---

## 📝 STATUS DE WEBHOOKS

### **PIX IN - Status Possíveis:**
- `paid` - Pagamento confirmado
- `refused` - Pagamento recusado
- `refunded` - Pagamento estornado
- `infraction` - Estorno decorrente de MED

### **PIX OUT - Status Possíveis:**
- `Successfull` - Saque realizado com sucesso
- `Failure` - Falha no saque (usuário é reembolsado)
- `Canceled` - Saque cancelado (usuário é reembolsado)
- `Reversed` - Saque revertido (usuário é reembolsado)

---

## 📞 SUPORTE

- **Documentação Cartwavehub:** Consulte o manual fornecido
- **Dashboard Cartwavehub:** https://api.cartwavehub.com.br
- **Site Oficial:** https://cartwavehub.com.br

---

## ✅ CHECKLIST FINAL

- [ ] Migration rodada (`php artisan migrate`)
- [ ] Cache limpo (`php artisan optimize:clear`)
- [ ] Credenciais configuradas no painel admin
- [ ] Gateway Cartwavehub ativado
- [ ] Webhooks configurados no painel Cartwavehub
- [ ] Teste de depósito realizado
- [ ] Teste de saque realizado
- [ ] Logs verificados (`storage/logs/cartwavehub.log`)

---

## 🎉 PRONTO!

A integração do Cartwavehub está completa! Agora você pode:
- ✅ Receber depósitos via PIX (PIX-IN)
- ✅ Fazer saques via PIX (PIX-OUT)
- ✅ Monitorar transações em tempo real
- ✅ Receber notificações de webhooks automáticas
- ✅ Consultar saldo disponível
- ✅ Listar transações com paginação

**Boa sorte com seu cassino! 🎰**

---

## 📚 REFERÊNCIAS DA API

### **Endpoints Utilizados:**

1. **POST /v1/cob** - Criar transação PIX IN
2. **POST /v1/request/withdraw** - Criar transação PIX OUT
3. **GET /v1/request/withdraw/balance** - Consultar saldo
4. **GET /v1/transactions** - Listar transações

### **Headers de Autenticação:**
- `x-authorization-key`: API Secret (obrigatório)
- `x-store-key`: API Public (opcional, apenas se a conta possuir)

### **Valores em Centavos:**
- Todos os valores de `amount` devem ser enviados em centavos (ex: R$ 10,00 = 1000)

---

## 🔄 PRÓXIMAS MELHORIAS (OPCIONAL)

- [ ] Implementar gestão de MEDs (disputas)
- [ ] Adicionar interface para consultar saldo no painel admin
- [ ] Adicionar interface para listar transações no painel admin
- [ ] Implementar retry automático em caso de falha de webhook
- [ ] Adicionar notificações push para admins em caso de saques pendentes

---

**Última atualização:** 20/01/2025

