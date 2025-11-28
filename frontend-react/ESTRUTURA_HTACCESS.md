# 📁 Estrutura de .htaccess - Explicação Completa

## 🤔 Precisa de Dois .htaccess?

**Depende da configuração do servidor!**

---

## 📋 Duas Situações Possíveis

### **Situação 1: Document Root = `public_html/` (Raiz)**

Se o Document Root aponta para `public_html/`, você precisa de **2 arquivos**:

```
public_html/
├── .htaccess          ← Redireciona tudo para public/
└── public/
    ├── .htaccess      ← Regras do React/Laravel
    ├── index.html
    └── assets/
```

**`.htaccess` na raiz (`public_html/.htaccess`):**
```apache
RewriteEngine On
RewriteRule ^$ public/ [L]
RewriteRule (.*) public/$1 [L]
```

**`.htaccess` em `public/` (`public_html/public/.htaccess`):**
```apache
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /
  # ... regras do React/Laravel
</IfModule>
```

---

### **Situação 2: Document Root = `public_html/public/`**

Se o Document Root aponta diretamente para `public/`, você precisa de **1 arquivo apenas**:

```
public_html/
└── public/            ← Document Root aqui
    ├── .htaccess      ← ÚNICO .htaccess necessário
    ├── index.html
    └── assets/
```

**Apenas `.htaccess` em `public/` (`public_html/public/.htaccess`):**
```apache
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /
  # ... regras do React/Laravel
</IfModule>
```

**NÃO precisa de `.htaccess` na raiz!**

---

## 🔍 Como Descobrir Qual Situação Você Tem?

### **Teste 1: Acessar direto**
```
https://betgeniusbr.com/public/index.html
```

**Se funcionar:** Document Root = `public_html/` (precisa de 2 .htaccess)  
**Se não funcionar:** Document Root = `public_html/public/` (precisa de 1 .htaccess)

### **Teste 2: Verificar erro 404**
```
https://betgeniusbr.com/teste123
```

**Se mostrar erro do Laravel:** Document Root = `public_html/public/`  
**Se mostrar 404 genérico:** Document Root = `public_html/`

---

## ✅ Solução Recomendada

### **Opção A: Se Document Root = `public_html/` (2 arquivos)**

**1. `.htaccess` na raiz (`public_html/.htaccess`):**
```apache
RewriteEngine On
RewriteRule ^$ public/ [L]
RewriteRule (.*) public/$1 [L]
```

**2. `.htaccess` em `public/` (`public_html/public/.htaccess`):**
```apache
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /

  # Permitir arquivos e diretórios existentes
  RewriteCond %{REQUEST_FILENAME} -f [OR]
  RewriteCond %{REQUEST_FILENAME} -d
  RewriteRule ^ - [L]

  # API Laravel
  RewriteCond %{REQUEST_URI} ^/api
  RewriteRule ^ index_laravel.php [L]

  # Admin Laravel
  RewriteCond %{REQUEST_URI} ^/admin
  RewriteRule ^ index_laravel.php [L]

  # Storage Laravel
  RewriteCond %{REQUEST_URI} ^/storage
  RewriteRule ^ - [L]

  # React Router
  RewriteRule ^ index.html [L]
</IfModule>

DirectoryIndex index.html index.php
```

---

### **Opção B: Se Document Root = `public_html/public/` (1 arquivo)**

**Apenas `.htaccess` em `public/` (`public_html/public/.htaccess`):**
```apache
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /

  # Permitir arquivos e diretórios existentes
  RewriteCond %{REQUEST_FILENAME} -f [OR]
  RewriteCond %{REQUEST_FILENAME} -d
  RewriteRule ^ - [L]

  # API Laravel
  RewriteCond %{REQUEST_URI} ^/api
  RewriteRule ^ index_laravel.php [L]

  # Admin Laravel
  RewriteCond %{REQUEST_URI} ^/admin
  RewriteRule ^ index_laravel.php [L]

  # Storage Laravel
  RewriteCond %{REQUEST_URI} ^/storage
  RewriteRule ^ - [L]

  # React Router
  RewriteRule ^ index.html [L]
</IfModule>

DirectoryIndex index.html index.php
```

**NÃO precisa de `.htaccess` na raiz!**

---

## 🎯 Como Resolver o 403

### **Passo 1: Testar qual situação você tem**

Tente acessar:
```
https://betgeniusbr.com/public/index.html
```

### **Passo 2: Configurar conforme o resultado**

**Se `/public/index.html` funcionar:**
- ✅ Mantenha `.htaccess` na raiz
- ✅ Configure `.htaccess` em `public/` com as regras do React

**Se `/public/index.html` NÃO funcionar:**
- ✅ Delete `.htaccess` da raiz (se existir)
- ✅ Configure apenas `.htaccess` em `public/` com as regras do React

---

## 📝 Resumo

| Situação | Document Root | .htaccess Raiz | .htaccess Public |
|----------|---------------|----------------|------------------|
| **A** | `public_html/` | ✅ Sim (redireciona) | ✅ Sim (regras) |
| **B** | `public_html/public/` | ❌ Não | ✅ Sim (regras) |

---

## 🔧 Solução Rápida

**Para resolver o 403, tente:**

1. **Manter apenas `.htaccess` em `public/`** (versão simplificada)
2. **Delete ou renomeie `.htaccess` da raiz** temporariamente
3. **Teste:** `https://betgeniusbr.com/`

Se funcionar, você tem Document Root = `public_html/public/` (só precisa de 1 .htaccess)

