# ✅ SOLUÇÃO FINAL - ALTERAR DOCUMENT ROOT

## 🎯 PROBLEMA IDENTIFICADO

O diagnóstico confirmou:
- ✅ `/public/index.html` = 200 (funciona)
- ❌ `/` (raiz) = 403 (não funciona)
- ✅ `/teste.txt` = 200 (funciona)
- ✅ `/assets/index-DrMwNlRZ.js` = 200 (funciona)

**Causa:** Document Root está em `public_html/public` (ERRADO)

---

## ✅ SOLUÇÃO

### **PASSO 1: Acessar o hPanel**

1. Abra seu navegador
2. Acesse: **https://hpanel.hostinger.com/**
3. Faça login com suas credenciais

### **PASSO 2: Navegar até Domínios**

1. No menu lateral esquerdo, clique em **"Domínios"** ou **"Domains"**
2. Você verá uma lista com todos os seus domínios

### **PASSO 3: Acessar Configurações do Domínio**

1. Encontre **"betgeniusbr.com"** na lista
2. Clique em **"Gerenciar"** ou **"⚙️ Configurações"** ou **"Manage"**

### **PASSO 4: Localizar e Alterar Document Root**

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

### **PASSO 5: Alterar o Valor**

1. **Veja o valor atual:**
   - Provavelmente está: `public_html/public` ❌
   - Ou: `domains/betgeniusbr.com/public_html/public` ❌

2. **Clique em "Editar"** ou **"Alterar"** ou **"✏️"**

3. **Altere para:**
   - `public_html` ✅
   - Ou: `domains/betgeniusbr.com/public_html` ✅
   - **IMPORTANTE:** SEM `/public` no final!

4. **Clique em "Salvar"** ou **"Aplicar"** ou **"Confirmar"**

5. **AGUARDE 2-3 MINUTOS** para as alterações propagarem

---

## 🧪 TESTE DEPOIS DE ALTERAR

1. **Aguarde 2-3 minutos** após salvar
2. **Limpe o cache do navegador:** `Ctrl + Shift + R` (ou `Cmd + Shift + R` no Mac)
3. **Teste:** `https://betgeniusbr.com/`
4. **Deve funcionar agora!** ✅

---

## 📋 VERIFICAÇÃO

Depois de alterar, você pode verificar executando este comando no SSH:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html && curl -s -o /dev/null -w "Status da raiz: %{http_code}\n" https://betgeniusbr.com/
```

Se retornar **200**, está funcionando! ✅

---

## ⚠️ IMPORTANTE

**O Document Root DEVE estar em `public_html`**, não em `public_html/public`.

O `.htaccess` na raiz (`public_html/.htaccess`) redireciona automaticamente tudo para `public/`, então não é necessário apontar o Document Root diretamente para `public/`.

Se o Document Root estiver em `public_html/public`, o servidor não conseguirá acessar o `.htaccess` na raiz, causando o erro 403.

---

## 📞 SE NÃO CONSEGUIR ALTERAR

Se você não conseguir encontrar ou alterar o Document Root:

1. **Contate o suporte do Hostinger:**
   - Acesse: https://www.hostinger.com.br/contato
   - Ou use o chat ao vivo no hPanel
   - Informe:
     - Domínio: `betgeniusbr.com`
     - Problema: Erro 403 Forbidden
     - Causa identificada: Document Root está em `public_html/public`
     - Solicitação: Alterar Document Root para `public_html`

---

## ✅ CHECKLIST

- [ ] Acessei o hPanel
- [ ] Encontrei a opção "Document Root"
- [ ] Alterei de `public_html/public` para `public_html`
- [ ] Salvei as alterações
- [ ] Aguardei 2-3 minutos
- [ ] Limpei o cache do navegador
- [ ] Testei `https://betgeniusbr.com/`
- [ ] Site está funcionando! ✅

