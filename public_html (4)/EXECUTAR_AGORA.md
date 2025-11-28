# ⚡ EXECUTAR AGORA - Correção 404 + Instalação Cartwavehub

## 🚨 PROBLEMA ATUAL

Você está vendo **404 NOT FOUND** em `betgeniusbr.com/profile/deposit`

---

## ✅ SOLUÇÃO RÁPIDA (3 Passos)

### 📋 PASSO 1: Fazer Upload do Script de Correção

**Via FileZilla/SFTP:**
1. Conecte em `betgeniusbr.com:65002`
2. Vá para: `/home/u127271520/domains/betgeniusbr.com/public_html`
3. Faça upload do arquivo: `fix_404.sh`

**OU via SCP:**
```bash
scp -P 65002 "fix_404.sh" u127271520@betgeniusbr.com:/home/u127271520/domains/betgeniusbr.com/public_html/
```

---

### 📋 PASSO 2: Executar o Script de Correção

Copie e cole estes comandos no terminal:

```bash
ssh -p 65002 u127271520@betgeniusbr.com
```

Depois:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html
chmod +x fix_404.sh
./fix_404.sh
```

**OU execute diretamente (sem fazer upload):**

```bash
ssh -p 65002 u127271520@betgeniusbr.com << 'ENDSSH'
cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "🔧 Corrigindo erro 404..."

# Limpar cache
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear

# Corrigir .htaccess raiz
cat > .htaccess << 'HTACCESS'
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteRule ^(.*)$ public/$1 [L]
</IfModule>
HTACCESS

# Corrigir .htaccess public
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

# Corrigir permissões
chmod 644 .htaccess public/.htaccess
chmod 755 public
chmod -R 775 storage bootstrap/cache

# Re-otimizar
php artisan optimize
php artisan route:cache

echo "✅ Correção concluída!"
echo ""
echo "Teste agora: https://betgeniusbr.com/profile/deposit"

ENDSSH
```

---

### 📋 PASSO 3: Testar no Navegador

1. **Limpe o cache do navegador:**
   - Chrome/Edge: `Ctrl+Shift+R` (Windows) ou `Cmd+Shift+R` (Mac)
   - Firefox: `Ctrl+F5` (Windows) ou `Cmd+Shift+R` (Mac)

2. **Acesse:**
   - `https://betgeniusbr.com`
   - `https://betgeniusbr.com/profile/deposit`

---

## 🎯 Depois de Corrigir o 404

### Se o site voltar a funcionar normalmente:

Continue com a **Instalação do Cartwavehub**:

1. ✅ **Adicionar coluna external_id** (veja `SOLUCAO_RAPIDA.md`)
2. ✅ **Fazer upload dos arquivos** (veja `RESUMO_INSTALACAO.md`)
3. ✅ **Configurar no admin**
4. ✅ **Testar o fluxo**

---

## 🐛 Se Ainda Não Funcionar

### Diagnóstico Avançado:

```bash
ssh -p 65002 u127271520@betgeniusbr.com
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Ver últimos erros
tail -30 storage/logs/laravel.log

# Verificar se as rotas existem
php artisan route:list | grep profile

# Testar acesso ao index.php
curl -I https://betgeniusbr.com/index.php

# Verificar PHP
php -v
```

### Possíveis Causas Restantes:

1. **mod_rewrite desabilitado**
   - Entre em contato com a Hostinger para habilitar

2. **Versão do PHP incorreta**
   - Laravel 10 requer PHP 8.1+
   - Verifique: `php -v`

3. **Document Root incorreto**
   - Deve apontar para `public_html`, não para `public_html/public`

4. **Problema de DNS/Cache**
   - Limpe o DNS do computador:
     - Windows: `ipconfig /flushdns`
     - Mac: `sudo dscacheutil -flushcache`
     - Linux: `sudo systemd-resolve --flush-caches`

---

## 📞 Suporte Hostinger

Se nada funcionar, entre em contato com o suporte da Hostinger e envie estas informações:

```
Assunto: Site Laravel retornando 404 em todas as rotas

Informações:
- Domínio: betgeniusbr.com
- Conta: u127271520
- Framework: Laravel 10
- PHP: [sua versão]
- Problema: Todas as rotas retornam 404, exceto acesso direto ao index.php

Perguntas:
1. O mod_rewrite está habilitado para este domínio?
2. A configuração AllowOverride All está habilitada?
3. O Document Root está configurado para /home/u127271520/domains/betgeniusbr.com/public_html?
4. Os arquivos .htaccess estão sendo processados?

Já tentei:
- Limpar cache do Laravel
- Recriar arquivos .htaccess
- Corrigir permissões de arquivos
- Re-cachear rotas
```

---

## 📋 Checklist Completo

### Correção do 404:
- [ ] Script `fix_404.sh` executado
- [ ] `.htaccess` na raiz recriado
- [ ] `.htaccess` no `public` recriado
- [ ] Permissões corrigidas
- [ ] Cache do Laravel limpo
- [ ] Cache do navegador limpo
- [ ] Site testado e funcionando

### Instalação do Cartwavehub:
- [ ] Coluna `external_id` adicionada ao banco
- [ ] Arquivos PHP enviados (Helper, Controllers, Rotas)
- [ ] Rotas incluídas no `routes/api.php`
- [ ] Cache limpo novamente
- [ ] Credenciais configuradas no admin
- [ ] Testes realizados

---

## 🚀 Ordem de Execução Recomendada

```
1. Corrigir 404          ← VOCÊ ESTÁ AQUI
   └─> fix_404.sh
   
2. Adicionar coluna
   └─> SOLUCAO_RAPIDA.md
   
3. Instalar Cartwavehub
   └─> RESUMO_INSTALACAO.md
   
4. Testar tudo
   └─> Criar depósito PIX de teste
```

---

**Comece executando o PASSO 2 acima e me avise o resultado! 🚀**

