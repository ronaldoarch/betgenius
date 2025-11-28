# ⚠️ CORREÇÃO URGENTE - Arquivos Trocados!

## 🚨 Problema Identificado

O arquivo `index_laravel.php` está com código de `.htaccess` ao invés de código PHP!

---

## ✅ CORREÇÃO IMEDIATA

### **1. Corrigir index_laravel.php**

No gerenciador de arquivos do servidor:

1. Vá para: `public_html/public/`
2. **Delete** o arquivo `index_laravel.php` atual (que tem código de .htaccess)
3. **Crie novo** arquivo `index_laravel.php`
4. **Cole este conteúdo PHP:**

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

5. **Salve** o arquivo
6. **Permissões:** `644`

---

### **2. Corrigir .htaccess**

O `.htaccess` deve estar em `public_html/public/.htaccess` (não dentro do index_laravel.php).

1. Vá para: `public_html/public/`
2. **Crie/edite** o arquivo `.htaccess`
3. **Cole este conteúdo:**

```apache
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /

  # Permitir acesso direto a arquivos e diretórios existentes
  RewriteCond %{REQUEST_FILENAME} -f
  RewriteRule ^ - [L]

  RewriteCond %{REQUEST_FILENAME} -d
  RewriteRule ^ - [L]

  # API do Laravel - redireciona para index_laravel.php
  RewriteCond %{REQUEST_URI} ^/api
  RewriteRule ^ index_laravel.php [L]

  # Admin do Laravel (Filament) - redireciona para index_laravel.php
  RewriteCond %{REQUEST_URI} ^/admin
  RewriteRule ^ index_laravel.php [L]

  # Storage do Laravel - permite acesso direto
  RewriteCond %{REQUEST_URI} ^/storage
  RewriteRule ^ - [L]

  # Todas as outras rotas vão para index.html (React Router)
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

4. **Salve** o arquivo
5. **Permissões:** `644`

---

## 📁 Estrutura Correta

```
public_html/public/
├── index.html          (React - página principal)
├── index_laravel.php   (PHP - para API/Admin)
├── .htaccess          (Apache - regras de roteamento)
└── assets/            (CSS, JS do React)
    ├── index-xxx.js
    └── index-xxx.css
```

---

## ✅ Checklist

- [ ] `index_laravel.php` contém código **PHP** (não .htaccess)
- [ ] `.htaccess` está em `public/` (não dentro do PHP)
- [ ] `index.html` existe em `public/`
- [ ] Pasta `assets/` existe em `public/`
- [ ] Permissões corretas (644 para arquivos, 755 para pastas)

---

## 🎯 Resumo

**Dois arquivos separados:**

1. **`.htaccess`** → Regras do Apache (em `public/`)
2. **`index_laravel.php`** → Código PHP do Laravel (em `public/`)

**NÃO misture!** Cada um tem sua função.

---

## 📝 Arquivos Prontos

- ✅ `index_laravel.php` → Código PHP correto
- ✅ `.htaccess-CORRETO` → Regras do Apache corretas

**Use esses arquivos!**

