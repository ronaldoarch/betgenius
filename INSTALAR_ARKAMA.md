# 🚀 INSTALAÇÃO GATEWAY ARKAMA - PASSO A PASSO

## ✅ PASSO 1: SQL (phpMyAdmin)

Execute este SQL no phpMyAdmin:

```sql
-- Adicionar colunas do Arkama
ALTER TABLE gateways 
ADD COLUMN IF NOT EXISTS arkama_uri VARCHAR(255) DEFAULT 'https://app.arkama.com.br/api/v1',
ADD COLUMN IF NOT EXISTS arkama_api_token TEXT NULL,
ADD COLUMN IF NOT EXISTS arkama_ativo TINYINT(1) DEFAULT 0;

-- Ativar Arkama e desativar outros
UPDATE gateways SET
  arkama_ativo = 1,
  cartwavehub_ativo = 0,
  agilizepay_ativo = 0,
  cashtime_ativo = 0
WHERE id = 1;

-- Verificar
SELECT arkama_uri, arkama_api_token, arkama_ativo FROM gateways WHERE id = 1;
```

---

## ✅ PASSO 2: UPLOAD VIA FILEZILLA

Faça upload dos seguintes arquivos:

### 2.1 ArkamaTrait.php
**Local:** `/Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/ArkamaTrait.php`
**Destino:** `/home/u127271520/domains/betgeniusbr.com/public_html/app/Traits/Gateways/ArkamaTrait.php`

### 2.2 DepositController_Arkama.php
**Local:** `/Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/DepositController_Arkama.php`
**Destino:** `/home/u127271520/domains/betgeniusbr.com/public_html/app/Http/Controllers/Api/Wallet/DepositController.php`
⚠️ **IMPORTANTE:** Sobrescrever o arquivo existente!

### 2.3 Rotas (adicionar ao final de routes/api.php)
Copie o conteúdo de `api_arkama_routes.php` e adicione ao final do arquivo:
`/home/u127271520/domains/betgeniusbr.com/public_html/routes/api.php`

---

## ✅ PASSO 3: SSH (Limpar Cache)

```bash
ssh -p 65002 u127271520@betgeniusbr.com

cd /home/u127271520/domains/betgeniusbr.com/public_html

# Verificar sintaxe
php -l app/Traits/Gateways/ArkamaTrait.php
php -l app/Http/Controllers/Api/Wallet/DepositController.php

# Limpar cache
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan optimize:clear
composer dump-autoload -o

echo "✅ Arkama instalado!"
```

---

## ✅ PASSO 4: CONFIGURAR TOKEN NO PAINEL ADMIN

1. Acesse: https://betgeniusbr.com/admin
2. Vá em "Configurações" ou "Gateways"
3. Configure o **Arkama API Token**
4. Ative o gateway Arkama

**Para obter o token:**
1. Acesse: https://app.arkama.com.br
2. Faça login
3. Vá em "API" no menu
4. Copie o token

---

## ✅ PASSO 5: TESTAR

1. Acesse: https://betgeniusbr.com/profile/deposit
2. Digite um valor (ex: R$ 30,00)
3. Digite o CPF
4. Clique em DEPOSITAR
5. **O QR Code do Arkama deve aparecer!** 🎉

---

## 📊 WEBHOOK

O webhook está configurado automaticamente em:
`https://betgeniusbr.com/api/arkama/webhook`

Configure essa URL no painel do Arkama em "Configurações" > "Webhooks"

---

## 🔍 LOGS

Para ver logs:
```bash
tail -f storage/logs/laravel.log | grep -i arkama
```

---

## ✅ VANTAGENS DO ARKAMA

✅ API REST simples
✅ Documentação clara
✅ Sem necessidade de ativação prévia
✅ Suporte a PIX
✅ Webhooks confiáveis
✅ Sandbox para testes

---

## 🆘 SUPORTE

Documentação: https://arkama.readme.io/reference/intro

