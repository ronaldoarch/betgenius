# 🔧 GUIA COMPLETO - CORRIGIR ERRO 403

## 🎯 PROBLEMA

O erro **403 Forbidden** geralmente é causado por **Document Root incorreto** no hPanel.

---

## ✅ SOLUÇÃO PASSO A PASSO

### **PASSO 1: Verificar Document Root no hPanel**

1. **Acesse o hPanel:**
   - URL: https://hpanel.hostinger.com/
   - Faça login com suas credenciais

2. **Navegue até Domínios:**
   - No menu lateral, clique em **"Domínios"**
   - Encontre **betgeniusbr.com** na lista
   - Clique em **"Gerenciar"** ou **"Configurações"**

3. **Localize o Document Root:**
   - Procure por uma seção chamada:
     - **"Document Root"** ou
     - **"Raiz do Documento"** ou
     - **"Root Directory"** ou
     - **"Diretório Raiz"**
   
   Pode estar em:
   - Uma aba chamada **"Avançado"** ou **"Advanced"**
   - Uma seção chamada **"Configurações do Domínio"**

4. **Verifique o valor atual:**
   - **❌ ERRADO:** `public_html/public` ou `domains/betgeniusbr.com/public_html/public`
   - **✅ CORRETO:** `public_html` ou `domains/betgeniusbr.com/public_html`

5. **Se estiver errado, altere:**
   - Clique em **"Editar"** ou **"Alterar"**
   - Altere para: `public_html` (sem `/public` no final)
   - Clique em **"Salvar"** ou **"Aplicar"**

6. **Aguarde 2-3 minutos** para as alterações propagarem

---

### **PASSO 2: Executar Comandos no SSH**

Depois de alterar o Document Root, execute estes comandos:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Remover index.php da raiz (se existir)
rm -f index.php

# Criar .htaccess correto na raiz
cat > .htaccess << 'EOF'
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteBase /

    # Permitir acesso direto a arquivos e diretórios existentes
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteRule ^ - [L]

    RewriteCond %{REQUEST_FILENAME} -d
    RewriteRule ^ - [L]

    # Redirecionar tudo para public/
    RewriteRule ^(.*)$ public/$1 [L]
</IfModule>

<Files .env>
    Order allow,deny
    Deny from all
</Files>
EOF

chmod 644 .htaccess

# Verificar permissões
chmod 755 .
chmod 755 public/
chmod 644 public/index.php
chmod 644 public/.htaccess

# Limpar cache
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
php artisan optimize:clear
```

---

### **PASSO 3: Testar**

1. **Limpe o cache do navegador:**
   - `Ctrl + Shift + R` (Windows/Linux)
   - `Cmd + Shift + R` (Mac)

2. **Teste o site:**
   - Acesse: `https://betgeniusbr.com/`
   - Deve carregar normalmente agora!

---

## 🔍 SE AINDA NÃO FUNCIONAR

### **Verificar se o Document Root foi alterado corretamente:**

Execute no SSH:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Verificar estrutura
pwd
ls -la | head -10
ls -la public/ | head -10

# Testar se consegue acessar public/index.php
head -5 public/index.php
```

### **Verificar logs do servidor:**

```bash
# Ver últimos erros
tail -50 storage/logs/laravel.log | grep -i "403\|forbidden\|error" | tail -10
```

### **Contatar suporte do Hostinger:**

Se nada funcionar, pode ser uma configuração específica do servidor. Contate o suporte do Hostinger e informe:
- O domínio: `betgeniusbr.com`
- O problema: Erro 403 Forbidden
- O Document Root desejado: `public_html`

---

## 📋 CHECKLIST FINAL

- [ ] Document Root alterado para `public_html` no hPanel
- [ ] Aguardou 2-3 minutos após alterar
- [ ] `index.php` removido da raiz
- [ ] `.htaccess` criado na raiz
- [ ] Permissões ajustadas (755 para diretórios, 644 para arquivos)
- [ ] Cache do Laravel limpo
- [ ] Cache do navegador limpo
- [ ] Testou o site novamente

---

## ⚠️ IMPORTANTE

**O Document Root DEVE estar em `public_html`**, não em `public_html/public`.

O `.htaccess` na raiz redireciona automaticamente tudo para `public/`, então não é necessário apontar o Document Root diretamente para `public/`.

