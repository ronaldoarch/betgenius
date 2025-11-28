# 🔄 REVERTER PARA ESTRUTURA ORIGINAL

## 🎯 Objetivo

Voltar ao estado original, antes de definir o React como site principal.

---

## 📋 O Que Fazer

### **1. No Servidor (public_html/public/)**

#### **DELETAR arquivos do React:**
- ❌ `index.html` (do React)
- ❌ `assets/` (pasta do React)
- ❌ `index_laravel.php` (arquivo que criamos)
- ❌ `.htaccess` (que modificamos)

#### **RESTAURAR arquivos originais do Laravel:**
- ✅ `index.php` (original do Laravel)
- ✅ `.htaccess` (original do Laravel, se existia)

---

## 🔍 Estrutura Original Esperada

```
public_html/
├── app/
├── bootstrap/
├── config/
├── database/
├── public/              ← Laravel public
│   ├── index.php       ← Laravel entry point (ORIGINAL)
│   ├── .htaccess       ← Laravel .htaccess (ORIGINAL)
│   └── ... (outros arquivos Laravel)
└── ...
```

---

## ✅ Passos para Reverter

### **Passo 1: Backup (Opcional mas Recomendado)**

Antes de deletar, faça backup dos arquivos atuais:
- `index.html`
- `assets/`
- `index_laravel.php`
- `.htaccess`

### **Passo 2: Deletar Arquivos do React**

No servidor (`public_html/public/`):

1. **DELETAR** `index.html` (do React)
2. **DELETAR** pasta `assets/` (do React)
3. **DELETAR** `index_laravel.php` (se existir)
4. **DELETAR** `.htaccess` (modificado)

### **Passo 3: Restaurar index.php Original**

O arquivo `index.php` original do Laravel deve estar em:
```
public_html/public/index.php
```

**Se não existir**, você pode restaurar do backup ou criar um novo baseado no padrão do Laravel.

### **Passo 4: Restaurar .htaccess Original**

Se você tinha um `.htaccess` original do Laravel, restaure-o.

**Se não tiver backup**, o Laravel geralmente funciona sem `.htaccess` ou você pode usar um padrão:

```apache
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
```

---

## 🎯 Verificar se Voltou ao Normal

### **1. Testar Site Principal**

Acesse: `https://betgeniusbr.com/`

**Deve mostrar:**
- ✅ Laravel (não React)
- ✅ Página inicial do Laravel ou redirecionamento

### **2. Testar Admin**

Acesse: `https://betgeniusbr.com/admin`

**Deve mostrar:**
- ✅ Login do Filament Admin

### **3. Testar API**

Acesse: `https://betgeniusbr.com/api/...`

**Deve funcionar:**
- ✅ Endpoints da API Laravel

---

## 📝 Checklist de Reversão

- [ ] Backup feito (opcional)
- [ ] `index.html` (React) deletado
- [ ] Pasta `assets/` (React) deletada
- [ ] `index_laravel.php` deletado
- [ ] `.htaccess` modificado deletado
- [ ] `index.php` original do Laravel restaurado
- [ ] `.htaccess` original do Laravel restaurado
- [ ] Site principal testado (deve mostrar Laravel)
- [ ] Admin testado (deve funcionar)
- [ ] API testada (deve funcionar)

---

## 🚨 Se Algo Não Funcionar

### **1. Verificar index.php**

O arquivo `index.php` deve apontar para o Laravel:

```php
<?php

use Illuminate\Contracts\Http\Kernel;
use Illuminate\Http\Request;

define('LARAVEL_START', microtime(true));

if (file_exists($maintenance = __DIR__.'/../storage/framework/maintenance.php')) {
    require $maintenance;
}

require __DIR__.'/../vendor/autoload.php';

$app = require_once __DIR__.'/../bootstrap/app.php';

$kernel = $app->make(Kernel::class);

$response = $kernel->handle(
    $request = Request::capture()
)->send();

$kernel->terminate($request, $response);
```

### **2. Verificar Permissões**

```
index.php    → 644
.htaccess    → 644
```

### **3. Limpar Cache do Laravel**

Se tiver acesso SSH:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
```

---

## ✅ Depois de Reverter

O site deve voltar a funcionar como antes:
- Laravel como site principal
- Admin em `/admin`
- API em `/api/*`
- React pode ser movido para uma subpasta (ex: `/app/`) se necessário

