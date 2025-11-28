# 🔧 Comandos para Corrigir Erros 503 nas Imagens

## ⚠️ Problema
As imagens dos jogos (arquivos `.webp`) estão retornando erro 503, impedindo que apareçam no site.

---

## 🚀 Solução Rápida

### Passo 1: Fazer Upload dos Arquivos Corrigidos

Faça upload dos arquivos `.htaccess` atualizados:
- `public_html/.htaccess` (raiz)
- `public_html/public/.htaccess`

---

### Passo 2: Executar Script de Correção (via SSH)

Conecte-se via SSH:
```bash
ssh -p 65002 u127271520@betgeniusbr.com
```

Execute o script de correção:
```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Criar symlink se não existir
php artisan storage:link

# Ajustar permissões
chmod -R 755 public/storage

# Limpar cache
php artisan cache:clear
php artisan config:clear
```

---

### Passo 3: Verificar se as Imagens Existem

```bash
# Verificar quantas imagens .webp existem
find public/storage -name "*.webp" | wc -l
```

**Se retornar 0**, você precisa baixar as imagens:
1. Acesse o admin: `https://betgeniusbr.com/zirigui`
2. Vá em "Gerenciamento de Jogos"
3. Clique em "Baixar Imagens" (ou similar)

---

## 📋 Comandos Completos (Copiar e Colar)

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html && \
php artisan storage:link && \
chmod -R 755 public/storage && \
php artisan cache:clear && \
php artisan config:clear && \
echo "✅ Correções aplicadas! Verifique se há imagens: $(find public/storage -name '*.webp' | wc -l) arquivos .webp encontrados"
```

---

## ✅ Verificar se Funcionou

1. **No navegador:**
   - Abra o console (F12)
   - Recarregue a página
   - Verifique se os erros 503 desapareceram

2. **Testar uma imagem diretamente:**
   - Encontre o nome de uma imagem: `ls public/storage/*.webp | head -1`
   - Acesse: `https://betgeniusbr.com/storage/[nome-do-arquivo.webp]`
   - Deve carregar a imagem (não erro 503)

---

## 🔍 Se Ainda Não Funcionar

Execute o diagnóstico:
```bash
bash diagnosticar_imagens_503.sh
```

Isso mostrará exatamente o que está faltando.

