# ✅ Document Root Corrigido - Agora Corrigir Laravel

## 🎯 SITUAÇÃO ATUAL

- ✅ `betgeniusbr.com/teste.php` → **FUNCIONA!**
- ❌ `betgeniusbr.com/` → **404**

**Isso significa:**
- Document Root está correto (`public_html`)
- PHP está funcionando
- O problema é o redirecionamento do Laravel

---

## 🔧 SOLUÇÃO

### **Execute no SSH:**

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

# 1. Verificar se o .htaccess está redirecionando corretamente
echo "=== Verificando .htaccess na raiz ==="
cat .htaccess
echo ""

# 2. Verificar se o .htaccess em public/ está correto
echo "=== Verificando .htaccess em public/ ==="
cat public/.htaccess
echo ""

# 3. Testar se consegue acessar o index.php diretamente
echo "=== Testando acesso direto ao index.php ==="
echo "Teste no navegador: https://betgeniusbr.com/public/index.php"
echo ""

# 4. Limpar cache do Laravel
echo "=== Limpando cache do Laravel ==="
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
php artisan optimize:clear
php artisan optimize
echo "✅ Cache limpo"
echo ""

# 5. Verificar se há erros no Laravel
echo "=== Verificando últimos erros ==="
tail -20 storage/logs/laravel.log | grep -i error || echo "Nenhum erro recente"
echo ""

# 6. Verificar rotas
echo "=== Verificando rotas ==="
php artisan route:list | head -5
echo ""
```

---

## 🔍 VERIFICAÇÕES ESPECÍFICAS

### **1. Verificar se o .htaccess na raiz está correto:**

O `.htaccess` na raiz deve redirecionar TUDO para `public/`:

```apache
RewriteEngine On
RewriteRule ^$ public/ [L]
RewriteRule (.*) public/$1 [L]
```

**Se estiver diferente, corrija:**

```bash
cat > .htaccess << 'EOF'
RewriteEngine On

# Redireciona raiz para public/
RewriteRule ^$ public/ [L]

# Redireciona tudo para public/
RewriteRule (.*) public/$1 [L]

# Impede acesso ao .env
<Files .env>
    Order allow,deny
    Deny from all
</Files>
EOF

chmod 644 .htaccess
```

### **2. Verificar se consegue acessar index.php diretamente:**

Teste no navegador:
- `https://betgeniusbr.com/public/index.php`

**Se funcionar:**
- O Laravel está OK
- O problema é apenas o `.htaccess` não redirecionando

**Se não funcionar:**
- Pode haver erro no Laravel
- Verifique os logs: `tail -50 storage/logs/laravel.log`

### **3. Verificar APP_URL no .env:**

```bash
grep APP_URL .env
```

Deve estar:
```env
APP_URL=https://betgeniusbr.com
```

Se estiver diferente, corrija:

```bash
# Editar .env (use nano ou vi)
nano .env
# Altere APP_URL para: https://betgeniusbr.com
# Salve (Ctrl+X, depois Y, depois Enter)
```

Depois limpe o cache:
```bash
php artisan config:clear
```

---

## 🧪 TESTE COMPLETO

Execute este teste completo:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "=== TESTE 1: .htaccess na raiz ==="
cat .htaccess
echo ""

echo "=== TESTE 2: .htaccess em public/ ==="
head -5 public/.htaccess
echo ""

echo "=== TESTE 3: APP_URL ==="
grep APP_URL .env
echo ""

echo "=== TESTE 4: Limpando cache ==="
php artisan config:clear && php artisan cache:clear && php artisan route:clear && php artisan view:clear && php artisan optimize
echo "✅ Cache limpo"
echo ""

echo "=== TESTE 5: Verificando erros ==="
tail -30 storage/logs/laravel.log | tail -10
echo ""

echo "📋 TESTE NO NAVEGADOR:"
echo "1. https://betgeniusbr.com/public/index.php"
echo "2. https://betgeniusbr.com/"
echo ""
```

---

## 🚨 SE AINDA NÃO FUNCIONAR

### **Opção 1: Verificar se mod_rewrite está funcionando**

```bash
php -m | grep rewrite
```

Se não aparecer, o mod_rewrite não está habilitado. Contate suporte Hostinger.

### **Opção 2: Verificar logs do servidor web**

```bash
# Verificar se há erros no Apache/Nginx
tail -50 /var/log/apache2/error.log 2>/dev/null || tail -50 /var/log/nginx/error.log 2>/dev/null
```

### **Opção 3: Testar com URL completa**

Tente acessar:
- `https://betgeniusbr.com/public/index.php`
- `https://betgeniusbr.com/public/`

Se funcionar, o problema é definitivamente o `.htaccess` na raiz.

---

## ✅ CHECKLIST

- [ ] `.htaccess` na raiz redireciona para `public/`
- [ ] `.htaccess` em `public/` tem regras do Laravel
- [ ] `APP_URL` no `.env` está correto
- [ ] Cache do Laravel foi limpo
- [ ] Testou `https://betgeniusbr.com/public/index.php`
- [ ] Verificou logs de erro

---

**Execute os comandos acima e me informe:**
1. O que aparece quando acessa `https://betgeniusbr.com/public/index.php`?
2. Qual é o conteúdo do `.htaccess` na raiz?

