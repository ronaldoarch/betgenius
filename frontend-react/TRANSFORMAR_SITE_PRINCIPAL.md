# 🚀 Como Transformar o React no Site Principal

## 📋 Opções Disponíveis

Você tem **2 opções** para transformar o React no site principal:

---

## ✅ **OPÇÃO 1: React na Raiz (Recomendado)**

O React substitui completamente o Laravel na raiz do site.

### Passo 1: Configurar Base Path

Edite `vite.config.js`:

```javascript
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  base: '/', // Mudar de '/app/' para '/'
  server: {
    port: 3000,
    proxy: {
      '/api': {
        target: 'https://betgeniusbr.com',
        changeOrigin: true,
        secure: false
      }
    }
  }
})
```

### Passo 2: Fazer Build

```bash
cd /Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/frontend-react
npm run build
```

### Passo 3: Backup do Laravel (Importante!)

**ANTES de substituir, faça backup:**

```bash
# No servidor via SSH
cd /home/u127271520/domains/betgeniusbr.com/public_html/public

# Criar backup do index.php atual
cp index.php index.php.backup

# Criar backup do .htaccess
cp .htaccess .htaccess.backup
```

### Passo 4: Substituir Arquivos

**Via FileZilla ou SSH:**

1. **Substituir `index.html` do React:**
   - Local: `frontend-react/dist/index.html`
   - Remoto: `public_html/public/index.html`

2. **Substituir/Criar pasta `assets`:**
   - Local: `frontend-react/dist/assets/` (todos os arquivos)
   - Remoto: `public_html/public/assets/` (substituir tudo)

3. **Criar novo `.htaccess` para React:**

Crie/edite `public_html/public/.htaccess`:

```apache
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /

  # Permitir acesso direto a arquivos estáticos
  RewriteCond %{REQUEST_FILENAME} -f
  RewriteRule ^ - [L]

  # Permitir acesso à API do Laravel
  RewriteCond %{REQUEST_URI} ^/api
  RewriteRule ^ - [L]

  # Permitir acesso ao admin (Filament)
  RewriteCond %{REQUEST_URI} ^/admin
  RewriteRule ^ - [L]

  # Permitir acesso ao storage
  RewriteCond %{REQUEST_URI} ^/storage
  RewriteRule ^ - [L]

  # Todas as outras rotas vão para index.html (React Router)
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d
  RewriteRule . /index.html [L]
</IfModule>

# Cache para assets
<IfModule mod_expires.c>
  ExpiresActive On
  ExpiresByType image/jpg "access plus 1 year"
  ExpiresByType image/jpeg "access plus 1 year"
  ExpiresByType image/gif "access plus 1 year"
  ExpiresByType image/png "access plus 1 year"
  ExpiresByType image/webp "access plus 1 year"
  ExpiresByType text/css "access plus 1 month"
  ExpiresByType application/javascript "access plus 1 month"
</IfModule>
```

### Passo 5: Manter Laravel Funcionando

O Laravel ainda precisa funcionar para:
- API (`/api/*`)
- Admin (`/admin/*`)
- Storage (`/storage/*`)

**Criar `public_html/public/index_laravel.php`:**

```php
<?php
// Este arquivo será usado pelo .htaccess para rotas da API
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

**Atualizar `.htaccess` para usar Laravel nas rotas da API:**

```apache
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /

  # API do Laravel
  RewriteCond %{REQUEST_URI} ^/api
  RewriteRule ^ index_laravel.php [L]

  # Admin do Laravel (Filament)
  RewriteCond %{REQUEST_URI} ^/admin
  RewriteRule ^ index_laravel.php [L]

  # Storage do Laravel
  RewriteCond %{REQUEST_URI} ^/storage
  RewriteRule ^ - [L]

  # Permitir acesso direto a arquivos estáticos
  RewriteCond %{REQUEST_FILENAME} -f
  RewriteRule ^ - [L]

  # Todas as outras rotas vão para index.html (React)
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d
  RewriteRule . /index.html [L]
</IfModule>
```

---

## ✅ **OPÇÃO 2: React em Subpasta (Mais Seguro)**

Manter Laravel na raiz e React em `/app/` (já configurado).

### Vantagens:
- ✅ Não interfere no Laravel
- ✅ Fácil de reverter
- ✅ Admin continua funcionando normalmente

### Desvantagens:
- ❌ URL: `betgeniusbr.com/app/` (não na raiz)

**Já está configurado!** Apenas faça upload para `/public_html/public/app/`

---

## 🎯 **RECOMENDAÇÃO: Opção 1 (React na Raiz)**

Para transformar o React no site principal:

### Script Completo de Deploy:

```bash
# 1. No seu computador - Fazer build
cd /Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/frontend-react

# Editar vite.config.js (mudar base: '/app/' para base: '/')
# Depois:
npm run build

# 2. No servidor via SSH
ssh u127271520@betgeniusbr.com

cd /home/u127271520/domains/betgeniusbr.com/public_html/public

# Backup
cp index.php index.php.backup
cp .htaccess .htaccess.backup

# Criar index_laravel.php para API
cp index.php index_laravel.php

# 3. Via FileZilla - Upload dos arquivos do React
# - Upload index.html do dist/ para public/
# - Upload pasta assets/ do dist/ para public/
# - Substituir .htaccess com o novo conteúdo
```

---

## 📝 **Checklist Final**

- [ ] `vite.config.js` com `base: '/'`
- [ ] Build executado (`npm run build`)
- [ ] Backup do `index.php` e `.htaccess` do Laravel
- [ ] `index_laravel.php` criado
- [ ] `index.html` do React na raiz
- [ ] Pasta `assets/` do React na raiz
- [ ] Novo `.htaccess` configurado
- [ ] Testar: `https://betgeniusbr.com/` → React
- [ ] Testar: `https://betgeniusbr.com/api/` → Laravel API
- [ ] Testar: `https://betgeniusbr.com/admin/` → Admin Laravel

---

## 🔄 **Como Reverter (Se Precisar)**

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html/public
mv index.php.backup index.php
mv .htaccess.backup .htaccess
rm index_laravel.php
```

---

## ⚠️ **IMPORTANTE**

1. **Sempre faça backup antes!**
2. **Teste em ambiente de desenvolvimento primeiro**
3. **Mantenha o Laravel funcionando para API e Admin**
4. **Verifique se todas as rotas da API funcionam**

---

## 🚀 **Pronto para Deploy?**

Se quiser, posso:
1. ✅ Atualizar o `vite.config.js` para `base: '/'`
2. ✅ Criar o novo `.htaccess` completo
3. ✅ Criar script de deploy automatizado

**Diga qual opção você prefere!**

