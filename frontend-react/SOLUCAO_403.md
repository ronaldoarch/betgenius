# 🔧 Solução Rápida para Erro 403

## ✅ Passos para Corrigir

### **1. Upload do .htaccess Correto**

No gerenciador de arquivos do servidor:

1. Vá para: `public_html/public/`
2. **Delete** o `.htaccess` atual (se existir)
3. **Crie novo** arquivo `.htaccess`
4. **Cole este conteúdo:**

```apache
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /

  # Permitir acesso direto a arquivos e diretórios existentes
  RewriteCond %{REQUEST_FILENAME} -f
  RewriteRule ^ - [L]

  RewriteCond %{REQUEST_FILENAME} -d
  RewriteRule ^ - [L]

  # API do Laravel
  RewriteCond %{REQUEST_URI} ^/api
  RewriteRule ^ index_laravel.php [L]

  # Admin do Laravel
  RewriteCond %{REQUEST_URI} ^/admin
  RewriteRule ^ index_laravel.php [L]

  # Storage do Laravel
  RewriteCond %{REQUEST_URI} ^/storage
  RewriteRule ^ - [L]

  # React Router - todas as outras rotas
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d
  RewriteRule . /index.html [L]
</IfModule>

DirectoryIndex index.html index.php

<Files "index.html">
  Order allow,deny
  Allow from all
  Require all granted
</Files>
```

5. **Salve** o arquivo
6. **Permissões:** `644`

### **2. Verificar Permissões**

No gerenciador de arquivos:

- `index.html` → **644** (rw-r--r--)
- `assets/` (pasta) → **755** (rwxr-xr-x)
- Arquivos dentro de `assets/` → **644**
- `.htaccess` → **644**

### **3. Criar index_laravel.php**

Se não existe, crie `index_laravel.php` em `public_html/public/`:

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
$response = $kernel->handle($request = Request::capture())->send();
$kernel->terminate($request, $response);
```

### **4. Verificar .htaccess na Raiz**

Verifique se existe `.htaccess` em `public_html/` (raiz). Se existir, deve ter:

```apache
RewriteEngine On
RewriteRule ^$ public/ [L]
RewriteRule (.*) public/$1 [L]
```

---

## 🎯 Resumo

1. ✅ Upload `.htaccess` correto em `public/`
2. ✅ Permissões: `index.html` (644), `assets/` (755)
3. ✅ Criar `index_laravel.php`
4. ✅ Testar: `https://betgeniusbr.com/`

---

## 📁 Arquivo Pronto

O arquivo `.htaccess-FINAL` está pronto para upload!

