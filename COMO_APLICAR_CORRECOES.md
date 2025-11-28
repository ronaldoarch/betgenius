# 🚀 Como Aplicar as Correções - Passo a Passo

## ⚠️ IMPORTANTE
Os comandos devem ser executados **NO SERVIDOR via SSH**, não no seu computador local!

---

## 📋 Passo 1: Fazer Upload dos Arquivos

Você precisa fazer upload dos arquivos modificados para o servidor. Os arquivos estão em:

```
cassino-saulo/public_html (4)/app/Http/Controllers/Api/Games/GameController.php
cassino-saulo/public_html (4)/app/Filament/Resources/GameResource.php
cassino-saulo/public_html (4)/app/Filament/Resources/GameResource/Pages/EditGame.php
cassino-saulo/public_html (4)/app/Filament/Resources/GameResource/Pages/CreateGame.php
cassino-saulo/public_html (4)/app/Filament/Resources/GameResource/Pages/ListGames.php
```

**Faça upload via FTP/SFTP para:**
```
/home/u127271520/domains/betgeniusbr.com/public_html/app/...
```

---

## 🔌 Passo 2: Conectar ao Servidor via SSH

Conecte-se ao servidor usando SSH. Você precisa das credenciais SSH do seu provedor de hospedagem.

Exemplo de conexão:
```bash
ssh usuario@betgeniusbr.com
# ou
ssh usuario@IP_DO_SERVIDOR
```

---

## ⚡ Passo 3: Executar Comandos no Servidor

**DEPOIS de conectar via SSH**, execute estes comandos:

```bash
# 1. Ir para o diretório do projeto
cd /home/u127271520/domains/betgeniusbr.com/public_html

# 2. Limpar todos os caches do Laravel
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear

# 3. Limpar cache de jogos especificamente
php artisan tinker --execute="Cache::forget('api.games.providers'); Cache::forget('api.games.categories'); Cache::forget('api.games.featured'); echo 'Cache limpo!';"
```

---

## ✅ Passo 4: Verificar se Funcionou

### No servidor (via SSH):
```bash
# Verificar se o método source existe
php artisan tinker --execute="echo method_exists(new App\Http\Controllers\Api\Games\GameController(), 'source') ? 'OK' : 'ERRO';"

# Verificar se a função clearGamesCache existe
php artisan tinker --execute="echo method_exists('App\Filament\Resources\GameResource', 'clearGamesCache') ? 'OK' : 'ERRO';"
```

### No navegador:
1. Acesse: `https://betgeniusbr.com/zirigui`
2. Vá em "TODOS OS JOGOS"
3. Verifique se aparece o botão "Limpar Cache de Jogos" no topo
4. Ative/desative um jogo e verifique se aparece no site imediatamente

---

## 🔍 Se Você Não Tem Acesso SSH

Se você não tem acesso SSH, você pode:

1. **Fazer upload dos arquivos via FTP/SFTP** (isso já aplica as mudanças)
2. **Limpar o cache via painel de controle** do seu provedor (se disponível)
3. **Aguardar** - o cache expira automaticamente em 10 minutos a 1 hora

As correções de limpeza automática de cache funcionarão assim que os arquivos forem enviados!

---

## 📝 Resumo

1. ✅ Fazer upload dos 5 arquivos modificados para o servidor
2. ✅ Conectar via SSH ao servidor
3. ✅ Executar os comandos `php artisan cache:clear` etc.
4. ✅ Testar no admin

**Os comandos NÃO funcionam no seu computador local - apenas no servidor!**

