# 🔐 GUIA COMPLETO - CONEXÃO SSH E UPLOAD DE ARQUIVOS

## 📋 INFORMAÇÕES DO SERVIDOR

- **Domínio:** betgeniusbr.com
- **Usuário SSH:** u127271520
- **Host:** betgeniusbr.com (ou IP: 212.85.6.24)
- **Porta SSH:** 65002
- **Caminho do projeto:** `/home/u127271520/domains/betgeniusbr.com/public_html`

---

## 🔌 CONECTAR VIA SSH

### **Método 1: Conexão Direta**

```bash
ssh -p 65002 u127271520@betgeniusbr.com
```

Ou usando o IP:

```bash
ssh -p 65002 u127271520@212.85.6.24
```

### **Método 2: Configurar SSH Config (Recomendado)**

Adicione ao arquivo `~/.ssh/config`:

```bash
Host betgenius
    HostName betgeniusbr.com
    User u127271520
    Port 65002
```

Depois, conecte simplesmente com:

```bash
ssh betgenius
```

---

## 📂 NAVEGAR ATÉ A PASTA DO PROJETO

Após conectar via SSH, execute:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html
```

Ou use o caminho relativo:

```bash
cd ~/domains/betgeniusbr.com/public_html
```

---

## 📤 UPLOAD DE ARQUIVOS

### **Método 1: Script Automatizado (Recomendado)**

Use o script de upload criado:

```bash
# Dar permissão de execução (apenas na primeira vez)
chmod +x upload_cartwavehub.sh

# Executar o script
./upload_cartwavehub.sh
```

O script irá:
- ✅ Enviar todos os arquivos necessários
- ✅ Mostrar o progresso de cada upload
- ✅ Exibir os próximos passos

### **Método 2: Upload Manual com SCP**

#### **Upload de um arquivo:**

```bash
scp -P 65002 caminho/local/arquivo.php u127271520@betgeniusbr.com:/home/u127271520/domains/betgeniusbr.com/public_html/caminho/destino/
```

#### **Upload de múltiplos arquivos:**

```bash
scp -P 65002 arquivo1.php arquivo2.php u127271520@betgeniusbr.com:/home/u127271520/domains/betgeniusbr.com/public_html/caminho/destino/
```

#### **Upload de uma pasta inteira:**

```bash
scp -r -P 65002 pasta_local/ u127271520@betgeniusbr.com:/home/u127271520/domains/betgeniusbr.com/public_html/caminho/destino/
```

### **Método 3: Usando SFTP**

```bash
sftp -P 65002 u127271520@betgeniusbr.com
```

Depois, dentro do SFTP:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html
put arquivo_local.php caminho/destino/arquivo.php
```

Para sair do SFTP: `exit`

---

## 🚀 DEPLOY COMPLETO - CARTWAVEHUB

### **Passo 1: Upload dos Arquivos**

Execute o script de upload:

```bash
cd /Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/public_html\ \(4\)/
chmod +x upload_cartwavehub.sh
./upload_cartwavehub.sh
```

### **Passo 2: Conectar via SSH**

```bash
ssh -p 65002 u127271520@betgeniusbr.com
```

### **Passo 3: Navegar até a pasta do projeto**

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html
```

### **Passo 4: Rodar a Migration**

```bash
php artisan migrate
```

### **Passo 5: Limpar Cache**

```bash
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
php artisan optimize
```

Ou em um único comando:

```bash
php artisan config:clear && php artisan cache:clear && php artisan route:clear && php artisan view:clear && php artisan optimize
```

---

## 📝 COMANDOS ÚTEIS NO SERVIDOR

### **Verificar arquivos enviados:**

```bash
ls -la app/Traits/Gateways/CartwavehubTrait.php
ls -la app/Http/Controllers/Gateway/CartwavehubController.php
ls -la routes/groups/gateways/cartwavehub.php
```

### **Verificar logs:**

```bash
# Logs do Laravel
tail -100 storage/logs/laravel.log

