# Sistema de Ativar/Desativar Gateways

## 🎯 O Que Foi Adicionado

Criei um sistema de toggles (botões liga/desliga) para cada gateway de pagamento no painel administrativo. Agora você pode:

✅ **Ativar apenas UM gateway por vez**  
✅ **Desativar gateways não utilizados**  
✅ **Alternar entre gateways facilmente**  

---

## 📋 Arquivos Criados/Modificados

### 1. **Migration** - `2025_01_25_100000_add_gateway_ativo_fields.php`
Adiciona colunas no banco de dados:
- `bspay_ativo`
- `suitpay_ativo`
- `stripe_ativo`
- `sharkpay_ativo`
- `agilizepay_ativo`
- `cashtime_ativo`
- `cartwavehub_ativo` ← **Novo gateway**

Todas começam como `false` (desativadas) por padrão.

### 2. **Model** - `app/Models/Gateway.php`
Atualizado para incluir os novos campos no `$fillable`.

### 3. **Admin Panel** - `app/Filament/Pages/GatewayPage.php`
Adicionado toggle em cada seção de gateway:
- **BSPay** → `Toggle::make('bspay_ativo')`
- **Cartwavehub** → `Toggle::make('cartwavehub_ativo')`
- (e assim por diante)

---

## 🚀 Como Instalar

### **Passo 1: Upload dos Arquivos**

No seu **terminal LOCAL** (Mac), execute:

```bash
cd "/Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/public_html (4)"
./adicionar_toggles_gateways.sh
```

Você precisará digitar a senha SSH **3 vezes** (uma para cada arquivo).

---

### **Passo 2: Executar Migration no Servidor**

Conecte ao SSH:

```bash
ssh -p 65002 u127271520@betgeniusbr.com
```

Execute este comando:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html && \
php artisan migrate --path=database/migrations/2025_01_25_100000_add_gateway_ativo_fields.php --force && \
php artisan config:clear && \
php artisan cache:clear && \
php artisan view:clear && \
echo "✅ CONCLUÍDO! Acesse o admin e ative o gateway desejado."
```

---

### **Passo 3: Configurar no Admin**

1. Acesse: `https://betgeniusbr.com/admin`
2. Faça login
3. Vá em: **Configurações** → **Gateway de Pagamento**
4. Role até a seção do gateway que você quer usar (ex: **CARTWAVEHUB**)
5. **Ative o toggle** ✅ "Ativar Cartwavehub"
6. Preencha a senha de 2FA: `491653`
7. Clique em **Atualizar dados**

---

## 📸 Como Vai Ficar

Em cada seção de gateway, você verá:

```
┌─────────────────────────────────────────┐
│ CARTWAVEHUB                             │
├─────────────────────────────────────────┤
│ ✅ Ativar Cartwavehub  [  ○ Toggle ]   │
│ Ative este gateway para utilizá-lo     │
│                                         │
│ API URL                                │
│ [https://api.cartwavehub.com.br]       │
│                                         │
│ API SECRET (x-authorization-key)       │
│ [sk_live_000SIE...]                    │
│                                         │
│ API PUBLIC (x-store-key) - Opcional    │
│ [(opcional)]                           │
└─────────────────────────────────────────┘
```

---

## 🎯 Como Usar

### **Cenário 1: Ativar Cartwavehub e Desativar Outros**

1. Vá até a seção **CARTWAVEHUB**
2. **Ative** o toggle: ✅ Ativar Cartwavehub
3. Vá até as outras seções (BSPay, SuitPay, etc.)
4. **Desative** os toggles desses gateways
5. Salve com a senha 2FA

Agora apenas o Cartwavehub está ativo!

### **Cenário 2: Alternar para Outro Gateway**

1. Desative o toggle do gateway atual
2. Ative o toggle do novo gateway
3. Salve com a senha 2FA

---

## 🔧 Como Funciona no Código

Quando o usuário faz um depósito/saque, o sistema verifica qual gateway está ativo:

```php
$gateway = Gateway::first();

if ($gateway->cartwavehub_ativo) {
    // Usar Cartwavehub
    return self::requestQrcodeCartwavehub($request);
}

if ($gateway->bspay_ativo) {
    // Usar BSPay
    return self::requestQrcodeBSPay($request);
}

// E assim por diante...
```

---

## ⚠️ Importante

- **Apenas UM gateway deve estar ativo por vez** (para evitar conflitos)
- Se NENHUM gateway estiver ativo, o depósito não funcionará
- Você pode ter vários gateways configurados, mas apenas um ativo

---

## 🐛 Problemas Comuns

### **1. Toggle não aparece**
- Execute: `php artisan cache:clear && php artisan view:clear`
- Limpe o cache do navegador (Ctrl+Shift+R)

### **2. Erro ao salvar**
- Verifique se a migration foi executada: `php artisan migrate:status | grep gateway_ativo`
- Se não aparecer, execute a migration novamente

### **3. Toggle não salva o estado**
- Verifique os logs: `tail -n 50 storage/logs/laravel.log`
- Verifique se o campo existe no banco: execute no SSH:
  ```bash
  php artisan tinker
  ```
  No tinker:
  ```php
  $g = \App\Models\Gateway::first();
  dd($g->getAttributes());
  ```

---

## ✅ Checklist de Instalação

- [ ] Executei `./adicionar_toggles_gateways.sh` no terminal LOCAL
- [ ] Executei a migration no servidor via SSH
- [ ] Limpei o cache (config, cache, view)
- [ ] Acessei o admin
- [ ] Vi os toggles em cada seção de gateway
- [ ] Ativei apenas o gateway que quero usar
- [ ] Salvei com a senha 2FA: `491653`
- [ ] Testei um depósito

---

## 📞 Suporte

Se tiver algum problema:
1. Verifique os logs: `tail -n 50 storage/logs/laravel.log`
2. Verifique se a migration rodou: `php artisan migrate:status`
3. Limpe todo o cache: `php artisan optimize:clear`

---

**Agora você tem controle total sobre qual gateway usar!** 🎉

