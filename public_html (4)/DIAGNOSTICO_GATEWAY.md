# Diagnóstico: Gateway Cartwavehub Não Aparece

## Problema
O gateway Cartwavehub não está aparecendo no painel administrativo após o upload dos arquivos.

## Passo 1: Executar Diagnóstico Completo

### 1.1 - Fazer upload do script de diagnóstico

```bash
scp verificar_cartwavehub.sh u127271520@betgeniusbr.com:/home/u127271520/domains/betgeniusbr.com/public_html/
```

### 1.2 - Conectar via SSH

```bash
ssh u127271520@betgeniusbr.com
```

### 1.3 - Navegar até o diretório e executar o diagnóstico

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html
chmod +x verificar_cartwavehub.sh
./verificar_cartwavehub.sh
```

## Passo 2: Analisar Resultados

O script irá verificar:
- ✓ Arquivos que estão presentes
- ✗ Arquivos que estão faltando
- Status das modificações nos controllers
- Status da migração no banco de dados
- Configurações do Filament

## Passo 3: Soluções Baseadas no Diagnóstico

### Caso 1: Arquivos Estão Faltando

Se o diagnóstico mostrar arquivos faltando (✗ FALTA):

```bash
# Na sua máquina local, execute:
cd /Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/public_html\ \(4\)/
./upload_cartwavehub.sh
```

Depois, no servidor via SSH:
```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html
php artisan config:clear
php artisan cache:clear
```

### Caso 2: Migração Não Foi Executada

Se o diagnóstico mostrar que as colunas do banco não existem:

```bash
# No servidor via SSH
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Executar apenas a migração do Cartwavehub
php artisan migrate --path=/database/migrations/2025_01_20_100000_add_cartwavehub_to_gateways.php

# Verificar se deu certo
php artisan migrate:status | grep cartwavehub
```

### Caso 3: Tudo OK Mas Não Aparece no Admin

Se todos os arquivos estão OK e a migração foi executada:

```bash
# No servidor via SSH
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Limpar TODO o cache
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
php artisan optimize

# Recriar o cache otimizado
php artisan config:cache
php artisan route:cache
php artisan view:cache
```

### Caso 4: Erro na Migração

Se aparecer erro ao executar a migração:

```bash
# Verificar qual foi o erro
php artisan migrate --path=/database/migrations/2025_01_20_100000_add_cartwavehub_to_gateways.php

# Se disser que a coluna já existe, verificar no banco:
php artisan tinker
```

No tinker, execute:
```php
$gateway = \App\Models\Gateway::first();
$gateway->getAttributes();
// Verificar se 'cartwavehub_uri', 'cartwavehub_api_secret' e 'cartwavehub_api_public' aparecem
exit
```

## Passo 4: Verificar no Painel Admin

Após executar os passos acima:

1. Acesse: `https://betgeniusbr.com/admin`
2. Faça login
3. Vá em **Configurações** → **Gateway de Pagamento**
4. Role para baixo até a seção **CARTWAVEHUB**
5. Você deve ver os campos:
   - API URL (Cartwavehub)
   - API Secret (Cartwavehub)
   - API Public (Cartwavehub)

## Passo 5: Se Ainda Não Aparecer

### 5.1 - Verificar Logs de Erro

```bash
# No servidor via SSH
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Ver últimos erros do Laravel
tail -n 50 storage/logs/laravel.log

# Ver erros do PHP
tail -n 50 /home/u127271520/domains/betgeniusbr.com/logs/error_log
```

### 5.2 - Verificar se o Filament está Carregando Corretamente

```bash
# No servidor via SSH
php artisan tinker
```

No tinker:
```php
// Verificar se a classe GatewayPage existe e pode ser carregada
class_exists('App\Filament\Pages\GatewayPage');

// Verificar o conteúdo do arquivo
$content = file_get_contents(app_path('Filament/Pages/GatewayPage.php'));
echo (strpos($content, 'CARTWAVEHUB') !== false) ? 'ENCONTRADO' : 'NÃO ENCONTRADO';

exit
```

### 5.3 - Forçar Recompilação do Filament

```bash
# No servidor via SSH
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Limpar cache do Filament especificamente
php artisan filament:clear-cached-components
php artisan filament:optimize

# Se os comandos acima não existirem, use:
php artisan optimize:clear
php artisan optimize
```

## Checklist Final

Use este checklist para garantir que tudo foi feito:

- [ ] Script de diagnóstico executado
- [ ] Todos os arquivos estão presentes (sem ✗ FALTA)
- [ ] Migração executada com sucesso
- [ ] Colunas existem no banco de dados
- [ ] Cache limpo (config, cache, route, view)
- [ ] Optimize executado
- [ ] Browser cache limpo (Ctrl+Shift+R)
- [ ] Tentou acessar o admin em aba anônima
- [ ] Verificou os logs de erro

## Comandos Rápidos de Solução Completa

Se quiser executar tudo de uma vez no servidor:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Executar migração
php artisan migrate --path=/database/migrations/2025_01_20_100000_add_cartwavehub_to_gateways.php --force

# Limpar todo o cache
php artisan config:clear && \
php artisan cache:clear && \
php artisan route:clear && \
php artisan view:clear && \
php artisan optimize && \
php artisan config:cache && \
php artisan route:cache && \
php artisan view:cache

# Verificar permissões
chmod -R 755 app/Traits/Gateways/
chmod -R 755 app/Http/Controllers/Gateway/
chmod -R 755 app/Filament/Pages/
chmod -R 775 storage bootstrap/cache
chown -R u127271520:o1008122165 storage bootstrap/cache

echo "✓ Tudo pronto! Acesse o admin e veja se apareceu."
```

## Suporte Adicional

Se após seguir todos os passos o gateway ainda não aparecer, envie:
1. A saída completa do script `verificar_cartwavehub.sh`
2. As últimas 50 linhas do `storage/logs/laravel.log`
3. Screenshot da tela de Gateways no admin

