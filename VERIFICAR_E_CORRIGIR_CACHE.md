# Verificar e Corrigir Método clearGamesCache

## Problema
O erro indica que o método `clearGamesCache()` não existe no `GameResource.php` no servidor.

## Solução

### Opção 1: Fazer Upload do Arquivo Atualizado

Você precisa fazer upload do arquivo `GameResource.php` atualizado para o servidor:

**Arquivo local:**
```
public_html (4)/app/Filament/Resources/GameResource.php
```

**Destino no servidor:**
```
/home/u127271520/domains/betgeniusbr.com/public_html/app/Filament/Resources/GameResource.php
```

### Opção 2: Verificar e Adicionar o Método Manualmente (via SSH)

Execute este comando no servidor para verificar se o método existe:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html
grep -n "clearGamesCache" app/Filament/Resources/GameResource.php
```

Se não encontrar, você precisa adicionar o método. O método completo está no arquivo local e deve ser adicionado ao final da classe `GameResource`, antes do fechamento `}`.

### Opção 3: Regenerar Autoload do Composer

Após fazer upload, execute:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html
composer dump-autoload
php artisan config:clear
php artisan cache:clear
```

## Método que deve existir no GameResource.php

```php
/**
 * Limpar cache de jogos
 */
public static function clearGamesCache()
{
    // Limpar todos os caches relacionados a jogos
    Cache::forget('api.games.providers');
    Cache::forget('api.games.categories');
    Cache::forget('api.games.featured');
    
    // Limpar cache de allGames - como pode ter múltiplas chaves baseadas em parâmetros,
    // vamos tentar limpar usando um padrão se estiver usando Redis
    try {
        // Se usar Redis, podemos usar SCAN para encontrar todas as chaves
        if (config('cache.default') === 'redis') {
            $redis = Cache::getStore()->getRedis();
            $keys = $redis->keys('*api.games.all.*');
            foreach ($keys as $key) {
                // Remover o prefixo do Laravel se houver
                $key = str_replace(config('cache.prefix') . ':', '', $key);
                Cache::forget($key);
            }
        }
    } catch (\Exception $e) {
        // Se não conseguir limpar todas as chaves, pelo menos limpamos as principais
        // O cache expirará naturalmente após 10 minutos
    }
}
```

Este método deve estar dentro da classe `GameResource`, antes do fechamento `}` da classe.

