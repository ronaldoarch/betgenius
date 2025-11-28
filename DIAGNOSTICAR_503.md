# 🔍 Diagnosticar Erro 503

## ⚠️ Problema
O servidor está retornando erro 503 (Service Unavailable) com HTML ao invés de JSON.

## 🔍 Possíveis Causas

1. **Servidor sobrecarregado** - Load estava alto (8.17, 8.43, 8.56)
2. **PHP-FPM sem workers disponíveis**
3. **Timeout de requisição**
4. **Memória insuficiente**
5. **Problema de configuração do servidor web**

---

## ✅ Soluções

### 1. Verificar Status do Servidor (via SSH)

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Ver load do servidor
uptime

# Ver processos PHP
ps aux | grep php-fpm | wc -l

# Ver uso de memória
free -h

# Ver logs do PHP-FPM
tail -50 /var/log/php-fpm/error.log 2>/dev/null || tail -50 /var/log/php8.1-fpm.log 2>/dev/null
```

### 2. Verificar Logs do Apache/Nginx

```bash
# Apache
tail -50 /var/log/apache2/error.log 2>/dev/null || tail -50 /var/log/httpd/error_log 2>/dev/null

# Nginx
tail -50 /var/log/nginx/error.log 2>/dev/null
```

### 3. Verificar Limites do PHP

```bash
php -i | grep -E "memory_limit|max_execution_time|max_input_time"
```

### 4. Reiniciar PHP-FPM (se possível)

```bash
# Tentar reiniciar (pode precisar de sudo)
sudo systemctl restart php8.1-fpm 2>/dev/null || \
sudo service php8.1-fpm restart 2>/dev/null || \
sudo /etc/init.d/php8.1-fpm restart 2>/dev/null
```

### 5. Verificar se há muitos processos travados

```bash
# Ver processos PHP travados
ps aux | grep php | grep -v grep

# Matar processos travados (CUIDADO!)
# killall -9 php  # Só se realmente necessário
```

---

## 🔧 Ajustes no Código

Se o problema for timeout ou memória, podemos ajustar:

1. **Aumentar timeout nas requisições HTTP**
2. **Otimizar queries do banco de dados**
3. **Reduzir cache time para aliviar carga**

---

## 📋 Checklist de Diagnóstico

Execute no servidor:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

echo "=== DIAGNÓSTICO 503 ==="
echo ""
echo "1. Load do servidor:"
uptime
echo ""
echo "2. Processos PHP:"
ps aux | grep php-fpm | wc -l
echo ""
echo "3. Uso de memória:"
free -h
echo ""
echo "4. Últimos erros do Laravel:"
tail -20 storage/logs/laravel.log | grep -i "503\|timeout\|memory\|fatal"
echo ""
echo "5. Verificar se o servidor está respondendo:"
curl -I https://betgeniusbr.com/api/settings/data 2>&1 | head -5
```

---

## 🆘 Se o Servidor Estiver Sobrecarregado

1. **Aguardar alguns minutos** - pode ser pico de tráfego
2. **Contatar suporte da hospedagem** - pode ser problema de infraestrutura
3. **Verificar se há scripts rodando em loop**
4. **Verificar se há muitos usuários simultâneos**

---

## 📝 Nota

O erro 503 geralmente é um problema de infraestrutura do servidor, não do código. Se persistir, pode ser necessário:
- Aumentar recursos do servidor
- Otimizar queries do banco
- Implementar cache mais agressivo
- Usar CDN para assets estáticos

