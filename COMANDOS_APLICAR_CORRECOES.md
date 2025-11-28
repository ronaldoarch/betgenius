# 📋 Comandos para Aplicar as Correções

## 🔧 Passo 1: Fazer Upload dos Arquivos Modificados

Faça upload dos seguintes arquivos para o servidor:

```
public_html/app/Http/Controllers/Api/Games/GameController.php
public_html/app/Filament/Resources/GameResource.php
public_html/app/Filament/Resources/GameResource/Pages/EditGame.php
public_html/app/Filament/Resources/GameResource/Pages/CreateGame.php
public_html/app/Filament/Resources/GameResource/Pages/ListGames.php
```

---

## 🚀 Passo 2: Executar Comandos no Servidor (via SSH)

Conecte-se ao servidor via SSH e execute:

```bash
# 1. Ir para o diretório do projeto
cd /home/u127271520/domains/betgeniusbr.com/public_html

# 2. Limpar cache do Laravel
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear

# 3. Limpar cache de jogos especificamente (opcional, mas recomendado)
php artisan tinker --execute="Cache::forget('api.games.providers'); Cache::forget('api.games.categories'); Cache::forget('api.games.featured'); echo 'Cache limpo!';"
```

---

## ✅ Passo 3: Verificar se Funcionou

### Teste 1: Verificar se o método source existe
```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html
php artisan tinker --execute="echo method_exists(new App\Http\Controllers\Api\Games\GameController(), 'source') ? 'Método source existe!' : 'Método source NÃO existe';"
```

### Teste 2: Verificar se a função clearGamesCache existe
```bash
php artisan tinker --execute="echo method_exists('App\Filament\Resources\GameResource', 'clearGamesCache') ? 'Função clearGamesCache existe!' : 'Função clearGamesCache NÃO existe';"
```

### Teste 3: Testar endpoint source (via curl)
```bash
curl -s https://betgeniusbr.com/api/source/games | head -20
```

Se retornar JSON (não erro 500), está funcionando!

---

## 🎯 Passo 4: Testar no Admin

1. Acesse: `https://betgeniusbr.com/zirigui`
2. Vá em "TODOS OS JOGOS"
3. Verifique se aparece o botão "Limpar Cache de Jogos" no topo
4. Ative/desative um jogo e verifique se aparece no site imediatamente

---

## 📝 Resumo dos Comandos (Copiar e Colar)

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html && \
php artisan cache:clear && \
php artisan config:clear && \
php artisan route:clear && \
php artisan view:clear && \
php artisan tinker --execute="Cache::forget('api.games.providers'); Cache::forget('api.games.categories'); Cache::forget('api.games.featured'); echo '✅ Cache de jogos limpo!';" && \
echo "✅ Todos os caches foram limpos!"
```

---

## 🔍 Se Algo Não Funcionar

### Verificar logs do Laravel:
```bash
tail -f storage/logs/laravel.log
```

### Verificar se os arquivos foram atualizados:
```bash
grep -n "clearGamesCache" app/Filament/Resources/GameResource.php
grep -n "public function source" app/Http/Controllers/Api/Games/GameController.php
```

Se não encontrar, os arquivos não foram atualizados corretamente.

