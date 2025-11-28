# 🚨 RESOLVER ERRO 403 FORBIDDEN

## ⚠️ Problema

Após subir o backup original, está aparecendo **403 Forbidden**.

---

## ✅ SOLUÇÃO: Verificar e Corrigir

### **1. Verificar Arquivos no Servidor**

No servidor (`public_html/public/`), verifique se existem:

- [ ] `index.html` ou `index.php`
- [ ] `.htaccess` (pode estar causando o problema)

---

### **2. Verificar Permissões**

As permissões devem ser:

```
index.html (ou index.php)  → 644
.htaccess                  → 644
assets/ (pasta)            → 755
```

**Como corrigir (via SSH ou gerenciador de arquivos):**

```bash
# Via SSH (se tiver acesso)
cd /home/u127271520/domains/betgeniusbr.com/public_html/public
chmod 644 index.html
chmod 644 .htaccess
chmod 755 assets/
chmod 644 assets/*
```

---

### **3. Verificar .htaccess**

O `.htaccess` pode estar bloqueando o acesso. 

**Opção A: Renomear temporariamente**

Renomeie `.htaccess` para `.htaccess.backup` para testar se é ele que está causando o problema.

**Opção B: Usar .htaccess correto**

Use o arquivo `.htaccess-SIMPLES` que está na pasta `frontend-react/`:

1. Renomeie para `.htaccess`
2. Faça upload substituindo o antigo

---

### **4. Verificar se index.html existe**

Se não existir `index.html` ou `index.php`, o servidor pode estar bloqueando.

**Solução:**
- Faça upload do `index.html` do React
- Ou faça upload do `index.php` do Laravel

---

## 🔧 SOLUÇÃO RÁPIDA

### **Passo 1: Fazer Build do React**

```bash
cd frontend-react
npm run build
```

### **Passo 2: Upload dos Arquivos**

No servidor (`public_html/public/`):

1. **DELETAR** `.htaccess` antigo (ou renomear para `.htaccess.backup`)

2. **UPLOAD** `frontend-react/.htaccess-SIMPLES` → renomear para `.htaccess`

3. **UPLOAD** `frontend-react/dist/index.html` → `index.html`

4. **UPLOAD** `frontend-react/dist/assets/` → pasta `assets/`

5. **UPLOAD** `frontend-react/index_laravel.php` → `index_laravel.php`

### **Passo 3: Ajustar Permissões**

```
index.html          → 644
index_laravel.php   → 644
.htaccess          → 644
assets/            → 755
```

---

## 🎯 Estrutura Final Esperada

```
public_html/public/
├── index.html              ← React (site principal)
├── index_laravel.php       ← Laravel (admin + API)
├── .htaccess              ← Configuração (não deve bloquear)
└── assets/                ← Arquivos React
    ├── index-*.js
    └── index-*.css
```

---

## ✅ Depois de Corrigir

1. Limpe o cache do navegador: `Ctrl + Shift + R`
2. Teste: `https://betgeniusbr.com/`
3. Deve funcionar! 🎉

---

## 🚨 Se Ainda Não Funcionar

### **Verificar via SSH (se tiver acesso):**

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html/public
ls -la
```

**Verifique:**
- Se os arquivos existem
- Se as permissões estão corretas
- Se o `.htaccess` não está bloqueando

### **Verificar Logs do Servidor:**

Procure por erros em:
- Logs do Apache/Nginx
- Logs do cPanel
- Logs do Laravel (`storage/logs/laravel.log`)

---

## 📝 Checklist Final

- [ ] `.htaccess` não está bloqueando (ou foi removido temporariamente)
- [ ] `index.html` existe e tem permissão 644
- [ ] Pasta `assets/` existe e tem permissão 755
- [ ] Arquivos dentro de `assets/` têm permissão 644
- [ ] Cache do navegador limpo
- [ ] Testado novamente

