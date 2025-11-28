# 🔐 Como Acessar o Admin

## ✅ Configuração Atual

O admin está configurado para funcionar **junto** com o React na raiz!

---

## 🎯 URL de Acesso

### **Admin Panel (Filament):**

```
https://betgeniusbr.com/admin
```

**Ou:**

```
https://betgeniusbr.com/admin/login
```

---

## 📋 Como Funciona

### **1. Estrutura de Rotas**

O `.htaccess` está configurado para:

- ✅ **`/admin`** → Redireciona para Laravel (admin)
- ✅ **`/api`** → Redireciona para Laravel (API)
- ✅ **`/storage`** → Acesso direto aos arquivos
- ✅ **Todas as outras rotas** → React (site principal)

### **2. Arquivos Necessários**

No servidor (`public_html/public/`):

```
public_html/public/
├── index.html              ← React (site principal)
├── index_laravel.php       ← Laravel (admin + API)
├── .htaccess              ← Configuração de rotas
└── assets/                ← Arquivos React
```

---

## ⚠️ IMPORTANTE: Verificar `index_laravel.php`

O arquivo `index_laravel.php` **DEVE** estar no servidor em:

```
public_html/public/index_laravel.php
```

**Se não estiver, copie de:**
- Local: `frontend-react/index_laravel.php`
- Para: `public_html/public/index_laravel.php`

---

## 🔍 Verificar Configuração do Admin

### **1. Verificar `.env` do Laravel**

No servidor, verifique o arquivo:
```
public_html/.env
```

Procure por:
```env
FILAMENT_BASE_URL=admin
```

**Se estiver diferente**, o admin estará em outro path. Exemplos:
- `FILAMENT_BASE_URL=admin` → Acesse em `/admin`
- `FILAMENT_BASE_URL=panel` → Acesse em `/panel`
- `FILAMENT_BASE_URL=` (vazio) → Acesse em `/` (mas isso conflita com React!)

---

## ✅ Checklist de Acesso ao Admin

- [ ] Arquivo `index_laravel.php` está em `public_html/public/`
- [ ] Arquivo `.htaccess` está em `public_html/public/` com as regras corretas
- [ ] `.env` do Laravel tem `FILAMENT_BASE_URL=admin`
- [ ] Tentar acessar: `https://betgeniusbr.com/admin`
- [ ] Deve aparecer a tela de login do Filament

---

## 🚨 Problemas Comuns

### **1. Erro 404 ao acessar `/admin`**

**Causa:** `index_laravel.php` não está no servidor ou `.htaccess` não está configurado.

**Solução:**
1. Verifique se `index_laravel.php` existe em `public_html/public/`
2. Verifique se `.htaccess` tem a regra para `/admin`
3. Limpe o cache do Laravel: `php artisan config:clear`

---

### **2. Admin aparece, mas React não funciona**

**Causa:** `.htaccess` está redirecionando tudo para Laravel.

**Solução:**
1. Verifique a ordem das regras no `.htaccess`
2. A regra do React (`RewriteRule ^ index.html [L]`) deve ser a **última**

---

### **3. React funciona, mas Admin não**

**Causa:** Regra do `/admin` não está funcionando.

**Solução:**
1. Verifique se a regra está **antes** da regra do React
2. Teste acessando diretamente: `https://betgeniusbr.com/index_laravel.php`
3. Se funcionar, o problema é no `.htaccess`

---

## 📝 Exemplo de `.htaccess` Correto

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
  RewriteRule ^ index_laravel.php [L]

  # Admin Laravel
  RewriteCond %{REQUEST_URI} ^/admin
  RewriteRule ^ index_laravel.php [L]

  # Storage Laravel
  RewriteCond %{REQUEST_URI} ^/storage
  RewriteRule ^ - [L]

  # React Router - todas as outras rotas
  RewriteRule ^ index.html [L]
</IfModule>

# Priorizar index.html
DirectoryIndex index.html index.php
```

---

## 🎯 Resumo

1. **Site Principal (React):** `https://betgeniusbr.com/`
2. **Admin (Laravel/Filament):** `https://betgeniusbr.com/admin`
3. **API (Laravel):** `https://betgeniusbr.com/api/*`

**Tudo funciona na mesma raiz!** 🎉

