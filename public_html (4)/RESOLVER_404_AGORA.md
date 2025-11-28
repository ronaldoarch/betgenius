# ⚡ RESOLVER 404 - AÇÃO IMEDIATA

## 🎯 Seu Problema

Você está vendo **404 NOT FOUND** ao acessar `betgeniusbr.com/profile/deposit`.

## ✅ SOLUÇÃO RÁPIDA

### Opção 1: Você está acessando a rota errada

**❌ ERRADO:**
```
betgeniusbr.com/profile/deposit
```

**✅ CORRETO:**
```
betgeniusbr.com/api/carteira_wallet/deposit
(precisa de autenticação JWT)
```

### Opção 2: Execute o diagnóstico no servidor

Copie e cole este comando completo no seu terminal:

```bash
ssh -p 65002 u127271520@betgeniusbr.com << 'ENDSSH'
cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "🔍 DIAGNÓSTICO RÁPIDO"
echo "===================="
echo ""

# Limpar cache primeiro
echo "1. Limpando cache..."
php artisan route:clear
php artisan config:clear
php artisan cache:clear
php artisan optimize
echo "   ✅ Cache limpo"
echo ""

# Verificar rotas de depósito
echo "2. Rotas de depósito disponíveis:"
php artisan route:list | grep -i deposit | head -5
echo ""

# Testar a rota
echo "3. Testando rota de depósito..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" https://betgeniusbr.com/api/carteira_wallet/deposit)
if [ "$HTTP_CODE" = "401" ]; then
    echo "   ✅ Rota FUNCIONA (401 = precisa autenticação)"
elif [ "$HTTP_CODE" = "404" ]; then
    echo "   ❌ Rota NÃO ENCONTRADA"
else
    echo "   ⚠️  HTTP $HTTP_CODE"
fi
echo ""

# Verificar se Cartwavehub está incluído
echo "4. Verificando inclusão do Cartwavehub..."
if grep -q "api_cartwavehub.php" routes/api.php; then
    echo "   ✅ Cartwavehub incluído"
else
    echo "   ⚠️  Cartwavehub NÃO incluído"
    echo "   Incluindo agora..."
    echo "" >> routes/api.php
    echo "// Cartwavehub (Cashtime)" >> routes/api.php
    echo "require __DIR__ . '/api_cartwavehub.php';" >> routes/api.php
    php artisan route:clear
    echo "   ✅ Incluído! Limpando cache novamente..."
    php artisan optimize
fi
echo ""

echo "===================="
echo "✅ DIAGNÓSTICO CONCLUÍDO"
echo ""
echo "Rotas disponíveis:"
php artisan route:list | grep -E "(deposit|cartwavehub)" | head -10
ENDSSH
```

---

## 🌐 Se você quer acessar pelo NAVEGADOR

As rotas de depósito são **APIs**, não páginas web. Para acessar pelo navegador:

### 1. Você precisa de uma página web que chame a API

O correto seria ter uma página HTML/React/Vue que:

```javascript
// Esta é a lógica que seu FRONTEND deve ter:

// 1. Fazer login
const loginResponse = await fetch('/api/auth/login', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({ email: 'seu@email.com', password: 'senha' })
});
const { access_token } = await loginResponse.json();

// 2. Acessar depósitos com o token
const depositResponse = await fetch('/api/carteira_wallet/deposit', {
  headers: { 'Authorization': `Bearer ${access_token}` }
});
const deposits = await depositResponse.json();
```

### 2. Existe uma página de depósito no seu projeto?

Se você tem um frontend (React, Vue, etc.), procure por:

```bash
# Procurar páginas de depósito
find . -name "*.vue" -o -name "*.jsx" -o -name "*.tsx" | xargs grep -l "deposit"
```

---

## 📋 Checklist Rápido

- [ ] Executei o comando SSH acima
- [ ] Vi que as rotas existem: `/api/carteira_wallet/deposit`
- [ ] Entendi que não posso acessar `/profile/deposit` diretamente
- [ ] Vou usar o frontend para chamar a API
- [ ] Ou vou usar curl/Postman para testar a API

---

## 🔧 COMANDOS ÚTEIS (Execute no SSH)

### Limpar todos os caches
```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html
php artisan route:clear && php artisan config:clear && php artisan cache:clear && php artisan optimize
```

### Ver TODAS as rotas disponíveis
```bash
php artisan route:list | less
# Pressione 'q' para sair
```

### Ver apenas rotas de depósito
```bash
php artisan route:list | grep -i deposit
```

### Ver apenas rotas de Cartwavehub
```bash
php artisan route:list | grep -i cartwavehub
```

### Testar a API via curl
```bash
# Sem autenticação (deve retornar 401)
curl -I https://betgeniusbr.com/api/carteira_wallet/deposit

# Com autenticação (substitua SEU_TOKEN)
curl -H "Authorization: Bearer SEU_TOKEN" https://betgeniusbr.com/api/carteira_wallet/deposit
```

---

## ❓ Perguntas Frequentes

### P: Por que `/profile/deposit` não funciona?
**R:** Porque essa rota não existe. A rota correta é `/api/carteira_wallet/deposit`.

### P: Como eu acesso isso no navegador?
**R:** Você não acessa diretamente. Seu frontend (React/Vue/etc) deve fazer uma chamada AJAX/fetch para esta API.

### P: E se eu não tenho frontend?
**R:** Use ferramentas como Postman, Insomnia ou curl para testar a API.

### P: Como eu obtenho um token JWT?
**R:** Faça login via API:
```bash
curl -X POST https://betgeniusbr.com/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"seu@email.com","password":"senha"}'
```

### P: O Cartwavehub já está funcionando?
**R:** Ainda não! Você precisa:
1. Fazer upload dos arquivos PHP (Helper, Controllers)
2. Adicionar a coluna `external_id` no banco
3. Configurar as credenciais no admin
4. Limpar o cache

---

## 🚀 PRÓXIMOS PASSOS

Após resolver este 404:

1. ✅ **Entender que `/profile/deposit` não existe**
2. ⏭️ **Adicionar coluna `external_id`** (veja `SOLUCAO_RAPIDA.md`)
3. ⏭️ **Fazer upload dos arquivos do Cartwavehub**
4. ⏭️ **Configurar credenciais no admin**
5. ⏭️ **Testar o fluxo completo**

---

**Execute o comando SSH acima e me mostre o resultado! 🔍**

