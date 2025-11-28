# 🔄 Atualizar Arquivos no Servidor

## ⚠️ Problema

O site carregou, mas está mostrando versão antiga porque os arquivos no servidor não foram atualizados!

---

## ✅ SOLUÇÃO: Atualizar Arquivos

### **Passo 1: Fazer Novo Build (Já Feito!)**

O build mais recente está em: `frontend-react/dist/`

**Arquivos novos:**
- `index.html` → Referencia `index-DrMwNlRZ.js` e `index-R46pBGYW.css`
- `assets/index-DrMwNlRZ.js` → JavaScript com todas as atualizações
- `assets/index-R46pBGYW.css` → CSS com todas as atualizações

---

### **Passo 2: Upload dos Arquivos Atualizados**

No gerenciador de arquivos do servidor:

1. **Vá para:** `public_html/public/`

2. **Substituir `index.html`:**
   - Local: `frontend-react/dist/index.html`
   - Remoto: `public_html/public/index.html`
   - ⚠️ **SUBSTITUIR** (não adicionar)

3. **Substituir pasta `assets/` COMPLETA:**
   - **DELETE** a pasta `assets/` antiga no servidor
   - **UPLOAD** a pasta `assets/` nova de `frontend-react/dist/assets/`
   - ⚠️ **SUBSTITUIR TUDO** (os nomes dos arquivos mudaram!)

4. **Verificar permissões:**
   - `index.html` → 644
   - `assets/` (pasta) → 755
   - Arquivos dentro de `assets/` → 644

---

### **Passo 3: Limpar Cache do Navegador**

Após fazer upload:

1. **Pressione:** `Ctrl + Shift + R` (Windows/Linux) ou `Cmd + Shift + R` (Mac)
2. **Ou:** Abra DevTools (F12) → Network → Marque "Disable cache"
3. **Ou:** Limpe o cache do navegador completamente

---

## 🔍 Verificar se Atualizou

### **1. Verificar Console do Navegador**

Pressione `F12` → Aba "Console"

**Procure por erros:**
- ❌ `404` em arquivos `.js` ou `.css` → Arquivos não foram atualizados
- ❌ `Failed to load resource` → Arquivos não encontrados

### **2. Verificar Network**

Pressione `F12` → Aba "Network" → Recarregue a página

**Verifique se está carregando:**
- ✅ `index-DrMwNlRZ.js` (arquivo novo)
- ✅ `index-R46pBGYW.css` (arquivo novo)

**Se estiver carregando arquivos com nomes diferentes** → Os arquivos antigos ainda estão no servidor!

---

## 📋 Checklist de Atualização

- [ ] Build feito (`npm run build`)
- [ ] `index.html` atualizado no servidor
- [ ] Pasta `assets/` **DELETADA** e **SUBSTITUÍDA** no servidor
- [ ] Permissões corretas
- [ ] Cache do navegador limpo
- [ ] Console verificado (sem erros 404)
- [ ] Network verificado (arquivos novos carregando)

---

## 🎯 Arquivos que DEVEM estar no Servidor

```
public_html/public/
├── index.html          ← Versão NOVA (com referências aos novos assets)
├── assets/
│   ├── index-DrMwNlRZ.js    ← JavaScript NOVO (com todas atualizações)
│   └── index-R46pBGYW.css   ← CSS NOVO (com todas atualizações)
├── .htaccess
└── index_laravel.php
```

**⚠️ IMPORTANTE:** Os nomes dos arquivos em `assets/` mudam a cada build! Por isso precisa **SUBSTITUIR** tudo!

---

## 🚀 Comando Rápido (Se tiver SSH)

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html/public

# Backup da pasta assets antiga
mv assets assets.backup

# Upload dos novos arquivos via SCP (do seu computador)
# scp -r dist/* u127271520@betgeniusbr.com:/home/u127271520/domains/betgeniusbr.com/public_html/public/
```

---

## ✅ Depois de Atualizar

Teste novamente:
- `https://betgeniusbr.com/`
- Deve mostrar jogos, banners, todas as funcionalidades!

