# Comandos Rápidos - Gateway Cartwavehub

## ⚡ Solução Rápida (Copie e Cole no SSH)

Se você quer resolver tudo de uma vez, conecte via SSH e execute este comando completo:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html && \
echo "🔍 Executando migração..." && \
php artisan migrate --path=/database/migrations/2025_01_20_100000_add_cartwavehub_to_gateways.php --force && \
echo "🧹 Limpando cache..." && \
php artisan config:clear && \
php artisan cache:clear && \
php artisan route:clear && \
php artisan view:clear && \
php artisan optimize:clear && \
echo "⚙️ Otimizando..." && \
php artisan config:cache && \
php artisan route:cache && \
php artisan view:cache && \
php artisan optimize && \
echo "✅ CONCLUÍDO! Acesse o admin e veja se o gateway Cartwavehub apareceu." && \
echo "" && \
echo "📍 Acesse: https://betgeniusbr.com/admin" && \
echo "📍 Vá em: Configurações → Gateway de Pagamento" && \
echo "📍 Procure pela seção: CARTWAVEHUB"
```

## 🔍 Diagnóstico Detalhado

Se a solução rápida não funcionar, execute o diagnóstico:

### Passo 1: Upload do script de diagnóstico
```bash
# No seu computador (Terminal local):
cd /Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/public_html\ \(4\)/
scp verificar_cartwavehub.sh u127271520@betgeniusbr.com:/home/u127271520/domains/betgeniusbr.com/public_html/
```

### Passo 2: Executar diagnóstico
```bash
# Conectar ao servidor:
ssh u127271520@betgeniusbr.com

# Executar o diagnóstico:
cd /home/u127271520/domains/betgeniusbr.com/public_html
chmod +x verificar_cartwavehub.sh
./verificar_cartwavehub.sh
```

O script irá mostrar exatamente o que está faltando ou errado.

## 📤 Re-enviar Todos os Arquivos

Se o diagnóstico mostrar que arquivos estão faltando:

```bash
# No seu computador (Terminal local):
cd /Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/public_html\ \(4\)/
./upload_cartwavehub.sh
```

Depois de enviar, execute novamente a solução rápida no servidor.

## 🔧 Verificar se Funcionou

### Método 1: Via Tinker (Terminal)
```bash
# No servidor SSH:
cd /home/u127271520/domains/betgeniusbr.com/public_html
php artisan tinker
```

Dentro do tinker:
```php
$gateway = \App\Models\Gateway::first();
$attrs = $gateway->getAttributes();
echo isset($attrs['cartwavehub_uri']) ? "✅ Cartwavehub OK\n" : "❌ Cartwavehub FALTA\n";
exit
```

### Método 2: Via Admin (Navegador)
1. Acesse: https://betgeniusbr.com/admin
2. Faça login
3. Menu: **Configurações** → **Gateway de Pagamento**
4. Role até encontrar a seção **CARTWAVEHUB**
5. Deve haver 3 campos:
   - **API URL (Cartwavehub)**
   - **API Secret (Cartwavehub)**
   - **API Public (Cartwavehub)**

## ❌ Se Ainda Não Funcionar

Execute este comando para ver os erros:

```bash
# No servidor SSH:
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Ver últimos 30 erros do Laravel:
tail -n 30 storage/logs/laravel.log

# Ver se a migração foi executada:
php artisan migrate:status | grep cartwavehub
```

**Envie a saída desses comandos para análise.**

## 🎯 Checklist Rápido

Use esta lista para garantir que fez tudo:

```
[ ] 1. Executei o comando de solução rápida no SSH
[ ] 2. Limpei o cache do navegador (Ctrl+Shift+R)
[ ] 3. Fiz logout e login novamente no admin
[ ] 4. Tentei em aba anônima/privada
[ ] 5. Verifiquei os logs de erro
[ ] 6. Executei o diagnóstico completo
```

## 🆘 Última Tentativa

Se NADA funcionou até agora:

```bash
# No servidor SSH - Este comando verifica TUDO:
cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "=== VERIFICANDO ARQUIVOS ===" && \
ls -la app/Traits/Gateways/CartwavehubTrait.php && \
ls -la app/Http/Controllers/Gateway/CartwavehubController.php && \
ls -la app/Filament/Pages/GatewayPage.php && \
ls -la database/migrations/2025_01_20_100000_add_cartwavehub_to_gateways.php && \
echo "" && \
echo "=== VERIFICANDO BANCO ===" && \
php artisan tinker --execute="\$g = \App\Models\Gateway::first(); echo json_encode(\$g->getAttributes(), JSON_PRETTY_PRINT);" && \
echo "" && \
echo "=== VERIFICANDO MIGRAÇÕES ===" && \
php artisan migrate:status | grep cartwavehub && \
echo "" && \
echo "=== ÚLTIMOS ERROS ===" && \
tail -n 20 storage/logs/laravel.log
```

**Copie e envie TODA a saída deste comando.**

## 📝 Notas Importantes

- O gateway só aparece no admin DEPOIS que a migração é executada
- Cache DEVE ser limpo após qualquer alteração
- Se você vir a seção CARTWAVEHUB mas os campos não salvam, é problema de permissão no banco
- Se você NÃO vir a seção, é porque o arquivo GatewayPage.php não foi atualizado ou o cache não foi limpo

## 🔄 Processo Correto do Zero

1. **Upload dos arquivos** → `./upload_cartwavehub.sh`
2. **Executar migração** → `php artisan migrate --path=...`
3. **Limpar cache** → `php artisan config:clear && cache:clear...`
4. **Verificar no admin** → Deve aparecer a seção CARTWAVEHUB
5. **Configurar credenciais** → Preencher API URL, Secret e Public
6. **Testar** → Fazer um depósito teste

Se você pular qualquer passo, pode não funcionar!

