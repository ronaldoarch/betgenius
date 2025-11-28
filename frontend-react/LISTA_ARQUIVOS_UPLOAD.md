# 📤 LISTA DE ARQUIVOS PARA UPLOAD

## 🎯 Destino no Servidor

Todos os arquivos devem ir para:
```
public_html/public/
```

---

## ✅ ARQUIVOS OBRIGATÓRIOS

### **1. index.html**
- **Local:** `frontend-react/dist/index.html`
- **Remoto:** `public_html/public/index.html`
- **Ação:** ⚠️ **SUBSTITUIR** o arquivo antigo

---

### **2. index_laravel.php**
- **Local:** `frontend-react/index_laravel.php`
- **Remoto:** `public_html/public/index_laravel.php`
- **Ação:** ⚠️ **SUBSTITUIR** ou **CRIAR** se não existir

---

### **3. .htaccess**
- **Local:** `frontend-react/.htaccess-SIMPLES`
- **Remoto:** `public_html/public/.htaccess`
- **Ação:** ⚠️ **SUBSTITUIR** o arquivo antigo
- **Nota:** Renomeie de `.htaccess-SIMPLES` para `.htaccess` ao fazer upload

---

### **4. Pasta assets/ (COMPLETA)**
- **Local:** `frontend-react/dist/assets/`
- **Remoto:** `public_html/public/assets/`
- **Ação:** 
  1. ⚠️ **DELETAR** a pasta `assets/` antiga completamente
  2. ⚠️ **UPLOAD** a pasta `assets/` nova completa

**Arquivos dentro de `assets/`:**
- `index-DrMwNlRZ.js` (ou nome similar com hash)
- `index-R46pBGYW.css` (ou nome similar com hash)

---

## 📋 Checklist de Upload

### **Passo 1: Preparar Arquivos**

- [ ] Abrir pasta: `frontend-react/dist/`
- [ ] Abrir pasta: `frontend-react/`

### **Passo 2: Upload no Servidor**

No gerenciador de arquivos do servidor (`public_html/public/`):

- [ ] **DELETAR** pasta `assets/` antiga (se existir)
- [ ] **UPLOAD** `dist/index.html` → `public/index.html` (substituir)
- [ ] **UPLOAD** `dist/assets/` → `public/assets/` (pasta completa)
- [ ] **UPLOAD** `index_laravel.php` → `public/index_laravel.php` (substituir ou criar)
- [ ] **UPLOAD** `.htaccess-SIMPLES` → `public/.htaccess` (renomear para `.htaccess`)

### **Passo 3: Verificar Permissões**

- [ ] `index.html` → 644
- [ ] `index_laravel.php` → 644
- [ ] `.htaccess` → 644
- [ ] `assets/` (pasta) → 755
- [ ] Arquivos dentro de `assets/` → 644

### **Passo 4: Testar**

- [ ] Acessar: `https://betgeniusbr.com/` → Deve mostrar React
- [ ] Acessar: `https://betgeniusbr.com/admin` → Deve mostrar login do admin
- [ ] Limpar cache do navegador (Ctrl+Shift+R)

---

## 📁 Estrutura Final no Servidor

```
public_html/public/
├── index.html              ← React (site principal)
├── index_laravel.php       ← Laravel (admin + API)
├── .htaccess              ← Configuração de rotas
└── assets/                ← Arquivos React
    ├── index-DrMwNlRZ.js
    └── index-R46pBGYW.css
```

---

## ⚠️ IMPORTANTE

1. **NÃO** adicione os novos arquivos junto com os antigos
2. **DELETE** a pasta `assets/` antiga completamente antes de fazer upload da nova
3. Os nomes dos arquivos em `assets/` mudam a cada build (têm hash)
4. Por isso é importante **SUBSTITUIR** tudo, não adicionar

---

## 🚨 Se Ainda Não Funcionar

### **1. Verificar Console do Navegador**

Pressione `F12` → Aba "Console"

**Procure por:**
- ❌ Erros 404 em arquivos `.js` ou `.css`
- ❌ Erros de carregamento

### **2. Verificar Network**

Pressione `F12` → Aba "Network" → Recarregue a página

**Verifique se está carregando:**
- ✅ `index-DrMwNlRZ.js` (ou nome similar)
- ✅ `index-R46pBGYW.css` (ou nome similar)

**Se estiver carregando arquivos com nomes diferentes** → Os arquivos antigos ainda estão no servidor!

### **3. Verificar Arquivos no Servidor**

No servidor, verifique se os arquivos estão corretos:

```bash
# Via SSH (se tiver acesso)
cd /home/u127271520/domains/betgeniusbr.com/public_html/public
ls -la
ls -la assets/
```

---

## ✅ Depois de Fazer Upload

1. Limpe o cache do navegador: `Ctrl + Shift + R`
2. Teste o site: `https://betgeniusbr.com/`
3. Teste o admin: `https://betgeniusbr.com/admin`
4. Deve funcionar tudo! 🎉

