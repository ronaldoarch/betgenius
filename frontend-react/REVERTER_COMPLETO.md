# 🔄 REVERTER PARA ESTRUTURA ORIGINAL - GUIA COMPLETO

## 🎯 Objetivo

Voltar ao estado original, com Laravel como site principal, antes de definirmos o React como site principal.

---

## 📋 Passo a Passo

### **1. No Servidor (public_html/public/)**

#### **DELETAR arquivos do React:**

1. ❌ **DELETAR** `index.html` (do React)
2. ❌ **DELETAR** pasta `assets/` (do React)
3. ❌ **DELETAR** `index_laravel.php` (arquivo que criamos)
4. ❌ **DELETAR** `.htaccess` (que modificamos)

---

### **2. Restaurar Arquivos Originais do Laravel**

#### **a) index.php**

**Local (seu computador):**
- `frontend-react/ARQUIVOS_ORIGINAIS_LARAVEL/index.php`
- Ou: `public_html (4)/public/index.php`

**Upload para servidor:**
- `public_html/public/index.php`
- ⚠️ **SUBSTITUIR** o arquivo existente

#### **b) .htaccess**

**Local (seu computador):**
- `frontend-react/ARQUIVOS_ORIGINAIS_LARAVEL/.htaccess`
- Ou: `public_html (4)/public/.htaccess`

**Upload para servidor:**
- `public_html/public/.htaccess`
- ⚠️ **SUBSTITUIR** o arquivo existente

---

## 📁 Estrutura Final Esperada

```
public_html/
├── app/
├── bootstrap/
├── config/
├── database/
├── public/              ← Laravel public
│   ├── index.php       ← Laravel entry point (ORIGINAL)
│   ├── .htaccess       ← Laravel .htaccess (ORIGINAL)
│   └── ... (outros arquivos Laravel)
└── ...
```

**NÃO deve ter:**
- ❌ `index.html` (React)
- ❌ `assets/` (React)
- ❌ `index_laravel.php`

---

## ✅ Checklist de Reversão

- [ ] `index.html` (React) deletado
- [ ] Pasta `assets/` (React) deletada
- [ ] `index_laravel.php` deletado
- [ ] `.htaccess` modificado deletado
- [ ] `index.php` original do Laravel restaurado
- [ ] `.htaccess` original do Laravel restaurado
- [ ] Permissões verificadas (644 para arquivos, 755 para pastas)

---

## 🧪 Testar Após Reverter

### **1. Site Principal**

Acesse: `https://betgeniusbr.com/`

**Deve mostrar:**
- ✅ Laravel (não React)
- ✅ Página inicial do Laravel ou redirecionamento

### **2. Admin**

Acesse: `https://betgeniusbr.com/admin`

**Deve mostrar:**
- ✅ Login do Filament Admin

### **3. API**

Acesse: `https://betgeniusbr.com/api/...`

**Deve funcionar:**
- ✅ Endpoints da API Laravel

---

## 🔧 Se Algo Não Funcionar

### **1. Verificar Permissões**

No servidor, verifique:

```bash
# Via SSH (se tiver acesso)
cd /home/u127271520/domains/betgeniusbr.com/public_html/public
chmod 644 index.php
chmod 644 .htaccess
```

### **2. Limpar Cache do Laravel**

Se tiver acesso SSH:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
php artisan optimize:clear
```

### **3. Verificar Logs**

```bash
tail -50 storage/logs/laravel.log
```

---

## 📝 Arquivos Originais Salvos

Os arquivos originais do Laravel estão salvos em:

- `frontend-react/ARQUIVOS_ORIGINAIS_LARAVEL/index.php`
- `frontend-react/ARQUIVOS_ORIGINAIS_LARAVEL/.htaccess`

Use esses arquivos para restaurar no servidor.

---

## ✅ Depois de Reverter

O site deve voltar a funcionar como antes:
- ✅ Laravel como site principal
- ✅ Admin em `/admin`
- ✅ API em `/api/*`
- ✅ React pode ser movido para uma subpasta (ex: `/app/`) se necessário no futuro

---

## 🎯 Resumo Rápido

1. **DELETAR** arquivos do React no servidor
2. **RESTAURAR** `index.php` original do Laravel
3. **RESTAURAR** `.htaccess` original do Laravel
4. **TESTAR** site, admin e API
5. **PRONTO!** ✅

