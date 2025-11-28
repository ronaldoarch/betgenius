# 🔍 Diagnóstico do Erro 404 - profile/deposit

## 🎯 Problema Identificado

Você está tentando acessar `betgeniusbr.com/profile/deposit` diretamente no navegador, mas esta é uma **rota de API** que não deve ser acessada assim.

---

## ✅ Estrutura Correta das Rotas

### Rotas de Depósito (API)

As rotas de depósito estão em:

```
/api/carteira_wallet/deposit  (requer autenticação JWT)
```

**Não em:**
```
/profile/deposit  ❌ (Esta rota não existe)
```

### Rotas Disponíveis

#### 1. Listar Métodos de Depósito
```
GET /api/carteira_wallet/deposit
Headers: Authorization: Bearer {seu_token_jwt}
```

#### 2. Fazer um Depósito
```
POST /api/carteira_wallet/deposit/payment
Headers: 
  Authorization: Bearer {seu_token_jwt}
  Content-Type: application/json
Body:
  {
    "gateway": "cartwavehub",
    "amount": 50.00
  }
```

---

## 🧪 Como Testar Corretamente

### Via SSH (Testando no Servidor)

Conecte ao servidor:

```bash
ssh -p 65002 u127271520@betgeniusbr.com
cd /home/u127271520/domains/betgeniusbr.com/public_html
```

#### 1. Verificar se as Rotas Existem

```bash
php artisan route:list | grep deposit
```

**Resultado esperado:**
```
GET|HEAD  api/carteira_wallet/deposit ................. 
POST      api/carteira_wallet/deposit/payment .........
```

#### 2. Limpar Cache (se as rotas não aparecerem)

```bash
php artisan route:clear
php artisan config:clear
php artisan cache:clear
php artisan optimize
```

### Via curl (Testando API)

Primeiro, você precisa ter um **token JWT** válido. Para testar sem token, vamos verificar se a rota existe:

```bash
# Testar se a rota de depósito existe (retornará 401 Unauthorized se existir)
curl -I https://betgeniusbr.com/api/carteira_wallet/deposit

# Se retornar 404: rota não existe (problema de configuração)
# Se retornar 401: rota existe mas precisa de autenticação (correto!)
```

---

## 🎨 Frontend - Como Acessar Corretamente

No seu frontend (React, Vue, etc.), você deve:

### 1. Fazer Login Primeiro

```javascript
// POST /api/auth/login
const response = await fetch('https://betgeniusbr.com/api/auth/login', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    email: 'usuario@exemplo.com',
    password: 'senha123'
  })
});

const { access_token } = await response.json();
```

### 2. Usar o Token para Acessar Depósito

```javascript
// GET /api/carteira_wallet/deposit
const depositResponse = await fetch('https://betgeniusbr.com/api/carteira_wallet/deposit', {
  headers: {
    'Authorization': `Bearer ${access_token}`,
    'Content-Type': 'application/json'
  }
});

const depositMethods = await depositResponse.json();
```

### 3. Fazer um Depósito PIX

```javascript
// POST /api/carteira_wallet/deposit/payment
const pixResponse = await fetch('https://betgeniusbr.com/api/carteira_wallet/deposit/payment', {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${access_token}`,
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    gateway: 'cartwavehub',
    amount: 50.00
  })
});

const pixData = await pixResponse.json();
console.log(pixData); // { qrcode: '...', pixKey: '...' }
```

---

## 🚨 Possíveis Causas do 404

### 1. Você está acessando a rota errada
- ❌ `betgeniusbr.com/profile/deposit`
- ✅ `betgeniusbr.com/api/carteira_wallet/deposit`

### 2. Cache do Laravel não foi limpo
**Solução:**
```bash
ssh -p 65002 u127271520@betgeniusbr.com
cd /home/u127271520/domains/betgeniusbr.com/public_html
php artisan route:clear && php artisan cache:clear
```

### 3. O Frontend está chamando a rota errada
**Verifique no código do frontend:**
```javascript
// Procure por chamadas como:
fetch('/profile/deposit')  // ❌ Errado
fetch('/api/carteira_wallet/deposit')  // ✅ Correto
```

### 4. Middleware de autenticação está bloqueando
**As rotas de depósito requerem autenticação JWT (`auth.jwt`)**

---

## 📋 Checklist de Diagnóstico

Execute estes passos no SSH:

```bash
# 1. Conectar ao servidor
ssh -p 65002 u127271520@betgeniusbr.com
cd /home/u127271520/domains/betgeniusbr.com/public_html

# 2. Listar TODAS as rotas
php artisan route:list > rotas_completas.txt
cat rotas_completas.txt | grep -E "(deposit|profile)"

# 3. Verificar se o arquivo de rotas existe
ls -la routes/groups/api/wallet/deposit.php

# 4. Verificar o conteúdo do arquivo
cat routes/groups/api/wallet/deposit.php

# 5. Limpar cache
php artisan route:clear
php artisan config:clear
php artisan cache:clear
php artisan optimize

# 6. Recarregar rotas
php artisan route:list | grep deposit
```

---

## 🔧 Solução Rápida

Se você só quer que funcione rapidamente:

### No Servidor (via SSH):

```bash
ssh -p 65002 u127271520@betgeniusbr.com << 'ENDSSH'
cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "🔄 Limpando cache..."
php artisan route:clear
php artisan config:clear
php artisan cache:clear
php artisan optimize

echo ""
echo "🔍 Verificando rotas de depósito..."
php artisan route:list | grep deposit

echo ""
echo "✅ Pronto! Agora teste no frontend."
ENDSSH
```

### No Frontend:

**Corrija a URL:**
- De: `/profile/deposit`
- Para: `/api/carteira_wallet/deposit`

---

## 📞 Ainda com Problema?

Se após seguir estes passos o problema persistir:

1. **Verifique os logs:**
   ```bash
   tail -f storage/logs/laravel.log
   ```

2. **Teste a rota base:**
   ```bash
   curl https://betgeniusbr.com/api/user
   ```

3. **Verifique se o .htaccess está correto:**
   ```bash
   cat public/.htaccess
   ```

4. **Reinicie o PHP-FPM** (se tiver acesso):
   ```bash
   # Isso depende da sua configuração de servidor
   # Pode precisar de ajuda do suporte da hospedagem
   ```

---

## 💡 Resumo

- ❌ **NÃO acesse** `/profile/deposit` no navegador
- ✅ **Use** `/api/carteira_wallet/deposit` via JavaScript (com token JWT)
- 🔑 **Sempre envie** o header `Authorization: Bearer {token}`
- 🧹 **Sempre limpe** o cache após mudanças nas rotas

---

**A rota `/profile/deposit` não existe e nem deveria existir. Use as rotas de API corretamente! 🚀**

