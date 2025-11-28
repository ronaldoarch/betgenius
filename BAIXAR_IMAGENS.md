# 📥 Como Baixar as Imagens dos Jogos

## ✅ Solução: Usar o Admin

Você tem **2 opções** para baixar as imagens:

---

## 🎯 Opção 1: Botão Automático (Recomendado)

1. **Acesse o admin:**
   ```
   https://betgeniusbr.com/zirigui
   ```

2. **Vá em "Gerenciamento de Jogos":**
   - No menu lateral, procure por "Jogos e Provedores"
   - Clique em "Gerenciamento de Jogos"

3. **Clique no botão "Baixar e Extrair Imagens":**
   - O botão está na página
   - Ele fará o download automático do ZIP
   - E extrairá as imagens para `public/storage/`
   - Aguarde a notificação de sucesso

4. **Verifique se funcionou:**
   ```bash
   # No servidor via SSH:
   find public/storage -name "*.webp" | wc -l
   ```
   Deve retornar um número maior que 0.

---

## 🎯 Opção 2: Download Manual via SSH

Se o botão não funcionar, você pode baixar manualmente:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Criar diretório temporário
mkdir -p storage/app/temp

# Baixar o ZIP
curl -L -o storage/app/temp/webp_playfiver.zip https://imagensfivers.com/downloads/webp_playfiver.zip

# Extrair para public/storage
unzip -o storage/app/temp/webp_playfiver.zip -d public/storage/

# Limpar arquivo temporário
rm storage/app/temp/webp_playfiver.zip

# Verificar quantas imagens foram extraídas
find public/storage -name "*.webp" | wc -l
```

---

## ✅ Depois de Baixar

1. **Verifique se as imagens foram baixadas:**
   ```bash
   find public/storage -name "*.webp" | wc -l
   ```

2. **Teste no navegador:**
   - Abra o console (F12)
   - Recarregue a página
   - Os erros 503 devem desaparecer
   - Os jogos devem aparecer com suas imagens

3. **Limpe o cache (se necessário):**
   ```bash
   php artisan cache:clear
   ```

---

## 🔍 Se Ainda Não Funcionar

1. **Verifique permissões:**
   ```bash
   chmod -R 755 public/storage
   ```

2. **Verifique se o diretório existe:**
   ```bash
   ls -la public/storage
   ```

3. **Verifique se o symlink está correto:**
   ```bash
   ls -la public/ | grep storage
   ```

---

## 📋 Resumo

1. ✅ Acesse: `https://betgeniusbr.com/zirigui`
2. ✅ Vá em "Gerenciamento de Jogos"
3. ✅ Clique em "Baixar e Extrair Imagens"
4. ✅ Aguarde a notificação de sucesso
5. ✅ Verifique: `find public/storage -name "*.webp" | wc -l`

**Depois disso, os erros 503 devem desaparecer!** 🎉

