# 🚨 INSTRUÇÕES FINAIS - ERRO 403

## ⚠️ PROBLEMA

O erro **403 Forbidden** está persistindo. A causa mais provável é o **Document Root incorreto** no hPanel.

---

## ✅ SOLUÇÃO - PASSO A PASSO

### **PASSO 1: Verificar Document Root no hPanel (CRÍTICO!)**

1. **Acesse:** https://hpanel.hostinger.com/
2. **Faça login** com suas credenciais
3. **Vá em:** Domínios → betgeniusbr.com
4. **Clique em:** "Gerenciar" ou "Configurações" ou "Avançado"
5. **Procure por:** "Document Root" ou "Raiz do Documento" ou "Root Directory"
6. **Verifique o valor atual:**
   - ❌ **ERRADO:** `public_html/public`
   - ❌ **ERRADO:** `domains/betgeniusbr.com/public_html/public`
   - ✅ **CORRETO:** `public_html`
   - ✅ **CORRETO:** `domains/betgeniusbr.com/public_html`
7. **Se estiver ERRADO:**
   - Clique em "Editar" ou "Alterar"
   - Altere para: `public_html` (SEM `/public` no final)
   - Clique em "Salvar" ou "Aplicar"
   - **AGUARDE 2-3 MINUTOS** para propagar

---

### **PASSO 2: Executar Comandos no SSH**

Depois de alterar o Document Root, execute:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Remover index.php da raiz
rm -f index.php

# Criar .htaccess na raiz
cat > .htaccess << 'EOF'
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteBase /
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteRule ^ - [L]
    RewriteCond %{REQUEST_FILENAME} -d
    RewriteRule ^ - [L]
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule ^(.*)$ public/$1 [L]
</IfModule>
<Files .env>
    Order allow,deny
    Deny from all
</Files>
EOF

chmod 644 .htaccess

# Criar .htaccess em public/
cat > public/.htaccess << 'EOF'
<IfModule mod_rewrite.c>
    <IfModule mod_negotiation.c>
        Options -MultiViews -Indexes
    </IfModule>
    RewriteEngine On
    RewriteCond %{HTTP:Authorization} .
    RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]
    RewriteCond %{REQUEST_FILENAME} -f
    RewriteRule ^ - [L]
    RewriteCond %{REQUEST_FILENAME} -d
    RewriteRule ^ - [L]
    RewriteCond %{REQUEST_URI} ^/api
    RewriteRule ^ index.php [L]
    RewriteCond %{REQUEST_URI} ^/admin
    RewriteRule ^ index.php [L]
    RewriteCond %{REQUEST_URI} ^/storage
    RewriteRule ^ index.php [L]
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_URI} ^(.+)/$
    RewriteRule ^ %1 [L,R=301]
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_URI} !^/api
    RewriteCond %{REQUEST_URI} !^/admin
    RewriteCond %{REQUEST_URI} !^/storage
    RewriteRule ^ index.html [L]
</IfModule>
DirectoryIndex index.html index.php
<IfModule mod_mime.c>
    AddType application/javascript js
    AddType application/javascript mjs
    AddType text/javascript js
    AddType text/css css
    AddType image/svg+xml svg svgz
    AddType application/json json
    AddType application/wasm wasm
    AddType font/woff2 woff2
    AddType font/woff woff
    AddType font/ttf ttf
</IfModule>
<FilesMatch "\.(js|mjs)$">
    <IfModule mod_headers.c>
        Header set Content-Type "application/javascript; charset=utf-8"
    </IfModule>
</FilesMatch>
EOF

chmod 644 public/.htaccess

# Ajustar permissões
chmod 755 .
chmod 755 public/
chmod 644 public/index.php 2>/dev/null
chmod 644 public/index.html 2>/dev/null

# Limpar cache
php artisan config:clear 2>/dev/null
php artisan cache:clear 2>/dev/null
php artisan route:clear 2>/dev/null
php artisan view:clear 2>/dev/null
php artisan optimize:clear 2>/dev/null

echo "✅ Configuração concluída!"
```

---

### **PASSO 3: Fazer Upload do React (se necessário)**

Se o `index.html` do React não existir, faça upload:

1. **Via FileZilla ou SSH:**
   - `frontend-react/dist/index.html` → `public_html/public/index.html`
   - `frontend-react/dist/assets/*` → `public_html/public/assets/*`

---

### **PASSO 4: Testar**

1. **Limpe o cache do navegador:** `Ctrl + Shift + R` (ou `Cmd + Shift + R` no Mac)
2. **Acesse:** `https://betgeniusbr.com/`
3. **Aguarde 2-3 minutos** se acabou de alterar o Document Root

---

## 🔍 SE AINDA NÃO FUNCIONAR

### **Execute diagnóstico:**

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Verificar estrutura
pwd
ls -la | head -10
ls -la public/ | head -10

# Verificar se index.html existe
ls -la public/index.html

# Verificar .htaccess
cat .htaccess
cat public/.htaccess
```

### **Contatar suporte do Hostinger:**

Se nada funcionar, contate o suporte e informe:
- Domínio: `betgeniusbr.com`
- Problema: Erro 403 Forbidden persistente
- Document Root desejado: `public_html`
- Já tentou: Alterar Document Root, corrigir .htaccess, ajustar permissões

---

## 📋 CHECKLIST

- [ ] Document Root alterado para `public_html` no hPanel
- [ ] Aguardou 2-3 minutos após alterar
- [ ] Executou comandos no SSH
- [ ] `index.php` removido da raiz
- [ ] `.htaccess` criado na raiz
- [ ] `.htaccess` criado em public/
- [ ] Permissões ajustadas
- [ ] Cache limpo
- [ ] `index.html` do React feito upload (se necessário)
- [ ] Cache do navegador limpo
- [ ] Testou o site

---

## ⚠️ IMPORTANTE

**O Document Root DEVE estar em `public_html`**, não em `public_html/public`.

O `.htaccess` na raiz redireciona automaticamente tudo para `public/`, então não é necessário apontar o Document Root diretamente para `public/`.

