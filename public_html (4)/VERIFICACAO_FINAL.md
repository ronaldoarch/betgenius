# 🔍 VERIFICAÇÃO FINAL - 404 Ainda Persiste

## ✅ Você já alterou o Document Root no hPanel?

Se ainda não alterou, **essa é a causa do problema**. Siga os passos abaixo.

Se já alterou e ainda não funciona, vamos verificar outras causas.

---

## 🎯 PASSO 1: Verificar Document Root no hPanel

1. **Acesse:** https://hpanel.hostinger.com/
2. **Login** com suas credenciais
3. **Vá em:** Domínios → betgeniusbr.com
4. **Clique em:** "Gerenciar" ou "Configurações" ou "Avançado"
5. **Procure por:** "Document Root" ou "Raiz do Documento" ou "Root Directory"
6. **Verifique o valor atual**

**Se estiver:**
- `public_html/public` → **ALTERE** para `public_html`
- `domains/betgeniusbr.com/public_html/public` → **ALTERE** para `domains/betgeniusbr.com/public_html`
- Qualquer coisa com `/public` no final → **REMOVA** o `/public`

**Salve e aguarde 3-5 minutos** para propagar.

---

## 🔍 PASSO 2: Verificar .htaccess na Raiz

Execute no SSH:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Verificar se .htaccess existe
ls -la .htaccess

# Ver conteúdo
cat .htaccess
```

**Deve conter:**
```apache
RewriteEngine On
RewriteRule ^$ public/ [L]
RewriteRule (.*) public/$1 [L]
```

**Se não existir ou estiver diferente, crie/corrija:**

```bash
cat > .htaccess << 'EOF'
RewriteEngine On

# Redireciona tudo para a pasta public/
RewriteRule ^$ public/ [L]
RewriteRule (.*) public/$1 [L]

# Impede acesso ao arquivo .env
<Files .env>
    Order allow,deny
    Deny from all
</Files>
EOF

chmod 644 .htaccess
```

---

## 🔍 PASSO 3: Verificar .htaccess no Public

```bash
cat public/.htaccess
```

**Deve conter as regras do Laravel** (RewriteEngine, RewriteCond, etc.)

Se não existir, crie:

```bash
cat > public/.htaccess << 'EOF'
<IfModule mod_rewrite.c>
    <IfModule mod_negotiation.c>
        Options -MultiViews -Indexes
    </IfModule>

    RewriteEngine On

    # Handle Authorization Header
    RewriteCond %{HTTP:Authorization} .
    RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]

    # Redirect Trailing Slashes If Not A Folder...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_URI} (.+)/$
    RewriteRule ^ %1 [L,R=301]

    # Send Requests To Front Controller...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^ index.php [L]
</IfModule>
EOF

chmod 644 public/.htaccess
```

---

## 🔍 PASSO 4: Testar Após Alterar Document Root

Depois de alterar o Document Root e aguardar 3-5 minutos:

1. **Limpe o cache do navegador** (Ctrl+Shift+Delete ou Cmd+Shift+Delete)
2. **Teste:** `https://betgeniusbr.com/`
3. **Se ainda não funcionar, teste:** `https://betgeniusbr.com/public/index.php`

---

## 🔍 PASSO 5: Verificar Permissões

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Corrigir permissões
chmod 644 .htaccess
chmod 644 public/.htaccess
chmod 755 public
chmod 644 public/index.php
chmod -R 755 storage bootstrap/cache
```

---

## 🔍 PASSO 6: Verificar se mod_rewrite está habilitado

```bash
php -m | grep rewrite
```

Se não aparecer nada, o mod_rewrite não está habilitado. Entre em contato com suporte da Hostinger.

---

## 🔍 PASSO 7: Verificar Logs

```bash
# Logs do Laravel
tail -50 storage/logs/laravel.log

# Verificar se há erros recentes
grep -i error storage/logs/laravel.log | tail -20
```

---

## 🚨 SE NADA FUNCIONAR

### **Opção A: Contatar Suporte Hostinger**

1. Acesse: https://hpanel.hostinger.com/
2. Vá em **Suporte** ou **Chat**
3. Informe:
   - Domínio: betgeniusbr.com
   - Problema: Erro 404, Document Root precisa ser alterado
   - Solicite: Alterar Document Root de `public_html/public` para `public_html`
   - Motivo: Usando Laravel, precisa que Document Root seja `public_html` com .htaccess redirecionando

### **Opção B: Verificar se há configuração específica**

Algumas hospedagens têm configurações especiais. Verifique:

```bash
# Verificar se há arquivo de configuração
ls -la | grep -E "(\.htaccess|web\.config|\.user\.ini)"

# Verificar configuração do PHP
cat .user.ini 2>/dev/null || echo "Arquivo .user.ini não existe"
```

---

## 📋 CHECKLIST COMPLETO

Execute na ordem:

- [ ] **Alterou Document Root no hPanel?** (de `public_html/public` para `public_html`)
- [ ] **Aguardou 3-5 minutos** após alterar?
- [ ] **Limpou cache do navegador?**
- [ ] **Verificou .htaccess na raiz?** (deve redirecionar para `public/`)
- [ ] **Verificou .htaccess em public/?** (deve ter regras do Laravel)
- [ ] **Corrigiu permissões?** (chmod 644 nos .htaccess)
- [ ] **Testou:** `https://betgeniusbr.com/`?
- [ ] **Testou:** `https://betgeniusbr.com/public/index.php`?

---

## 💡 DICA IMPORTANTE

**Após alterar o Document Root no hPanel:**
- Aguarde **3-5 minutos** (pode levar até 10 minutos)
- **Limpe o cache do navegador** completamente
- Teste em **modo anônimo/privado** para evitar cache
- Tente em **outro navegador** para confirmar

---

**Execute o checklist acima e me informe em qual passo está!**

