# 🔍 DIAGNÓSTICO FINAL - 404 em Tudo

## 🚨 SITUAÇÃO ATUAL

- ✅ `betgeniusbr.com/teste.php` → **FUNCIONA**
- ❌ `betgeniusbr.com/` → **404**
- ❌ `betgeniusbr.com/public/index.php` → **404**

**Isso é estranho!** Se `teste.php` funciona, o Document Root está correto, mas algo está bloqueando o acesso ao `public/`.

---

## 🔧 VERIFICAÇÕES URGENTES

### **Execute no SSH:**

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "=== 1. Verificando se public/index.php existe ==="
ls -la public/index.php
echo ""

echo "=== 2. Verificando .htaccess na raiz ==="
cat .htaccess
echo ""

echo "=== 3. Verificando .htaccess em public/ ==="
cat public/.htaccess
echo ""

echo "=== 4. Verificando permissões ==="
ls -ld public public/index.php .htaccess public/.htaccess
echo ""

echo "=== 5. Testando se consegue ler o index.php ==="
head -5 public/index.php
echo ""

echo "=== 6. Verificando se há .htaccess bloqueando ==="
find . -name ".htaccess" -type f
echo ""

echo "=== 7. Verificando logs do Laravel ==="
tail -30 storage/logs/laravel.log | grep -i "404\|error\|exception" | tail -10
echo ""
```

---

## 🎯 POSSÍVEIS CAUSAS

### **Causa 1: .htaccess bloqueando acesso ao public/**

O `.htaccess` na raiz pode estar com problema. Verifique se está assim:

```apache
RewriteEngine On
RewriteRule ^$ public/ [L]
RewriteRule (.*) public/$1 [L]
```

**Se estiver diferente, corrija:**

```bash
cat > .htaccess << 'EOF'
RewriteEngine On

# Redireciona raiz para public/
RewriteRule ^$ public/ [L]

# Redireciona tudo para public/
RewriteRule (.*) public/$1 [L]

# Impede acesso ao .env
<Files .env>
    Order allow,deny
    Deny from all
</Files>
EOF

chmod 644 .htaccess
```

### **Causa 2: .htaccess em public/ bloqueando**

Verifique se o `.htaccess` em `public/` não tem regras que bloqueiam o acesso.

### **Causa 3: Permissões incorretas**

```bash
chmod 755 public
chmod 644 public/index.php
chmod 644 .htaccess
chmod 644 public/.htaccess
```

### **Causa 4: Arquivo index.php corrompido ou vazio**

```bash
# Verificar tamanho do arquivo
ls -lh public/index.php

# Verificar conteúdo
head -10 public/index.php
```

Se estiver vazio ou corrompido, pode precisar restaurar.

---

## 🔧 SOLUÇÃO COMPLETA

Execute este script completo:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "🔧 CORRIGINDO TUDO..."

# 1. Corrigir .htaccess na raiz
echo "1. Corrigindo .htaccess na raiz..."
cat > .htaccess << 'EOF'
RewriteEngine On
RewriteRule ^$ public/ [L]
RewriteRule (.*) public/$1 [L]

<Files .env>
    Order allow,deny
    Deny from all
</Files>
EOF
chmod 644 .htaccess
echo "✅ .htaccess na raiz corrigido"

# 2. Corrigir .htaccess em public/
echo "2. Corrigindo .htaccess em public/..."
cat > public/.htaccess << 'EOF'
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
EOF
chmod 644 public/.htaccess
echo "✅ .htaccess em public/ corrigido"

# 3. Corrigir permissões
echo "3. Corrigindo permissões..."
chmod 755 public
chmod 644 public/index.php
chmod 644 .htaccess
chmod 644 public/.htaccess
chmod -R 755 storage bootstrap/cache
echo "✅ Permissões corrigidas"

# 4. Verificar se index.php existe e tem conteúdo
echo "4. Verificando index.php..."
if [ -f "public/index.php" ]; then
    SIZE=$(stat -f%z public/index.php 2>/dev/null || stat -c%s public/index.php 2>/dev/null)
    if [ "$SIZE" -gt 100 ]; then
        echo "✅ index.php existe e tem conteúdo ($SIZE bytes)"
    else
        echo "❌ index.php existe mas está muito pequeno ($SIZE bytes) - PODE ESTAR VAZIO!"
    fi
else
    echo "❌ index.php NÃO EXISTE!"
fi

# 5. Limpar cache
echo "5. Limpando cache..."
php artisan config:clear 2>/dev/null
php artisan cache:clear 2>/dev/null
php artisan route:clear 2>/dev/null
php artisan view:clear 2>/dev/null
php artisan optimize:clear 2>/dev/null
php artisan optimize 2>/dev/null
echo "✅ Cache limpo"

echo ""
echo "=================================="
echo "✅ CORREÇÕES APLICADAS!"
echo ""
echo "📋 TESTE NO NAVEGADOR:"
echo "1. https://betgeniusbr.com/teste.php (deve funcionar)"
echo "2. https://betgeniusbr.com/public/index.php"
echo "3. https://betgeniusbr.com/"
echo ""
echo "Se ainda não funcionar, verifique:"
echo "- Logs: tail -50 storage/logs/laravel.log"
echo "- Se index.php tem conteúdo: head -10 public/index.php"
```

---

## 🚨 SE AINDA NÃO FUNCIONAR

### **Verificar se o index.php está correto:**

```bash
# Verificar primeiras linhas
head -20 public/index.php

# Verificar se tem o conteúdo do Laravel
grep -i "laravel\|illuminate" public/index.php | head -3
```

Se o `index.php` estiver vazio ou incorreto, pode precisar restaurar do backup ou recriar.

### **Verificar logs do servidor web:**

```bash
# Tentar ver logs do Apache/Nginx
tail -50 /var/log/apache2/error.log 2>/dev/null || tail -50 /var/log/nginx/error.log 2>/dev/null || echo "Não foi possível acessar logs do servidor"
```

---

## 📋 CHECKLIST FINAL

- [ ] `.htaccess` na raiz redireciona para `public/`
- [ ] `.htaccess` em `public/` tem regras do Laravel
- [ ] `public/index.php` existe e tem conteúdo (>100 bytes)
- [ ] Permissões estão corretas (755 para pastas, 644 para arquivos)
- [ ] Cache foi limpo
- [ ] Testou `https://betgeniusbr.com/public/index.php`
- [ ] Verificou logs de erro

---

**Execute o script completo acima e me informe o resultado!**

