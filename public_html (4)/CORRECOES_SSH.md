# 🔧 CORREÇÕES NECESSÁRIAS NO SERVIDOR

## ❌ Problemas Identificados

### 1. **Erro no chown - Grupo Incorreto**

O erro mostra:
```
chown: invalid group: 'u127271520:u127271520'
```

**Solução:** O grupo correto é `o1008122165`, não `u127271520`.

Execute no servidor:
```bash
chown -R u127271520:o1008122165 storage bootstrap/cache
```

### 2. **Erro na Migration - Tabela já existe**

O log mostra:
```
SQLSTATE[42S01]: Base table or view already exists: 1050 Table 'categories' already exists
```

**Solução:** A migration do Cartwavehub não deve ter esse problema, mas vamos verificar o status das migrations:

```bash
php artisan migrate:status
```

Para rodar apenas a migration do Cartwavehub:
```bash
php artisan migrate --path=database/migrations/2025_01_20_100000_add_cartwavehub_to_gateways.php
```

---

## ✅ COMANDOS CORRETOS PARA EXECUTAR

Execute estes comandos no servidor SSH:

```bash
# 1. Navegar até a pasta
cd /home/u127271520/domains/betgeniusbr.com/public_html

# 2. Corrigir permissões (com o grupo correto)
chmod -R 755 storage bootstrap/cache public
chown -R u127271520:o1008122165 storage bootstrap/cache

# 3. Verificar status das migrations
php artisan migrate:status

# 4. Rodar apenas a migration do Cartwavehub
php artisan migrate --path=database/migrations/2025_01_20_100000_add_cartwavehub_to_gateways.php

# 5. Limpar cache
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
php artisan optimize

# 6. Verificar se a migration foi aplicada
php artisan migrate:status | grep cartwavehub
```

---

## 🔍 VERIFICAÇÕES ADICIONAIS PARA O 404

### Verificar Document Root

O problema do 404 pode ser o Document Root. Verifique:

1. **No painel da Hostinger (hPanel):**
   - Acesse: https://hpanel.hostinger.com/
   - Vá em **Domínios** → **betgeniusbr.com**
   - Verifique o **Document Root**
   - Deve ser: `public_html/public` ou apenas `public_html` (se tiver .htaccess na raiz)

### Verificar .htaccess

O `.htaccess` na raiz já redireciona para `public/`, então o Document Root pode apontar para `public_html`.

Verifique se o `.htaccess` existe:
```bash
ls -la .htaccess
cat .htaccess
```

### Testar acesso direto ao index.php

```bash
# Criar arquivo de teste
echo "<?php echo 'PHP funciona!'; ?>" > public/test.php

# Acesse no navegador: https://betgeniusbr.com/test.php
# Se funcionar, o PHP está OK
# Depois delete: rm public/test.php
```

### Verificar logs do servidor web

```bash
# Verificar se há erros recentes
tail -50 /var/log/apache2/error.log
# ou
tail -50 /var/log/nginx/error.log
```

---

## 📋 CHECKLIST COMPLETO

Execute na ordem:

- [ ] Corrigir permissões com grupo correto: `chown -R u127271520:o1008122165 storage bootstrap/cache`
- [ ] Verificar status das migrations: `php artisan migrate:status`
- [ ] Rodar migration do Cartwavehub: `php artisan migrate --path=database/migrations/2025_01_20_100000_add_cartwavehub_to_gateways.php`
- [ ] Limpar cache: `php artisan optimize:clear && php artisan optimize`
- [ ] Verificar Document Root no hPanel
- [ ] Testar PHP: criar `test.php` e acessar no navegador
- [ ] Verificar logs do servidor web
- [ ] Verificar se o site carrega: acessar `https://betgeniusbr.com`

---

## 🚨 SE O 404 PERSISTIR

1. **Verifique o Document Root no hPanel:**
   - Deve apontar para `public_html/public` OU
   - Deve apontar para `public_html` (se tiver .htaccess na raiz redirecionando)

2. **Verifique se o mod_rewrite está habilitado:**
   ```bash
   php -m | grep rewrite
   ```

3. **Teste acesso direto:**
   - Tente: `https://betgeniusbr.com/public/index.php`
   - Se funcionar, o problema é o Document Root ou .htaccess

4. **Entre em contato com suporte da Hostinger** se nada funcionar

---

**Execute os comandos acima e me informe os resultados!**

