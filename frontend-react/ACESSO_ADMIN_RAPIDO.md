# 🔐 ACESSO AO ADMIN - Resumo Rápido

## 🎯 URL do Admin

```
https://betgeniusbr.com/admin
```

**Ou:**

```
https://betgeniusbr.com/admin/login
```

---

## ✅ Como Funciona

O `.htaccess` já está configurado para:

1. **`/admin`** → Redireciona para Laravel (Filament Admin)
2. **`/api`** → Redireciona para Laravel (API)
3. **Todas as outras rotas** → React (site principal)

---

## 📁 Arquivos Necessários no Servidor

Certifique-se de que estes arquivos estão em `public_html/public/`:

```
public_html/public/
├── index.html              ← React (site principal)
├── index_laravel.php       ← Laravel (admin + API) ⚠️ IMPORTANTE!
├── .htaccess              ← Configuração de rotas
└── assets/                ← Arquivos React
```

---

## ⚠️ Se o Admin Não Funcionar

### **1. Verificar se `index_laravel.php` existe**

No servidor, verifique:
```
public_html/public/index_laravel.php
```

**Se não existir**, copie de:
- Local: `frontend-react/index_laravel.php`
- Para: `public_html/public/index_laravel.php`

---

### **2. Verificar `.htaccess`**

O arquivo `.htaccess` deve ter esta regra:

```apache
# Admin Laravel
RewriteCond %{REQUEST_URI} ^/admin
RewriteRule ^ index_laravel.php [L]
```

**Esta regra deve estar ANTES da regra do React!**

---

### **3. Verificar `.env` do Laravel**

No servidor, verifique:
```
public_html/.env
```

Procure por:
```env
FILAMENT_BASE_URL=admin
```

**Se estiver diferente**, o admin estará em outro path.

---

## 🚀 Teste Rápido

1. Acesse: `https://betgeniusbr.com/admin`
2. Deve aparecer a tela de login do Filament
3. Se aparecer erro 404, verifique os arquivos acima

---

## 📝 Estrutura Esperada

```
public_html/
├── app/                    ← Laravel
├── bootstrap/              ← Laravel
├── vendor/                 ← Laravel
├── .env                    ← Laravel (FILAMENT_BASE_URL=admin)
└── public/
    ├── index.html          ← React
    ├── index_laravel.php   ← Laravel entry point
    ├── .htaccess          ← Rotas
    └── assets/            ← React assets
```

---

## ✅ Resumo

- **Site:** `https://betgeniusbr.com/` → React
- **Admin:** `https://betgeniusbr.com/admin` → Laravel/Filament
- **API:** `https://betgeniusbr.com/api/*` → Laravel

**Tudo funciona na mesma raiz!** 🎉

