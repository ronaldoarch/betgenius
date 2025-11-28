# 🔍 COMO VERIFICAR E ALTERAR O DOCUMENT ROOT NO HPANEL

## ⚠️ PROBLEMA

O erro 403 persiste mesmo após corrigir permissões e .htaccess. Isso indica que o **Document Root** no hPanel está incorreto.

---

## 📋 PASSO A PASSO - VERIFICAR DOCUMENT ROOT

### **1. Acesse o hPanel**
- URL: https://hpanel.hostinger.com/
- Faça login com suas credenciais

### **2. Navegue até Domínios**
- No menu lateral esquerdo, clique em **"Domínios"**
- Você verá uma lista com todos os seus domínios

### **3. Acesse as Configurações do Domínio**
- Encontre **"betgeniusbr.com"** na lista
- Clique em **"Gerenciar"** ou **"Configurações"** ou **"⚙️"** (ícone de engrenagem)

### **4. Localize o Document Root**
O Document Root pode estar em diferentes lugares, dependendo da versão do hPanel:

**Opção A - Na página principal do domínio:**
- Procure por uma seção chamada:
  - **"Document Root"**
  - **"Raiz do Documento"**
  - **"Root Directory"**
  - **"Diretório Raiz"**

**Opção B - Em uma aba "Avançado" ou "Advanced":**
- Procure por uma aba chamada:
  - **"Avançado"**
  - **"Advanced"**
  - **"Configurações Avançadas"**
- Clique nela e procure por "Document Root"

**Opção C - Em "Configurações do Domínio":**
- Procure por uma seção chamada:
  - **"Configurações do Domínio"**
  - **"Domain Settings"**
  - **"Configurações"**

### **5. Verifique o Valor Atual**
Você verá algo como:
- `public_html` ✅ **CORRETO**
- `public_html/public` ❌ **ERRADO**
- `domains/betgeniusbr.com/public_html` ✅ **CORRETO**
- `domains/betgeniusbr.com/public_html/public` ❌ **ERRADO**

### **6. Se Estiver ERRADO, Altere**
1. Clique em **"Editar"** ou **"Alterar"** ou **"✏️"** (ícone de lápis)
2. Altere o valor para: `public_html` (SEM `/public` no final)
3. Clique em **"Salvar"** ou **"Aplicar"** ou **"Confirmar"**
4. **AGUARDE 2-3 MINUTOS** para as alterações propagarem

---

## 🔍 SE NÃO ENCONTRAR O DOCUMENT ROOT

### **Alternativa 1: Contatar Suporte**
Se não conseguir encontrar a opção de Document Root:
1. Acesse o suporte do Hostinger
2. Informe:
   - Domínio: `betgeniusbr.com`
   - Problema: Erro 403 Forbidden
   - Solicitação: Alterar Document Root para `public_html`

### **Alternativa 2: Verificar via SSH**
Execute no SSH para verificar onde o servidor está procurando:

```bash
cd /home/u127271520/domains/betgeniusbr.com
pwd
ls -la
```

Se você estiver vendo `public_html` na listagem, o Document Root provavelmente está correto. Se não, pode estar apontando para outro lugar.

---

## ✅ DEPOIS DE ALTERAR

1. **Aguarde 2-3 minutos** para as alterações propagarem
2. **Limpe o cache do navegador:** `Ctrl + Shift + R`
3. **Teste o site:** `https://betgeniusbr.com/`

---

## 📸 ONDE PROCURAR (VISUAL)

O Document Root geralmente aparece como:
- Um campo de texto editável
- Uma lista dropdown
- Um caminho mostrado como: `/home/u127271520/domains/betgeniusbr.com/public_html`

**IMPORTANTE:** O caminho deve terminar em `public_html`, NÃO em `public_html/public`.

---

## ⚠️ NOTA IMPORTANTE

Se o Document Root estiver correto (`public_html`) e ainda houver erro 403, pode ser:
1. Problema de permissões (já corrigimos)
2. Problema de configuração do servidor web
3. Problema com o .htaccess (já corrigimos)

Nesse caso, contate o suporte do Hostinger com todas as informações.

