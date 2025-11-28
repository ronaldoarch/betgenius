# 🔴 PROBLEMA: Gateway Cartwavehub Não Aparece

## ❌ O Que Aconteceu

Você tentou executar comandos do seu **computador local** dentro do terminal **SSH do servidor**. Por isso os arquivos novos (Migration, Trait, Controller, Rotas) **NÃO foram enviados**.

### Exemplo do Erro:
```bash
# Você estava no SSH do servidor e tentou:
[u127271520@br-asc-web2022 public_html]$ cd "/Users/ronaldodiasdesousa/Desktop/..."
# ❌ ERRO: Esse caminho não existe no servidor!
```

## ✅ SOLUÇÃO RÁPIDA

### Passo 1: Abrir Terminal LOCAL

**IMPORTANTE**: Abra um **NOVO TERMINAL** no seu Mac (não conecte ao SSH ainda!)

### Passo 2: Executar Script de Upload

No terminal LOCAL, execute:

```bash
cd "/Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/public_html (4)"
./enviar_cartwavehub_COMPLETO.sh
```

Você verá algo assim:

```
🚀 INICIANDO UPLOAD DO CARTWAVEHUB
====================================

📍 Diretório atual: /Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/public_html (4)

🔍 Verificando arquivos...
✓ Migration encontrada
✓ CartwavehubTrait encontrada
✓ CartwavehubController encontrado
✓ Rota cartwavehub.php encontrada

✅ Todos os arquivos encontrados!

📤 Enviando arquivos para o servidor...

1/9 📦 Enviando Migration...
   ✓ Migration enviada com sucesso

2/9 📦 Enviando CartwavehubTrait...
   ✓ CartwavehubTrait enviada com sucesso
...
```

### Passo 3: Conectar ao SSH e Executar Comandos

Depois que o upload terminar, conecte ao SSH:

```bash
ssh -p 65002 u127271520@betgeniusbr.com
```

Cole este comando completo (tudo de uma vez):

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html && \
php artisan migrate --path=database/migrations/2025_01_20_100000_add_cartwavehub_to_gateways.php --force && \
php artisan config:clear && \
php artisan cache:clear && \
php artisan route:clear && \
php artisan view:clear && \
php artisan optimize:clear && \
php artisan config:cache && \
php artisan route:cache && \
php artisan view:cache && \
php artisan optimize && \
echo "✅ CONCLUÍDO! Acesse o admin agora."
```

### Passo 4: Verificar no Admin

1. Acesse: **https://betgeniusbr.com/admin**
2. Faça login
3. Vá em: **Configurações** → **Gateway de Pagamento**
4. Role até encontrar a seção **CARTWAVEHUB**
5. Deve aparecer 3 campos:
   - API URL (Cartwavehub)
   - API Secret (Cartwavehub)
   - API Public (Cartwavehub)

## 📝 Checklist

- [ ] Abri um terminal LOCAL (não SSH)
- [ ] Executei o script `enviar_cartwavehub_COMPLETO.sh`
- [ ] Vi todas as mensagens "✓ enviado com sucesso"
- [ ] Conectei ao SSH
- [ ] Executei os comandos php artisan
- [ ] Vi a mensagem "✅ CONCLUÍDO!"
- [ ] Limpei cache do navegador (Ctrl+Shift+R)
- [ ] Acessei o admin
- [ ] Vejo a seção CARTWAVEHUB

## 🆘 Se Ainda Não Funcionar

### Verificar se os arquivos chegaram no servidor

No SSH, execute:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Verificar se os arquivos existem
ls -la database/migrations/2025_01_20_100000_add_cartwavehub_to_gateways.php
ls -la app/Traits/Gateways/CartwavehubTrait.php
ls -la app/Http/Controllers/Gateway/CartwavehubController.php
ls -la routes/groups/gateways/cartwavehub.php
```

Se algum arquivo não existir, execute o script de upload novamente.

### Verificar se a migração rodou

No SSH:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html
php artisan migrate:status | grep cartwavehub
```

Deve mostrar:
```
Ran    2025_01_20_100000  add_cartwavehub_to_gateways
```

### Verificar o banco de dados

No SSH:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html
php artisan tinker
```

No tinker:
```php
$g = \App\Models\Gateway::first();
echo isset($g->cartwavehub_uri) ? "✅ OK\n" : "❌ FALTA\n";
exit
```

## 💡 Dica Importante

**NUNCA** execute comandos do seu computador (`cd /Users/ronaldodiasdesousa/...`) dentro do SSH. O SSH está no servidor remoto, não no seu Mac!

**SEMPRE**:
1. Upload de arquivos → Terminal LOCAL
2. Comandos php artisan → Terminal SSH (no servidor)

---

## 🎯 Resumo Simples

| Ação | Onde Executar | Comando |
|------|---------------|---------|
| Enviar arquivos | Terminal LOCAL | `./enviar_cartwavehub_COMPLETO.sh` |
| Rodar migração | SSH (servidor) | `php artisan migrate --path=...` |
| Limpar cache | SSH (servidor) | `php artisan config:clear...` |
| Acessar admin | Navegador | `https://betgeniusbr.com/admin` |

---

**Qualquer dúvida, envie a saída completa do script de upload ou os comandos que executou!**

