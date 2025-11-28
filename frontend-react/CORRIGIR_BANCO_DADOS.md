# 🔧 CORRIGIR ERRO DE BANCO DE DADOS

## 🚨 Erro

```
SQLSTATE[HY000] [1045] Access denied for user 'u911385553_boraganhar'@'127.0.0.1' (using password: YES)
```

**Causa:** Credenciais do banco de dados incorretas ou banco inacessível.

---

## ✅ SOLUÇÃO

### **1. Verificar arquivo .env**

No servidor, verifique o arquivo `.env`:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html
cat .env | grep DB_
```

**Deve mostrar algo como:**
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=u911385553_boraganhar
DB_USERNAME=u911385553_boraganhar
DB_PASSWORD=senha_aqui
```

---

### **2. Verificar Credenciais no hPanel**

1. **Acesse:** https://hpanel.hostinger.com/
2. **Vá em:** Banco de Dados MySQL
3. **Verifique:**
   - Nome do banco
   - Usuário
   - Senha
   - Host (geralmente `127.0.0.1` ou `localhost`)

---

### **3. Atualizar .env**

Se as credenciais estiverem incorretas, atualize o `.env`:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Fazer backup do .env atual
cp .env .env.backup

# Editar o .env (use nano ou vi)
nano .env
```

**Ou use este comando para atualizar diretamente:**

```bash
# Substitua os valores pelas credenciais corretas
sed -i 's/DB_HOST=.*/DB_HOST=127.0.0.1/' .env
sed -i 's/DB_DATABASE=.*/DB_DATABASE=u911385553_boraganhar/' .env
sed -i 's/DB_USERNAME=.*/DB_USERNAME=u911385553_boraganhar/' .env
sed -i 's/DB_PASSWORD=.*/DB_PASSWORD=SUA_SENHA_AQUI/' .env
```

---

### **4. Testar Conexão**

```bash
php artisan tinker
```

Dentro do tinker:
```php
DB::connection()->getPdo();
```

**Se funcionar:** Vai mostrar informações da conexão
**Se não funcionar:** Vai mostrar o erro específico

---

### **5. Limpar Cache**

```bash
php artisan config:clear
php artisan cache:clear
php artisan config:cache
```

---

## 🔍 Verificações Adicionais

### **Verificar se o MySQL está rodando:**

```bash
# Verificar status do MySQL
systemctl status mysql
# ou
service mysql status
```

### **Verificar se consegue conectar manualmente:**

```bash
mysql -u u911385553_boraganhar -p -h 127.0.0.1 u911385553_boraganhar
```

**Se pedir senha e conectar:** As credenciais estão corretas
**Se der erro:** As credenciais estão incorretas

---

## 📝 Checklist

- [ ] Verificou credenciais no hPanel
- [ ] Atualizou `.env` com credenciais corretas
- [ ] Testou conexão manual com MySQL
- [ ] Limpou cache do Laravel
- [ ] Testou novamente o site

---

## ⚠️ IMPORTANTE

**NUNCA** compartilhe o arquivo `.env` ou as credenciais do banco de dados publicamente!

