# 🔍 DIAGNÓSTICO - ERRO 404 NO DOMÍNIO

## ❌ Problema: Erro 404 no betgeniusbr.com

Este guia ajuda a diagnosticar e resolver o erro 404.

---

## 🔍 VERIFICAÇÕES INICIAIS

### **1. Verificar se os arquivos estão no servidor**

Conecte via SSH e verifique:

```bash
ssh -p 65002 u127271520@betgeniusbr.com
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Verificar se os arquivos principais existem
ls -la public/index.php
ls -la .env
ls -la artisan
```

### **2. Verificar estrutura de pastas**

O Laravel precisa estar na estrutura correta:

```bash
# Verificar estrutura
ls -la

# Deve ter:
# - app/
# - public/
# - artisan
# - composer.json
# - .env
```

### **3. Verificar configuração do servidor web**

#### **Para Apache (.htaccess):**

Verifique se existe `.htaccess` na pasta `public/`:

```bash
ls -la public/.htaccess
cat public/.htaccess
```

Se não existir, crie:

```bash
cd public
nano .htaccess
```

Conteúdo do `.htaccess`:

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

#### **Para Nginx:**

Verifique a configuração do Nginx. O document root deve apontar para `public/`:

```nginx
server {
    listen 80;
    server_name betgeniusbr.com;
    root /home/u127271520/domains/betgeniusbr.com/public_html/public;

    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-Content-Type-Options "nosniff";

    index index.php;

    charset utf-8;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    error_page 404 /index.php;

    location ~ \.php$ {
        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.(?!well-known).* {
        deny all;
    }
}
```

### **4. Verificar permissões**

```bash
# Corrigir permissões
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Permissões corretas
chmod -R 755 storage bootstrap/cache
chmod -R 755 public
chown -R u127271520:u127271520 storage bootstrap/cache
```

### **5. Verificar arquivo .env**

```bash
# Verificar se .env existe
ls -la .env

# Verificar configurações importantes
cat .env | grep APP_URL
cat .env | grep APP_ENV
cat .env | grep DB_
```

O `APP_URL` deve estar configurado:

```env
APP_URL=https://betgeniusbr.com
```

### **6. Verificar se o Document Root está correto**

O servidor web deve apontar para a pasta `public/`, não para a raiz do projeto.

**Document Root correto:**
```
/home/u127271520/domains/betgeniusbr.com/public_html/public
```

**Document Root incorreto:**
```
/home/u127271520/domains/betgeniusbr.com/public_html
```

---

## 🔧 SOLUÇÕES COMUNS

### **Solução 1: Verificar configuração do painel de controle**

No painel de controle da hospedagem (Hostinger, cPanel, etc.):

1. Acesse **Gerenciador de Arquivos** ou **File Manager**
2. Verifique se a pasta `public_html` contém os arquivos do Laravel
3. Verifique as configurações do domínio:
   - **Document Root** deve ser: `public_html/public`
   - Ou se estiver em `public_html`, verifique se há um `.htaccess` na raiz

### **Solução 2: Criar .htaccess na raiz (se necessário)**

Se o Document Root aponta para `public_html` (não para `public_html/public`), crie um `.htaccess` na raiz:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html
nano .htaccess
```

Conteúdo:

```apache
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteRule ^(.*)$ public/$1 [L]
</IfModule>
```

### **Solução 3: Verificar se o PHP está funcionando**

```bash
# Criar arquivo de teste
echo "<?php phpinfo(); ?>" > public/test.php

# Acessar: https://betgeniusbr.com/test.php
# Se funcionar, o PHP está OK
# Depois, delete o arquivo: rm public/test.php
```

### **Solução 4: Verificar logs de erro**

```bash
# Logs do Apache/Nginx
tail -100 /var/log/apache2/error.log
# ou
tail -100 /var/log/nginx/error.log

# Logs do Laravel
tail -100 storage/logs/laravel.log
```

### **Solução 5: Limpar cache e otimizar**

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
php artisan optimize:clear
php artisan optimize
```

---

## 📋 CHECKLIST DE VERIFICAÇÃO

Execute estes comandos via SSH:

```bash
ssh -p 65002 u127271520@betgeniusbr.com
cd /home/u127271520/domains/betgeniusbr.com/public_html

# 1. Verificar estrutura
echo "=== Estrutura de pastas ==="
ls -la | head -20

# 2. Verificar public/index.php
echo "=== Verificando public/index.php ==="
ls -la public/index.php

# 3. Verificar .htaccess
echo "=== Verificando .htaccess ==="
ls -la public/.htaccess

# 4. Verificar .env
echo "=== Verificando .env ==="
ls -la .env

# 5. Verificar permissões
echo "=== Verificando permissões ==="
ls -ld storage bootstrap/cache public

# 6. Verificar PHP
echo "=== Verificando PHP ==="
php -v
php artisan --version

# 7. Verificar rotas
echo "=== Verificando rotas ==="
php artisan route:list | head -10
```

---

## 🚨 PROBLEMAS ESPECÍFICOS

### **Problema: "Document Root aponta para lugar errado"**

**Solução:**
1. Acesse o painel de controle da hospedagem
2. Vá em **Configurações do Domínio** ou **Domain Settings**
3. Altere o **Document Root** para: `public_html/public`
4. Salve e aguarde alguns minutos

### **Problema: "Arquivos não estão no servidor"**

**Solução:**
1. Faça upload de todos os arquivos
2. Use o script: `./upload_cartwavehub.sh`
3. Ou faça upload manual via FTP/SCP

### **Problema: "Permissões incorretas"**

**Solução:**
```bash
chmod -R 755 storage bootstrap/cache public
chown -R u127271520:u127271520 storage bootstrap/cache
```

### **Problema: ".env não configurado"**

**Solução:**
```bash
# Copiar .env.example para .env
cp .env.example .env

# Gerar chave da aplicação
php artisan key:generate

# Configurar APP_URL
nano .env
# Altere: APP_URL=https://betgeniusbr.com
```

---

## 📞 PRÓXIMOS PASSOS

1. **Conecte via SSH** e execute o checklist acima
2. **Verifique os logs** para identificar o erro específico
3. **Teste o PHP** criando um arquivo `test.php`
4. **Verifique o Document Root** no painel de controle
5. **Entre em contato com o suporte** da hospedagem se necessário

---

## 🔗 LINKS ÚTEIS

- **Painel de Controle:** Acesse o painel da sua hospedagem
- **Documentação Laravel:** https://laravel.com/docs
- **Logs do Laravel:** `storage/logs/laravel.log`

---

**Execute o checklist acima e compartilhe os resultados para diagnóstico mais preciso!**

