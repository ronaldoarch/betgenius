# 🎯 GUIA VISUAL - VERIFICAR DOCUMENT ROOT NO HPANEL

## ⚠️ PROBLEMA ATUAL

O erro 403 persiste mesmo com todos os arquivos e configurações corretas. Isso indica que o **Document Root** no hPanel está incorreto.

---

## 📸 ONDE ENCONTRAR O DOCUMENT ROOT

### **Passo 1: Acessar o hPanel**
1. Abra seu navegador
2. Acesse: **https://hpanel.hostinger.com/**
3. Faça login com suas credenciais

### **Passo 2: Navegar até Domínios**
1. No menu lateral esquerdo, procure por **"Domínios"** ou **"Domains"**
2. Clique nele
3. Você verá uma lista com todos os seus domínios

### **Passo 3: Acessar Configurações do Domínio**
1. Encontre **"betgeniusbr.com"** na lista
2. Clique em **"Gerenciar"** ou **"⚙️ Configurações"** ou **"Manage"**

### **Passo 4: Localizar Document Root**

O Document Root pode aparecer em diferentes lugares:

#### **Opção A: Na página principal**
- Procure por uma seção chamada:
  - **"Document Root"**
  - **"Raiz do Documento"**
  - **"Root Directory"**
  - **"Diretório Raiz"**

#### **Opção B: Em uma aba "Avançado"**
- Procure por uma aba chamada:
  - **"Avançado"** ou **"Advanced"**
  - **"Configurações Avançadas"**
- Clique nela
- Procure por "Document Root"

#### **Opção C: Em "Configurações do Domínio"**
- Procure por uma seção chamada:
  - **"Configurações do Domínio"**
  - **"Domain Settings"**

---

## ✅ VALOR CORRETO DO DOCUMENT ROOT

O Document Root deve estar configurado como:

**✅ CORRETO:**
- `public_html`
- `/home/u127271520/domains/betgeniusbr.com/public_html`
- `domains/betgeniusbr.com/public_html`

**❌ ERRADO:**
- `public_html/public`
- `/home/u127271520/domains/betgeniusbr.com/public_html/public`
- `domains/betgeniusbr.com/public_html/public`

---

## 🔧 COMO ALTERAR

1. **Clique em "Editar"** ou **"Alterar"** ou **"✏️"** ao lado do Document Root
2. **Altere o valor** para: `public_html` (SEM `/public` no final)
3. **Clique em "Salvar"** ou **"Aplicar"** ou **"Confirmar"**
4. **AGUARDE 2-3 MINUTOS** para as alterações propagarem

---

## 🧪 TESTE DEPOIS DE ALTERAR

1. **Aguarde 2-3 minutos** após salvar
2. **Limpe o cache do navegador:** `Ctrl + Shift + R`
3. **Teste:** `https://betgeniusbr.com/`

---

## 📞 SE NÃO ENCONTRAR

Se você não conseguir encontrar a opção de Document Root:

1. **Contate o suporte do Hostinger:**
   - Acesse: https://www.hostinger.com.br/contato
   - Informe:
     - Domínio: `betgeniusbr.com`
     - Problema: Erro 403 Forbidden
     - Solicitação: Alterar Document Root para `public_html`

2. **Ou tente via chat ao vivo** no hPanel

---

## ⚠️ IMPORTANTE

**O Document Root DEVE estar em `public_html`**, não em `public_html/public`.

O `.htaccess` na raiz redireciona automaticamente tudo para `public/`, então não é necessário apontar o Document Root diretamente para `public/`.

Se o Document Root estiver em `public_html/public`, o servidor não conseguirá acessar o `.htaccess` na raiz, causando o erro 403.

