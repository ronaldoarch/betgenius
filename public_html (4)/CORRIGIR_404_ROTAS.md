# 🔧 Corrigir Erro 404 nas Rotas do Laravel

## 🎯 Problema

A URL `betgeniusbr.com/profile/deposit` está retornando **404 NOT FOUND**, indicando que o Laravel não está processando as rotas corretamente.

---

## 🔍 DIAGNÓSTICO RÁPIDO (Execute no SSH)

Conecte ao servidor e execute estes comandos:

```bash
ssh -p 65002 u127271520@betgeniusbr.com
cd /home/u127271520/domains/betgeniusbr.com/public_html
```

### 1️⃣ Verificar se as Rotas Estão Registradas

```bash
php artisan route:list | grep profile
```

**Se não mostrar nada:** As rotas não estão registradas. Pule para a seção "Limpar Cache".

**Se mostrar as rotas:** O problema é no `.htaccess` ou Document Root.

---

## ⚡ SOLUÇÃO 1: Limpar Cache do Laravel

```bash
# Limpar todos os caches
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
php artisan optimize

# Re-cachear as rotas
php artisan route:cache

# Verificar novamente
php artisan route:list | grep profile
```

---

## ⚡ SOLUÇÃO 2: Verificar e Corrigir .htaccess

### A) Verificar o .htaccess na Raiz

```bash
cat .htaccess
```

**Deve conter:**
```apache
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteRule ^(.*)$ public/$1 [L]
</IfModule>
```

**Se estiver errado ou não existir, crie-o:**

```bash
cat > .htaccess << 'HTACCESS'
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteRule ^(.*)$ public/$1 [L]
</IfModule>
HTACCESS

chmod 644 .htaccess
```

### B) Verificar o .htaccess na Pasta public

```bash
cat public/.htaccess
```

**Deve conter:**
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

**Se estiver errado ou não existir, crie-o:**

```bash
cat > public/.htaccess << 'HTACCESS'
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
HTACCESS

chmod 644 public/.htaccess
```

---

## ⚡ SOLUÇÃO 3: Verificar Permissões

```bash
# Verificar permissões dos arquivos
ls -la .htaccess
ls -la public/.htaccess
ls -la public/index.php

# Corrigir permissões se necessário
chmod 644 .htaccess
chmod 644 public/.htaccess
chmod 644 public/index.php
chmod 755 public

# Verificar owner
ls -la | grep public
```

**Owner deve ser:** `u127271520:o1008122165`

**Se estiver errado:**
```bash
chown -R u127271520:o1008122165 .
```

---

## ⚡ SOLUÇÃO 4: Verificar Document Root

Execute este comando para ver a configuração do Apache/Nginx:

```bash
# Ver a configuração do domínio
cat ~/.htpasswd 2>/dev/null || echo "Arquivo não encontrado"

# Verificar se o symbolic link está correto
ls -la /home/u127271520/domains/betgeniusbr.com/
```

**O Document Root deve apontar para:**
```
/home/u127271520/domains/betgeniusbr.com/public_html
```

---

## ⚡ SOLUÇÃO 5: Testar Acesso Direto ao index.php

Teste se o Laravel está funcionando acessando diretamente o `index.php`:

```bash
# Via curl
curl -I https://betgeniusbr.com/index.php

# Ou no navegador, acesse:
# https://betgeniusbr.com/index.php
```

**Se funcionar:** O problema é no `.htaccess` (mod_rewrite não está funcionando)

**Se não funcionar:** O problema é mais profundo (PHP/Laravel não está funcionando)

---

## ⚡ SOLUÇÃO 6: Verificar Logs de Erro

```bash
# Ver últimos erros do Laravel
tail -20 storage/logs/laravel.log

# Ver erros do Apache (se disponível)
tail -20 ~/logs/error.log 2>/dev/null || echo "Log do Apache não acessível"
```

---

## 🧪 SCRIPT COMPLETO DE CORREÇÃO

Copie e cole este bloco completo no SSH:

