# 🚀 INTEGRAÇÃO AGILIZEPAY - INSTRUÇÕES COMPLETAS

## ✅ ARQUIVOS CRIADOS/MODIFICADOS

### Arquivos Novos Criados:
1. ✅ `database/migrations/2025_11_06_160000_add_agilizepay_to_gateways.php`
2. ✅ `app/Traits/Gateways/AgilizepayTrait.php`
3. ✅ `app/Http/Controllers/Gateway/AgilizepayController.php`
4. ✅ `routes/groups/gateways/agilizepay.php`

### Arquivos Modificados:
1. ✅ `app/Models/Gateway.php`
2. ✅ `routes/web.php`
3. ✅ `app/Http/Controllers/Api/Wallet/DepositController.php`
4. ✅ `app/Http/Controllers/Api/Profile/WalletController.php`
5. ✅ `app/Filament/Resources/SettingResource/Pages/PaymentSetting.php`
6. ✅ `app/Filament/Pages/GatewayPage.php`

---

## 📋 PASSO A PASSO PARA ATIVAÇÃO

### **1. CONECTAR AO SSH:**

```bash
ssh -p 65002 u127271520@212.85.6.24
```

Depois:
```bash
cd domains/mistyrose-beaver-987902.hostingersite.com/public_html
```

---

### **2. RODAR A MIGRATION (Adicionar Colunas no Banco):**

```bash
php artisan migrate
```

Esse comando vai adicionar as colunas:
- `agilizepay_uri`
- `agilizepay_client_id`
- `agilizepay_client_secret`

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

1. Acesse: `https://mistyrose-beaver-987902.hostingersite.com/zirigui`
2. Faça login como admin
3. No menu lateral, procure por **"Gateway"** ou **"Gateways de Pagamento"**
4. Role até a seção **"AGILIZEPAY"**
5. Preencha os campos:
   - **CLIENTE URL:** `https://api.agilizepay.com/`
   - **CLIENT ID:** (Seu client_id do painel AgilizePay)
   - **CLIENT SECRET:** (Seu client_secret do painel AgilizePay)
6. Digite a **senha 2FA** no final
7. Clique em **"Salvar"**

---

### **5. ATIVAR O AGILIZEPAY COMO GATEWAY ATIVO:**

1. Ainda no painel admin, vá em: **"Definições da Plataforma"** → **"Central Financeira"**
2. Em **"RESPONSÁVEL PELO SISTEMA DE SAQUE"**, selecione: **"AgilizePay"**
3. Em **"GATEWAYS DE PAGAMENTO"**, **ATIVE** o toggle **"AgilizePay"**
4. Clique em **"Salvar Alterações"**

---

### **6. CONFIGURAR WEBHOOKS NO PAINEL AGILIZEPAY:**

No painel da AgilizePay (https://app.agilizepay.com), configure os webhooks:

#### **Webhook para Depósitos (PIX-IN):**
```
https://mistyrose-beaver-987902.hostingersite.com/agilizepay/callback
```

#### **Webhook para Saques (PIX-OUT):**
```
https://mistyrose-beaver-987902.hostingersite.com/agilizepay/callback-withdrawal
```

---

### **7. ADICIONAR IPS NA WHITELIST:**

No painel AgilizePay, adicione os IPs do servidor à whitelist:

**IPv4:**
```
212.85.6.24
```

**IPv6:**
```
2a02:4780:13:1234::105
```

---

## 🎮 COMO FUNCIONA

### **Fluxo de Depósito:**
1. Usuário solicita depósito via PIX
2. Sistema chama `AgilizepayTrait::requestQrcodeAgilizepay()`
3. API AgilizePay retorna QR Code e código PIX Copia e Cola
4. Usuário paga o PIX
5. AgilizePay envia webhook para `/agilizepay/callback`
6. Sistema confirma pagamento e credita saldo

### **Fluxo de Saque:**
1. Usuário solicita saque
2. Admin aprova no painel
3. Sistema chama `AgilizepayTrait::pixCashOutAgilizepay()`
4. API AgilizePay processa o saque
5. AgilizePay envia webhook para `/agilizepay/callback-withdrawal`
6. Sistema atualiza status do saque

---

## 🔧 TROUBLESHOOTING

### **Erro: "Ocorreu uma falha ao entrar em contato com o gateway"**
- Verifique se as credenciais estão corretas
- Confirme se a URL da API está correta: `https://api.agilizepay.com/`
- Verifique se os IPs estão na whitelist

### **Depósito não é confirmado automaticamente:**
- Verifique se o webhook está configurado no painel AgilizePay
- Teste o webhook manualmente
- Verifique os logs: `tail -100 storage/logs/laravel.log`

### **Saque não é processado:**
- Verifique se selecionou "AgilizePay" como responsável pelo saque
- Confirme se há saldo na conta AgilizePay
- Verifique os logs de erro

---

## 📊 ROTAS CRIADAS

- `POST /api/deposit` - Com `gateway=agilizepay` (para depósitos)
- `POST /agilizepay/callback` - Webhook de depósitos
- `POST /agilizepay/callback-withdrawal` - Webhook de saques
- `POST /agilizepay/process-withdrawal` - Processar saque manualmente

---

## 🔐 SEGURANÇA

- ✅ Credenciais são protegidas no modo DEMO
- ✅ Webhooks validam transações pelo ID único
- ✅ Logs de todas as transações
- ✅ Validação de SSL/TLS nas requisições

---

## 📞 SUPORTE

- **Documentação AgilizePay:** https://docs.agilizepay.com
- **Dashboard AgilizePay:** https://app.agilizepay.com
- **Suporte 24/7:** Via painel AgilizePay

---

## ✅ CHECKLIST FINAL

- [ ] Migration rodada (`php artisan migrate`)
- [ ] Cache limpo (`php artisan optimize:clear`)
- [ ] Credenciais configuradas no painel admin
- [ ] Gateway AgilizePay ativado
- [ ] Webhooks configurados no painel AgilizePay
- [ ] IPs adicionados à whitelist
- [ ] Teste de depósito realizado
- [ ] Teste de saque realizado

---

## 🎉 PRONTO!

A integração do AgilizePay está completa! Agora você pode:
- ✅ Receber depósitos via PIX (PIX-IN)
- ✅ Fazer saques via PIX (PIX-OUT)
- ✅ Monitorar transações em tempo real
- ✅ Receber notificações de webhooks automáticas

**Boa sorte com seu cassino! 🎰**


