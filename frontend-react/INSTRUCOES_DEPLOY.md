# 🚀 Instruções Rápidas - Deploy do React como Site Principal

## ✅ Build Já Está Pronto!

O `vite.config.js` já está configurado com `base: '/'` e o build foi feito.

---

## 📤 Passo a Passo Rápido

### **1. Via FileZilla (Recomendado)**

#### A. Conectar ao Servidor
- **Host:** `betgeniusbr.com` ou `sftp://betgeniusbr.com`
- **Usuário:** `u127271520`
- **Senha:** [sua senha]
- **Porta:** `22`

#### B. Navegar até a Pasta
- No lado **REMOTO** (direita): `/public_html/public/`

#### C. Fazer Backup (IMPORTANTE!)
1. Clique direito em `index.php` → **Renomear** → `index.php.backup`
2. Clique direito em `.htaccess` → **Renomear** → `.htaccess.backup`

#### D. Upload dos Arquivos do React
No lado **LOCAL** (esquerda), navegue até:
```
/Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/frontend-react/dist/
```

**Arraste para o servidor:**
1. `index.html` → `public/index.html` (substituir)
2. Pasta `assets/` → `public/assets/` (substituir tudo)
3. `.htaccess-react-root` → `public/.htaccess` (renomear)

#### E. Criar index_laravel.php
No servidor, copie o backup:
- `index.php.backup` → `index_laravel.php`

Ou via SSH:
```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html/public
cp index.php.backup index_laravel.php
```

#### F. Verificar Permissões
Selecione todos os arquivos e:
- Clique direito → **Permissões de arquivo**
- Pastas: `755`
- Arquivos: `644`

---

### **2. Via SSH (Alternativa)**

```bash
# 1. Conectar ao servidor
ssh u127271520@betgeniusbr.com

# 2. Navegar até a pasta
cd /home/u127271520/domains/betgeniusbr.com/public_html/public

# 3. Backup
cp index.php index.php.backup
cp .htaccess .htaccess.backup

# 4. Criar index_laravel.php
cp index.php index_laravel.php

# 5. No seu computador, compactar os arquivos
cd /Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/frontend-react
tar -czf react-deploy.tar.gz dist/ .htaccess-react-root

# 6. Upload via SCP
scp react-deploy.tar.gz u127271520@betgeniusbr.com:/tmp/

# 7. No servidor, descompactar
cd /home/u127271520/domains/betgeniusbr.com/public_html/public
tar -xzf /tmp/react-deploy.tar.gz
mv dist/index.html index.html
mv dist/assets/* assets/
mv .htaccess-react-root .htaccess
chmod -R 755 assets
chmod 644 index.html .htaccess
rm -rf dist /tmp/react-deploy.tar.gz
```

---

## ✅ Verificação Final

Após o deploy, teste:

1. **Site Principal (React):**
   ```
   https://betgeniusbr.com/
   ```
   ✅ Deve mostrar a página inicial do React

2. **API Laravel:**
   ```
   https://betgeniusbr.com/api/categories
   ```
   ✅ Deve retornar JSON (sem autenticação)

3. **Admin Laravel:**
   ```
   https://betgeniusbr.com/admin
   ```
   ✅ Deve mostrar o painel admin

4. **Storage:**
   ```
   https://betgeniusbr.com/storage/...
   ```
   ✅ Deve mostrar imagens/arquivos

---

## 🔄 Como Reverter (Se Precisar)

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html/public
mv index.php.backup index.php
mv .htaccess.backup .htaccess
rm index_laravel.php
```

---

## 📝 Checklist

- [ ] Backup feito (`index.php.backup`, `.htaccess.backup`)
- [ ] `index.html` do React na raiz
- [ ] Pasta `assets/` do React na raiz
- [ ] `.htaccess` do React configurado
- [ ] `index_laravel.php` criado
- [ ] Permissões corretas (755/644)
- [ ] Site principal testado
- [ ] API testada
- [ ] Admin testado

---

## 🎯 Resumo

**Arquivos para upload:**
- ✅ `dist/index.html` → `public/index.html`
- ✅ `dist/assets/*` → `public/assets/*`
- ✅ `.htaccess-react-root` → `public/.htaccess`

**No servidor:**
- ✅ `index.php.backup` → `index_laravel.php`

**Pronto!** 🚀

