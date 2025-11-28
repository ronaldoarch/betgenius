# 🔧 Solução: Logos e Banners

## 📋 Resumo do Problema

1. **Logos**: Funcionando ✅ (confirmado pelo usuário)
2. **Banners**: Não aparecem no carrossel ❌

## 🔍 Diagnóstico

### Como funciona:

1. **Logos**:
   - API: `/api/settings/data` retorna `software_logo_white` e `software_logo_black`
   - Frontend: `Header.jsx` usa `software_logo_white`, `LoadingScreen.jsx` usa `software_logo_black`
   - URL: `https://betgeniusbr.com/storage/${logoPath}`

2. **Banners**:
   - API: `/api/settings/banners` retorna array de banners
   - Frontend: `Home.jsx` filtra banners por tipo (`carousel` para carrossel)
   - URL: `https://betgeniusbr.com/storage/${banner.image}`

### Problema identificado:

Os arquivos físicos das imagens dos banners **não existem** no servidor em `storage/app/public/`, mesmo que a API retorne os caminhos corretos.

## ✅ Solução

### Passo 1: Executar Diagnóstico

Execute o script de diagnóstico:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html
bash /caminho/para/VERIFICAR_LOGOS_E_BANNERS.sh
```

Ou execute manualmente:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

# 1. Verificar symlink
php artisan storage:link

# 2. Verificar se os arquivos existem
php -r "
require 'vendor/autoload.php';
\$app = require_once 'bootstrap/app.php';
\$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

\$banners = \App\Models\Banner::all();
foreach (\$banners as \$banner) {
    \$path = storage_path('app/public/' . \$banner->image);
    echo 'Banner ID: ' . \$banner->id . PHP_EOL;
    echo '  Image: ' . \$banner->image . PHP_EOL;
    echo '  Existe? ' . (file_exists(\$path) ? 'SIM' : 'NÃO') . PHP_EOL;
    echo '' . PHP_EOL;
}
"
```

### Passo 2: Re-upload dos Banners

Se os arquivos não existem, você precisa **re-uploadar os banners via admin panel**:

1. Acesse: `https://betgeniusbr.com/zirigui/banners`
2. Para cada banner que não está aparecendo:
   - Clique em "Editar"
   - Re-upload a imagem
   - Salve

Isso garantirá que os arquivos sejam salvos corretamente em `storage/app/public/`.

### Passo 3: Verificar Permissões

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Garantir permissões corretas
chmod -R 775 storage/app/public
chown -R u127271520:o1008122165 storage/app/public
```

### Passo 4: Verificar .htaccess

O `.htaccess` deve permitir acesso direto a arquivos em `/storage/`:

```apache
# Storage → Servir diretamente se arquivo existir
RewriteCond %{REQUEST_URI} ^/storage/ [NC]
RewriteCond %{REQUEST_FILENAME} -f
RewriteRule ^ - [L]
```

## 🧪 Teste

Após re-uploadar os banners, teste:

```bash
# 1. Verificar se o arquivo existe
ls -la storage/app/public/01KA9S09Z85AV3205AQ8C71B6T.JPG

# 2. Testar URL
curl -I "https://betgeniusbr.com/storage/01KA9S09Z85AV3205AQ8C71B6T.JPG"

# Deve retornar:
# HTTP/2 200
# content-type: image/jpeg (ou image/png, etc)
```

## 📝 Notas

- Os logos já estão funcionando, então o sistema de storage está configurado corretamente
- O problema é apenas que os arquivos físicos dos banners não existem
- A solução é simplesmente re-uploadar os banners via admin panel
- O Laravel Filament salvará os arquivos automaticamente no local correto

## 🔄 Se ainda não funcionar

1. Verifique se o symlink `public/storage` aponta para `storage/app/public`:
   ```bash
   ls -la public/storage
   ```

2. Verifique se o `.htaccess` em `public/` está servindo arquivos corretamente

3. Limpe o cache:
   ```bash
   php artisan config:clear
   php artisan cache:clear
   php artisan route:clear
   ```

