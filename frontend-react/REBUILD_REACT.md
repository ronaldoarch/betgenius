# 🔨 REBUILD DO REACT (Para aplicar correções)

## 📋 O QUE FOI CORRIGIDO

✅ **Placeholders dos banners**: Substituído `via.placeholder.com` por imagem SVG base64 inline
- Arquivo: `src/services/api.js`
- Arquivo: `src/components/GameCard.jsx`

---

## 🔧 PASSO A PASSO

### 1. No seu MacBook (terminal local):

```bash
# Navegar para a pasta do projeto
cd ~/Desktop/Projetos/cassino-saulo/frontend-react

# Instalar dependências (se necessário)
npm install

# Fazer build do projeto
npm run build
```

### 2. Upload dos arquivos para o servidor

Depois do build, você precisa fazer upload dos arquivos em `dist/` para o servidor:

**Opção A: Via FTP/SFTP**
- Conectar ao servidor via FileZilla ou similar
- Upload de `frontend-react/dist/*` para `public_html/public/*`

**Opção B: Via File Manager do hosting**
- Acessar hPanel → File Manager
- Fazer upload dos arquivos de `dist/` para `public/`

**Arquivos para upload:**
- `dist/index.html` → `public_html/public/index.html`
- `dist/assets/*` → `public_html/public/assets/*`

---

## ✅ VERIFICAÇÃO

Depois do upload, acesse:
- `https://betgeniusbr.com/`
- Abra o Console do navegador (F12)
- Verifique se os erros de `via.placeholder.com` desapareceram

---

## 📝 NOTA

Os erros de placeholder só serão corrigidos DEPOIS do rebuild e upload.
O código já está corrigido, mas precisa ser compilado e enviado ao servidor.

