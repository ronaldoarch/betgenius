# 🔧 Como Corrigir o Erro 403 Forbidden

## 🚨 Problema

Você está recebendo **403 Forbidden** ao acessar `betgeniusbr.com`.

## ✅ Solução

### **1. Verificar/Criar .htaccess**

O `.htaccess` em `public_html/public/` precisa permitir o acesso ao `index.html`.

**Crie/edite o arquivo `.htaccess` em `public_html/public/`:**

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

# DirectoryIndex - priorizar index.html
DirectoryIndex index.html index.php

# Permitir acesso ao index.html
<Files "index.html">
  Order allow,deny
  Allow from all
</Files>
```

### **2. Verificar Permissões**

No gerenciador de arquivos do servidor:

1. Selecione `index.html`
2. Clique direito → **Permissões** ou **Chmod**
3. Defina: `644` (ou `rw-r--r--`)

4. Selecione a pasta `assets/`
5. Clique direito → **Permissões** ou **Chmod**
6. Defina: `755` (ou `rwxr-xr-x`)

7. Selecione `.htaccess`
8. Clique direito → **Permissões** ou **Chmod**
9. Defina: `644` (ou `rw-r--r--`)

### **3. Criar index_laravel.php**

Se ainda não criou, copie o `index.php` do Laravel:

1. No gerenciador de arquivos, encontre `index.php` (se existir)
2. Copie → Cole → Renomeie para `index_laravel.php`

Ou crie um novo arquivo `index_laravel.php` com este conteúdo:

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

### **4. Verificar se index.html existe**

Confirme que `index.html` está em:
- ✅ `public_html/public/index.html`

E que a pasta `assets/` está em:
- ✅ `public_html/public/assets/`

---

## 🔍 Verificações Adicionais

### **Via SSH (se tiver acesso):**

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html/public

# Verificar se arquivos existem
ls -la index.html
ls -la assets/
ls -la .htaccess

# Verificar permissões
ls -l index.html .htaccess
ls -ld assets/

# Corrigir permissões se necessário
chmod 644 index.html
chmod 644 .htaccess
chmod 755 assets
chmod -R 644 assets/*
```

---

## ✅ Checklist

- [ ] `.htaccess` criado/atualizado em `public/`
- [ ] `index.html` com permissão `644`
- [ ] Pasta `assets/` com permissão `755`
- [ ] Arquivos dentro de `assets/` com permissão `644`
- [ ] `.htaccess` com permissão `644`
- [ ] `index_laravel.php` criado (para API/Admin)
- [ ] Testar: `https://betgeniusbr.com/`

---

## 🎯 Próximos Passos

1. **Upload do `.htaccess` correto**
2. **Verificar permissões**
3. **Criar `index_laravel.php`**
4. **Testar novamente**

Se ainda der erro 403, pode ser:
- Configuração do servidor bloqueando
- Problema com o .htaccess na raiz (`public_html/.htaccess`)
- Permissões incorretas na pasta `public/`

