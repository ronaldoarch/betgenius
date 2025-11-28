# 📤 COMO FAZER UPLOAD DO DEPOSITCONTROLLER.PHP

## ✅ Arquivo Criado

O arquivo `DepositController.php` está pronto na pasta local:
```
/Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/public_html (4)/DepositController.php
```

## 🎯 Onde Fazer Upload

Faça upload deste arquivo para:
```
/home/u127271520/domains/betgeniusbr.com/public_html/app/Http/Controllers/Api/Wallet/DepositController.php
```

## 📋 Opções de Upload

### Opção 1: FileZilla (Recomendado)
1. Abra o FileZilla
2. Conecte ao servidor:
   - Host: `betgeniusbr.com`
   - Porta: `65002`
   - Usuário: `u127271520`
   - Senha: `Taco84255@`

3. Navegue até: `/home/u127271520/domains/betgeniusbr.com/public_html/app/Http/Controllers/Api/Wallet/`

4. **IMPORTANTE**: Faça backup do arquivo atual antes!
   - Clique com botão direito no `DepositController.php` existente
   - Renomeie para `DepositController.php.old`

5. Arraste o novo `DepositController.php` da pasta local para o servidor

### Opção 2: cPanel File Manager
1. Acesse o cPanel
2. Vá em "Gerenciador de Arquivos"
3. Navegue até: `public_html/app/Http/Controllers/Api/Wallet/`
4. Faça backup do arquivo atual (renomeie para `.old`)
5. Clique em "Upload" e selecione o novo arquivo

## 🔧 Após o Upload

Execute estes comandos via SSH:

```bash
# Conectar ao servidor
ssh -p 65002 u127271520@betgeniusbr.com
# Senha: Taco84255@

# Ir para o diretório
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Ajustar permissões
chmod 644 app/Http/Controllers/Api/Wallet/DepositController.php

# Limpar cache
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear

# Verificar rotas
php artisan route:list | grep deposit
```

## ✨ O Que Foi Corrigido

✅ **Auto-detecção do Gateway Ativo**
- Se o frontend não enviar o parâmetro `gateway`, o sistema detecta automaticamente
- Prioriza o Cartwavehub se estiver ativo

✅ **Método `requestQrcodeCartwavehub` Completo**
- Validação de valores (mín: R$ 5, máx: R$ 10.000)
- Criação de PIX via `CartwavehubHelper`
- Registro correto no banco de dados com `external_id`
- Logs detalhados para debug
- Retorno no formato esperado pelo frontend

✅ **Tratamento de Erros Melhorado**
- Caso `default` no switch para gateway não configurado
- Mensagens de erro claras
- Logs detalhados de todas as operações

✅ **Compatibilidade com Outros Gateways**
- Mantém todos os gateways existentes (SuitPay, EzzePay, DigitoPay, BsPay, AgilizePay, Cashtime)
- Adiciona Cartwavehub sem quebrar nada

## 🧪 Testar Após Upload

1. Acesse o site: `https://betgeniusbr.com`
2. Faça login
3. Vá em "Depósito"
4. Tente fazer um depósito PIX
5. Verifique se o QR Code aparece
6. Acompanhe os logs:

```bash
ssh -p 65002 u127271520@betgeniusbr.com
cd /home/u127271520/domains/betgeniusbr.com/public_html
tail -f storage/logs/laravel.log
```

## 🆘 Se Algo Der Errado

Restaure o backup:
```bash
ssh -p 65002 u127271520@betgeniusbr.com
cd /home/u127271520/domains/betgeniusbr.com/public_html/app/Http/Controllers/Api/Wallet/
cp DepositController.php.old DepositController.php
php artisan config:clear
php artisan cache:clear
```

---

**Status**: ✅ Arquivo pronto para upload!

