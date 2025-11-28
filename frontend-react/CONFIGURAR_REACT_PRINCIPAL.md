# 🎯 Configurar React como Site Principal

## 📋 Situação Atual

- React está em: `public_html/public/app/`
- Laravel está em: `public_html/public/`
- Você quer: React na raiz (`betgeniusbr.com/`) mas manter Laravel funcionando

---

## ✅ SOLUÇÃO: Configurar .htaccess

### **Opção 1: .htaccess na raiz do public_html (Recomendado)**

Se o Document Root aponta para `public_html/public/`, crie/atualize o `.htaccess` em `public_html/public/`:

```apache
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /

  # Arquivos e diretórios existentes - permitir acesso direto
  RewriteCond %{REQUEST_FILENAME} -f [OR]
  RewriteCond %{REQUEST_FILENAME} -d
  RewriteRule ^ - [L]

  # API Laravel
  RewriteCond %{REQUEST_URI} ^/api
  RewriteRule ^ index.php [L]

  # Admin Laravel
  RewriteCond %{REQUEST_URI} ^/admin
  RewriteRule ^ index.php [L]

  # Storage Laravel
  RewriteCond %{REQUEST_URI} ^/storage
  RewriteRule ^ - [L]

  # React está em /app/ - redirecionar raiz para lá
  RewriteCond %{REQUEST_URI} ^/$
  RewriteRule ^ app/ [L]

  # Todas as outras rotas vão para o React em /app/
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d
  RewriteCond %{REQUEST_URI} !^/app/
  RewriteRule ^(.*)$ app/$1 [L]
</IfModule>

# Priorizar index.html do React
DirectoryIndex app/index.html index.php
```

---

### **Opção 2: Se o Document Root aponta para public_html**

Se o Document Root aponta para `public_html/` (não `public_html/public/`), crie o `.htaccess` em `public_html/`:

```apache
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /

  # Arquivos e diretórios existentes - permitir acesso direto
  RewriteCond %{REQUEST_FILENAME} -f [OR]
  RewriteCond %{REQUEST_FILENAME} -d
  RewriteRule ^ - [L]

  # API Laravel
  RewriteCond %{REQUEST_URI} ^/api
  RewriteRule ^ public/index.php [L]

  # Admin Laravel
  RewriteCond %{REQUEST_URI} ^/admin
  RewriteRule ^ public/index.php [L]

  # Storage Laravel
  RewriteCond %{REQUEST_URI} ^/storage
  RewriteRule ^ public/ [L]

  # React está em public/app/ - redirecionar raiz para lá
  RewriteCond %{REQUEST_URI} ^/$
  RewriteRule ^ public/app/ [L]

  # Todas as outras rotas vão para o React em public/app/
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d
  RewriteCond %{REQUEST_URI} !^/public/app/
  RewriteRule ^(.*)$ public/app/$1 [L]
</IfModule>

# Priorizar index.html do React
DirectoryIndex public/app/index.html public/index.php
```

---

## 📋 Passos para Implementar

### **1. Verificar onde está o Document Root**

No hPanel ou via SSH, verifique para onde o Document Root aponta:
- `public_html/` ou
- `public_html/public/`

### **2. Fazer Backup do .htaccess Atual**

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html/public
cp .htaccess .htaccess.backup
```

### **3. Criar/Atualizar .htaccess**

Use a Opção 1 ou 2 acima, dependendo do seu Document Root.

### **4. Verificar Estrutura de Arquivos**

Certifique-se de que:
- React está em: `public_html/public/app/` (ou `public_html/public/app/`)
- Laravel está em: `public_html/public/`
- `.htaccess` está no lugar correto

### **5. Testar**

- 🌐 `https://betgeniusbr.com/` → Deve mostrar React
- 🔐 `https://betgeniusbr.com/admin` → Deve mostrar Laravel Admin
- 🔌 `https://betgeniusbr.com/api/...` → Deve funcionar Laravel API

---

## 🔍 Verificar Estrutura Atual

Execute no SSH:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html
ls -la public/app/
```

Deve mostrar:
- `index.html`
- `assets/`
- Outros arquivos do React

---

## ⚠️ IMPORTANTE

- Não delete arquivos do Laravel
- Apenas configure o `.htaccess` para redirecionar
- O React continuará em `/app/` mas será acessível na raiz