# Logs do Cartwavehub
tail -100 storage/logs/cartwavehub.log
```

### **Verificar se a migration foi executada:**

```bash
php artisan migrate:status
```

### **Verificar rotas:**

```bash
php artisan route:list | grep cartwavehub
```

### **Verificar permissões:**

```bash
# Verificar permissões da pasta storage
ls -la storage/

# Corrigir permissões se necessário
chmod -R 775 storage bootstrap/cache
chown -R u127271520:u127271520 storage bootstrap/cache
```

---

## 🔧 TROUBLESHOOTING

### **Erro: "Permission denied"**

```bash
# Verificar permissões
ls -la

# Corrigir permissões
chmod 755 pasta
chown u127271520:u127271520 arquivo.php
```

### **Erro: "Connection refused"**

- Verifique se a porta SSH está correta (65002)
- Verifique se o firewall permite conexões SSH
- Tente usar o IP ao invés do domínio

### **Erro: "Host key verification failed"**

```bash
# Remover a chave antiga
ssh-keygen -R betgeniusbr.com
ssh-keygen -R 212.85.6.24

# Tentar conectar novamente
```

### **Erro ao executar migration**

```bash
# Verificar se está na pasta correta
pwd

# Verificar conexão com banco de dados
php artisan tinker
>>> DB::connection()->getPdo();
```

### **Cache não limpa**

```bash
# Limpar manualmente
rm -rf bootstrap/cache/*.php
rm -rf storage/framework/cache/*
rm -rf storage/framework/views/*
```

---

## 📦 ARQUIVOS DO CARTWAVEHUB PARA UPLOAD

### **Arquivos Novos:**
1. `database/migrations/2025_01_20_100000_add_cartwavehub_to_gateways.php`
2. `app/Traits/Gateways/CartwavehubTrait.php`
3. `app/Http/Controllers/Gateway/CartwavehubController.php`
4. `routes/groups/gateways/cartwavehub.php`
5. `CARTWAVEHUB_INSTRUCOES.md`

### **Arquivos Modificados:**
1. `app/Models/Gateway.php`
2. `app/Http/Controllers/Api/Wallet/DepositController.php`
3. `app/Http/Controllers/Api/Profile/WalletController.php`
4. `app/Filament/Pages/GatewayPage.php`
5. `routes/web.php`

---

## ✅ CHECKLIST DE DEPLOY

- [ ] Arquivos enviados via script ou SCP
- [ ] Conectado via SSH
- [ ] Navegado até a pasta do projeto
- [ ] Migration executada (`php artisan migrate`)
- [ ] Cache limpo (`php artisan optimize:clear`)
- [ ] Rotas verificadas (`php artisan route:list | grep cartwavehub`)
- [ ] Logs verificados (sem erros)
- [ ] Teste de depósito realizado
- [ ] Teste de saque realizado

---

## 🎯 COMANDOS RÁPIDOS

### **Deploy Completo em um Comando:**

```bash
# No seu computador local
./upload_cartwavehub.sh && ssh -p 65002 u127271520@betgeniusbr.com "cd /home/u127271520/domains/betgeniusbr.com/public_html && php artisan migrate && php artisan optimize:clear"
```

### **Apenas Limpar Cache:**

```bash
ssh -p 65002 u127271520@betgeniusbr.com "cd /home/u127271520/domains/betgeniusbr.com/public_html && php artisan optimize:clear"
```

### **Ver Logs em Tempo Real:**

```bash
ssh -p 65002 u127271520@betgeniusbr.com "cd /home/u127271520/domains/betgeniusbr.com/public_html && tail -f storage/logs/laravel.log"
```

---

## 📞 SUPORTE

Se encontrar problemas:

1. Verifique os logs: `storage/logs/laravel.log` e `storage/logs/cartwavehub.log`
2. Verifique as permissões dos arquivos
3. Verifique se todas as dependências estão instaladas
4. Verifique a conexão com o banco de dados

---

**Última atualização:** 20/01/2025

