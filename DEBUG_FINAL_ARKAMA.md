# 🔍 DEBUG FINAL - ARKAMA

## Problema Identificado

Quando testamos a API diretamente, ela retornou **HTML** (página de login) ao invés de **JSON**. Isso indica que:

1. ❌ A URL da API pode estar incorreta
2. ❌ O token pode não estar sendo aceito
3. ❌ A requisição pode estar sendo redirecionada

## Passos para Resolver

### 1️⃣ Verificar Configuração no Banco de Dados

Execute no servidor:

```sql
SELECT 
    arkama_uri,
    LENGTH(arkama_api_token) as token_length,
    arkama_ativo
FROM gateways 
LIMIT 1;
```

**Verifique:**
- `arkama_uri` deve ser: `https://app.arkama.com.br/api/v1` (ou similar)
- `token_length` deve ser > 0
- `arkama_ativo` deve ser `1`

### 2️⃣ Testar API Diretamente

Execute o script de teste detalhado:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html
bash TESTAR_API_ARKAMA_DETALHADO.sh
```

**O que verificar:**
- ✅ Status Code deve ser `200`
- ✅ Content-Type deve ser `application/json`
- ✅ Body deve ser JSON válido (não HTML)
- ✅ Resposta deve ter campos como `id`, `pix_qrcode` ou `qrcode`

### 3️⃣ Monitorar Logs em Tempo Real

Em um terminal, execute:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html
tail -f storage/logs/laravel.log | grep -i "arkama"
```

Em outro terminal, tente fazer um depósito no site e veja os logs aparecerem.

### 4️⃣ Verificar Resposta da API

Se a API retornar HTML ao invés de JSON, pode ser que:

**A) URL está errada:**
- Verifique se `arkama_uri` está correto
- Deve ser algo como: `https://app.arkama.com.br/api/v1`
- **NÃO** deve ser: `https://app.arkama.com.br` (sem `/api/v1`)

**B) Token está incorreto:**
- Verifique se o token está completo
- Verifique se não há espaços extras
- Tente gerar um novo token na dashboard da Arkama

**C) Endpoint está errado:**
- A documentação da Arkama pode usar um endpoint diferente
- Verifique a documentação: https://arkama.readme.io/reference/intro

### 5️⃣ Verificar Formato da Resposta

Quando a API retornar JSON válido, verifique quais campos estão presentes:

```json
{
  "id": "...",
  "pix_qrcode": "...",  // ou "qrcode" ou "pix.qrcode"
  "pix_code": "...",    // ou "code" ou "pix.code"
  ...
}
```

O código já tenta diferentes formatos, mas pode precisar de ajuste.

## Próximos Passos

1. ✅ Execute o teste detalhado
2. ✅ Verifique os logs quando tentar fazer depósito
3. ✅ Confirme a URL e token corretos
4. ✅ Verifique o formato da resposta JSON
5. ✅ Ajuste o código se necessário

## Se Ainda Não Funcionar

Envie:
- Resultado do `TESTAR_API_ARKAMA_DETALHADO.sh`
- Logs do `tail -f storage/logs/laravel.log`
- Screenshot da configuração no banco de dados