```bash
#!/bin/bash

echo "🔧 CORRIGINDO ERRO 404 DO LARAVEL"
echo "=================================="
echo ""

cd /home/u127271520/domains/betgeniusbr.com/public_html

# 1. Limpar cache
echo "1/6 Limpando cache..."
php artisan config:clear > /dev/null 2>&1
php artisan cache:clear > /dev/null 2>&1
php artisan route:clear > /dev/null 2>&1
php artisan view:clear > /dev/null 2>&1
php artisan optimize > /dev/null 2>&1
echo "   ✅ Cache limpo"
echo ""

# 2. Verificar e corrigir .htaccess raiz
echo "2/6 Corrigindo .htaccess raiz..."
cat > .htaccess << 'HTACCESS'
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteRule ^(.*)$ public/$1 [L]
</IfModule>
HTACCESS
chmod 644 .htaccess
echo "   ✅ .htaccess raiz corrigido"
echo ""

# 3. Verificar e corrigir .htaccess public
echo "3/6 Corrigindo .htaccess public..."
cat > public/.htaccess << 'HTACCESS'
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
HTACCESS
chmod 644 public/.htaccess
echo "   ✅ .htaccess public corrigido"
echo ""

# 4. Corrigir permissões
echo "4/6 Corrigindo permissões..."
chmod 755 public
chmod 644 public/index.php
chmod -R 775 storage bootstrap/cache
echo "   ✅ Permissões corrigidas"
echo ""

# 5. Re-cachear rotas
echo "5/6 Re-cacheando rotas..."
php artisan route:cache > /dev/null 2>&1
echo "   ✅ Rotas cacheadas"
echo ""

# 6. Verificar rotas
echo "6/6 Verificando rotas..."
echo ""
php artisan route:list | grep -E '(profile|deposit)' | head -10
echo ""

echo "=================================="
echo "✅ CORREÇÃO CONCLUÍDA!"
echo "=================================="
echo ""
echo "🧪 TESTAR AGORA:"
echo "   1. Acesse: https://betgeniusbr.com"
echo "   2. Acesse: https://betgeniusbr.com/profile/deposit"
echo ""
echo "Se ainda não funcionar, execute:"
echo "   tail -20 storage/logs/laravel.log"
echo ""
```

---

## 🎯 Depois de Executar as Correções

### Teste no Navegador:
1. **Limpe o cache do navegador** (Ctrl+Shift+R ou Cmd+Shift+R)
2. Acesse: `https://betgeniusbr.com`
3. Acesse: `https://betgeniusbr.com/profile/deposit`

### Se Ainda Não Funcionar:

**Opção A: Verificar no Tinker**
```bash
php artisan tinker
```

Dentro do Tinker:
```php
// Verificar se a rota existe
Route::has('profile.deposit'); // deve retornar true

// Listar todas as rotas
collect(Route::getRoutes())->map->getName()->filter();

exit
```

**Opção B: Criar Arquivo de Teste**
```bash
echo "<?php phpinfo();" > public/test.php
chmod 644 public/test.php
```

Acesse: `https://betgeniusbr.com/test.php`

Se funcionar, o PHP está OK. Se não funcionar, há problema no servidor web.

---

## 🆘 Se Nada Funcionar

Entre em contato com o suporte da Hostinger e pergunte:

1. **O mod_rewrite está habilitado?**
   - Necessário para o Laravel funcionar

2. **O Document Root está correto?**
   - Deve apontar para: `/home/u127271520/domains/betgeniusbr.com/public_html`

3. **Os arquivos .htaccess estão sendo processados?**
   - `AllowOverride All` deve estar habilitado

4. **A versão do PHP está correta?**
   - Laravel 10 requer PHP 8.1 ou superior

---

## 📋 Checklist de Diagnóstico

- [ ] Cache do Laravel limpo
- [ ] `.htaccess` na raiz existe e está correto
- [ ] `.htaccess` na pasta `public` existe e está correto
- [ ] Permissões dos arquivos estão corretas (644 para arquivos, 755 para pastas)
- [ ] Owner dos arquivos está correto (`u127271520:o1008122165`)
- [ ] Rotas aparecem no `php artisan route:list`
- [ ] `public/index.php` é acessível
- [ ] Logs não mostram erros críticos
- [ ] Cache do navegador foi limpo

---

**Após corrigir o erro 404, volte à instalação do Cartwavehub! 🚀**

