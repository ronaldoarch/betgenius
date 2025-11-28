# 🧹 Limpar e Fazer Deploy Correto

## ❌ Problema Identificado

A pasta `app/` no servidor contém arquivos de desenvolvimento que **NÃO devem estar em produção**:
- ❌ `node_modules/` (dependências - muito pesado)
- ❌ `src/` (código-fonte)
- ❌ `package.json`, `vite.config.js` (arquivos de desenvolvimento)
- ❌ Arquivos `.md`, `.sh` (documentação local)
- ❌ `frontend-react.tar.gz` (arquivo compactado)

## ✅ O que DEVE estar no servidor

Apenas o conteúdo de `dist/`:
- ✅ `index.html`
- ✅ Pasta `assets/` (com JS e CSS compilados)

---

## 🔧 Solução: Limpar e Fazer Deploy Correto

### Passo 1: Limpar a Pasta `app/` no Servidor

**Via FileZilla:**
1. Conecte ao servidor
2. Navegue até: `/public_html/public/app/`
3. **DELETE TODOS os arquivos e pastas**, EXCETO:
   - Se houver uma pasta `assets/` ou `assets.7552/`, mantenha ela
   - Se houver `index.html`, mantenha ele (mas vamos substituir)

**OU delete tudo e recrie a pasta vazia.**

### Passo 2: Verificar Build Local

No seu computador, verifique se o build está correto:

```bash
cd /Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/frontend-react
ls -la dist/
```

Você deve ver:
- `index.html`
- Pasta `assets/` (com arquivos JS e CSS dentro)

### Passo 3: Fazer Upload APENAS do Conteúdo de `dist/`

**Via FileZilla:**
1. No lado **LOCAL** (esquerda), navegue até:
   ```
   /Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/frontend-react/dist/
   ```
2. No lado **REMOTO** (direita), navegue até:
   ```
   /public_html/public/app/
   ```
3. **Selecione APENAS:**
   - `index.html`
   - Pasta `assets/` (completa, com todos os arquivos dentro)
4. **Arraste para o servidor**

### Passo 4: Verificar Permissões

Após o upload:
1. Selecione a pasta `app/`
2. Clique direito → **Permissions**
3. Marque **"Recursive"**
4. Selecione **"Directories and files"**
5. Configure:
   - **Pastas:** `755` (rwxr-xr-x)
   - **Arquivos:** `644` (rw-r--r--)
6. Clique em **"UPDATE"**

### Passo 5: Testar

Acesse: `https://betgeniusbr.com/app/`

---

## 📋 Checklist

- [ ] Pasta `app/` limpa (sem `node_modules`, `src`, etc.)
- [ ] Apenas `index.html` e `assets/` na pasta `app/`
- [ ] Permissões corretas (755 para pastas, 644 para arquivos)
- [ ] Testado no navegador
- [ ] Console do navegador (F12) sem erros
- [ ] Jogos aparecem
- [ ] Banners aparecem

---

## 🐛 Se Ainda Não Funcionar

1. **Verifique o console do navegador (F12):**
   - Veja se há erros de carregamento
   - Verifique se os arquivos JS/CSS estão sendo carregados

2. **Verifique a URL:**
   - Deve ser: `https://betgeniusbr.com/app/`
   - Não: `https://betgeniusbr.com/app` (sem barra)

3. **Limpe o cache do navegador:**
   - Ctrl+Shift+R (Windows/Linux)
   - Cmd+Shift+R (Mac)

4. **Verifique se o build foi feito com `base: '/app/'`:**
   - Abra `vite.config.js` localmente
   - Deve ter: `base: '/app/'`
   - Se não tiver, adicione e faça build novamente

