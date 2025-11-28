# 🔄 REVERTER VIA SSH - Instruções

## 🎯 Script Pronto

O script `reverter_original.sh` está pronto para executar via SSH.

---

## 📋 Como Executar

### **Opção 1: Copiar e Colar no SSH**

1. **Conecte-se via SSH:**
   ```bash
   ssh -p 65002 u127271520@betgeniusbr.com
   ```

2. **Copie o conteúdo do script:**
   - Abra o arquivo: `frontend-react/reverter_original.sh`
   - Copie TODO o conteúdo

3. **Cole no terminal SSH e execute:**
   ```bash
   # Cole o script completo aqui
   ```

---

### **Opção 2: Upload e Executar**

1. **Faça upload do script para o servidor:**
   ```bash
   scp -P 65002 frontend-react/reverter_original.sh u127271520@betgeniusbr.com:~/reverter_original.sh
   ```

2. **Conecte-se via SSH:**
   ```bash
   ssh -p 65002 u127271520@betgeniusbr.com
   ```

3. **Execute o script:**
   ```bash
   chmod +x ~/reverter_original.sh
   ~/reverter_original.sh
   ```

---

### **Opção 3: Executar Diretamente (Recomendado)**

1. **Conecte-se via SSH:**
   ```bash
   ssh -p 65002 u127271520@betgeniusbr.com
   ```

2. **Execute os comandos diretamente:**
   
   Copie e cole este bloco completo:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html/public && \
echo "🔄 REVERTENDO PARA ESTRUTURA ORIGINAL..." && \
echo "" && \
echo "1️⃣ Deletando arquivos do React..." && \
rm -f index.html index_laravel.php && \
rm -rf assets && \
echo "   ✅ Arquivos do React deletados" && \
echo "" && \
echo "2️⃣ Restaurando index.php original..." && \
cat > index.php << 'INDEXEOF'
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
INDEXEOF
chmod 644 index.php && \
echo "   ✅ index.php restaurado" && \
echo "" && \
echo "3️⃣ Restaurando .htaccess original..." && \
cat > .htaccess << 'HTACCESSEOF'
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
    RewriteCond %{REQUEST_URI} ^(.+)/$
    RewriteRule ^ %1 [L,R=301]

    # Send Requests To Front Controller...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^ index.php [L]
</IfModule>
HTACCESSEOF
chmod 644 .htaccess && \
echo "   ✅ .htaccess restaurado" && \
echo "" && \
echo "4️⃣ Limpando cache do Laravel..." && \
cd .. && \
php artisan config:clear && \
php artisan cache:clear && \
php artisan route:clear && \
php artisan view:clear && \
php artisan optimize:clear && \
echo "   ✅ Cache limpo" && \
echo "" && \
echo "═══════════════════════════════════════════════════════════════" && \
echo "✅ REVERSÃO CONCLUÍDA!" && \
echo "═══════════════════════════════════════════════════════════════" && \
echo "" && \
echo "🧪 TESTAR:" && \
echo "   🌐 https://betgeniusbr.com/" && \
echo "   🔐 https://betgeniusbr.com/admin" && \
echo ""
```

---

## ✅ O Que o Script Faz

1. ✅ **Deleta** arquivos do React:
   - `index.html`
   - `assets/` (pasta)
   - `index_laravel.php`

2. ✅ **Restaura** `index.php` original do Laravel

3. ✅ **Restaura** `.htaccess` original do Laravel

4. ✅ **Ajusta** permissões (644)

5. ✅ **Limpa** cache do Laravel

6. ✅ **Cria backup** dos arquivos deletados (opcional)

---

## 🧪 Depois de Executar

Teste:
- 🌐 `https://betgeniusbr.com/` → Deve mostrar Laravel
- 🔐 `https://betgeniusbr.com/admin` → Deve mostrar login do admin
- 🔌 `https://betgeniusbr.com/api/...` → Deve funcionar

---

## ⚠️ Importante

- O script faz backup antes de deletar (opcional)
- Todos os arquivos do React serão removidos
- O Laravel voltará a ser o site principal

