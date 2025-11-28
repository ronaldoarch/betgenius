# 🚀 Deploy Simples - 3 Passos

## ✅ Build Já Está Pronto!

Os arquivos estão em: `frontend-react/dist/`

---

## 📤 Método Mais Simples: FileZilla

### Passo 1: Abrir FileZilla
- Conecte: `betgeniusbr.com`
- Usuário: `u127271520`
- Senha: [sua senha]

### Passo 2: Navegar e Criar Pasta
- **Remoto (direita):** `/public_html/public/`
- Clique direito → **Criar diretório** → Nome: `app`

### Passo 3: Upload
- **Local (esquerda):** Navegue até `frontend-react/dist/`
- **Selecione TODOS os arquivos:**
  - `index.html`
  - Pasta `assets/` (completa)
- **Arraste para a pasta `app/` no servidor**

### Pronto! 🎉
Acesse: **https://betgeniusbr.com/app/**

---

## 🔧 Se Precisar Rebuildar

```bash
cd frontend-react
npm run build
```

Depois faça upload novamente.

---

## ⚠️ Importante

O `vite.config.js` está configurado com `base: '/app/'`

Se quiser usar na raiz (`/`), edite `vite.config.js`:
```javascript
base: '/', // ou comente a linha
```

Depois faça build novamente.

---

## 📍 Localização

**Arquivos prontos:**
```
/Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/frontend-react/dist/
```

**Destino no servidor:**
```
/home/u127271520/domains/betgeniusbr.com/public_html/public/app/
```

**URL:**
```
https://betgeniusbr.com/app/
```

