# 🚀 Como Fazer Deploy Online - Passo a Passo

## ✅ Build Já Está Pronto!

Os arquivos já foram compilados na pasta `dist/`

---

## 📤 Método 1: Upload via FileZilla (Mais Simples)

### Passo 1: Abrir FileZilla

1. Abra o FileZilla
2. Conecte ao servidor:
   - **Host:** `betgeniusbr.com` ou `sftp://betgeniusbr.com`
   - **Usuário:** `u127271520`
   - **Senha:** [sua senha]
   - **Porta:** `22`

### Passo 2: Navegar até a Pasta

No lado **REMOTO** (direita):
- Navegue até: `/public_html/public/`

### Passo 3: Criar Pasta

- Clique com botão direito → **Criar diretório**
- Nome: `app` (ou `react` ou `frontend`)

### Passo 4: Upload dos Arquivos

No lado **LOCAL** (esquerda):
- Navegue até: `/Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/frontend-react/dist/`

**Arraste TODOS os arquivos de `dist/` para a pasta `app/` no servidor:**
- `index.html`
- Pasta `assets/` (com todos os arquivos dentro)

### Passo 5: Verificar Permissões

No FileZilla, selecione todos os arquivos e:
- Clique direito → **Permissões de arquivo**
- Pastas: `755`
- Arquivos: `644`

### Passo 6: Acessar

Abra no navegador:
```
https://betgeniusbr.com/app/
```

---

## 📤 Método 2: Upload via SSH (Se FileZilla não funcionar)

### Passo 1: Compactar Arquivos

No seu computador:
```bash
cd /Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/frontend-react
tar -czf frontend-react.tar.gz dist/
```

### Passo 2: Upload via SCP

```bash
scp frontend-react.tar.gz u127271520@betgeniusbr.com:/tmp/
```

### Passo 3: Descompactar no Servidor

Conecte via SSH:
```bash
ssh u127271520@betgeniusbr.com
```

No servidor:
```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html/public
mkdir -p app
cd /tmp
tar -xzf frontend-react.tar.gz
mv dist/* /home/u127271520/domains/betgeniusbr.com/public_html/public/app/
rm -rf dist frontend-react.tar.gz
chmod -R 755 /home/u127271520/domains/betgeniusbr.com/public_html/public/app
```

### Passo 4: Acessar

```
https://betgeniusbr.com/app/
```

---

## 📤 Método 3: Upload Direto da Pasta dist

### Via FileZilla:

1. Conecte ao servidor
2. Navegue até: `/public_html/public/`
3. Crie pasta: `app`
4. Entre na pasta `app`
5. No lado local, entre em `dist/`
6. Selecione TODOS os arquivos e pastas
7. Arraste para o servidor

**Arquivos a enviar:**
- ✅ `index.html`
- ✅ Pasta `assets/` (completa, com todos os arquivos dentro)

---

## ⚙️ Configuração Importante: Base Path

Se você colocar em subpasta (ex: `/app/`), precisa configurar o base path.

### Opção A: Configurar ANTES do build (Recomendado)

Edite `vite.config.js`:

```javascript
export default defineConfig({
  plugins: [react()],
  base: '/app/', // Adicione esta linha
  server: {
    // ... resto
  }
})
```

Depois faça build novamente:
```bash
npm run build
```

### Opção B: Usar na raiz (Mais Simples)

Se quiser usar na raiz (`https://betgeniusbr.com/`), faça upload direto para `public_html/public/` (sem criar subpasta).

---

## 🔧 Configurar .htaccess (Se Necessário)

Se colocar em subpasta e as rotas não funcionarem, crie `.htaccess` na pasta `app/`:

```apache
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /app/
  RewriteRule ^index\.html$ - [L]
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d
  RewriteRule . /app/index.html [L]
</IfModule>
```

---

## ✅ Checklist de Deploy

- [ ] Build executado (`npm run build`)
- [ ] Pasta `dist/` criada
- [ ] Arquivos enviados para o servidor
- [ ] Pasta criada no servidor (`app/` ou outra)
- [ ] Permissões corretas (755/644)
- [ ] Testado acesso via navegador
- [ ] Login funcionando
- [ ] Jogos carregando
- [ ] Imagens aparecendo
- [ ] Depósito funcionando

---

## 🐛 Problemas Comuns

### Erro 404 nas rotas
**Solução:** Configure `base: '/app/'` no `vite.config.js` e faça build novamente

### Imagens não aparecem
**Solução:** Verifique se `/storage/` está acessível e permissões corretas

### API não funciona
**Solução:** A API já está configurada com URL absoluta, deve funcionar

### Página em branco
**Solução:** 
- Verifique console do navegador (F12)
- Verifique se todos os arquivos foram enviados
- Verifique permissões

---

## 📝 Comandos Úteis

```bash
# Build
npm run build

# Ver conteúdo do build
ls -lh dist/

# Ver tamanho
du -sh dist/

# Preview local do build
npm run preview
```

---

## 🎯 Resumo Rápido

1. **Build já está feito!** ✅
2. **Abra FileZilla**
3. **Conecte:** `betgeniusbr.com` (usuário: `u127271520`)
4. **Navegue até:** `/public_html/public/`
5. **Crie pasta:** `app`
6. **Upload:** Todos os arquivos de `dist/` para `app/`
7. **Acesse:** `https://betgeniusbr.com/app/`

---

## 📍 Localização dos Arquivos

**Local (seu computador):**
```
/Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/frontend-react/dist/
```

**Remoto (servidor):**
```
/home/u127271520/domains/betgeniusbr.com/public_html/public/app/
```

**URL de Acesso:**
```
https://betgeniusbr.com/app/
```

