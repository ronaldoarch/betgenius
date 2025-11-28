# 📚 GUIA COMPLETO - Cartwavehub + Correção 404

## 🎯 SITUAÇÃO ATUAL

Você tem **2 problemas** para resolver:

1. ❌ **Erro 404** nas rotas do Laravel (`/profile/deposit` etc)
2. ⏳ **Instalação do Cartwavehub** ainda não concluída

---

## ⚡ COMECE AQUI

### 🔴 PRIORIDADE 1: Corrigir o Erro 404

**👉 Abra este arquivo primeiro:**
```
EXECUTAR_AGORA.md
```

Este arquivo contém:
- ✅ Comandos prontos para copiar e colar
- ✅ Script automático de correção
- ✅ Solução rápida em 3 passos

---

### 🟡 PRIORIDADE 2: Adicionar Coluna no Banco

**👉 Depois que o site voltar a funcionar, abra:**
```
SOLUCAO_RAPIDA.md
```

Este arquivo contém:
- ✅ Como adicionar a coluna `external_id`
- ✅ Comandos SQL prontos
- ✅ Verificação automática

---

### 🟢 PRIORIDADE 3: Instalar Cartwavehub

**👉 Depois de adicionar a coluna, abra:**
```
RESUMO_INSTALACAO.md
```

Este arquivo contém:
- ✅ Checklist completo
- ✅ 3 opções de instalação
- ✅ O que foi feito vs o que falta

---

## 📂 ÍNDICE DE ARQUIVOS

### 🚨 Correção de Problemas (URGENTE)

| Arquivo | Descrição | Quando Usar |
|---------|-----------|-------------|
| **EXECUTAR_AGORA.md** | 🔥 **COMECE AQUI** - Corrige 404 | Agora mesmo |
| **CORRIGIR_404_ROTAS.md** | Guia detalhado do erro 404 | Se o erro 404 persistir |
| **fix_404.sh** | Script automático de correção | Execute no servidor SSH |
| **SOLUCAO_RAPIDA.md** | Adicionar coluna external_id | Após corrigir o 404 |

---

### 📦 Instalação do Cartwavehub

| Arquivo | Descrição | Quando Usar |
|---------|-----------|-------------|
| **RESUMO_INSTALACAO.md** | 📋 Visão geral completa | Leia primeiro |
| **INSTALAR_MANUAL.md** | Guia passo a passo detalhado | Se precisar de mais detalhes |
| **GUIA_INSTALACAO_CARTWAVEHUB.md** | Documentação técnica completa | Referência técnica |

---

### 🛠️ Scripts de Instalação

| Arquivo | Descrição | Como Executar |
|---------|-----------|---------------|
| **instalar_cartwavehub_completo.sh** | Upload automático (requer senha) | `./instalar_cartwavehub_completo.sh` |
| **upload_individual.sh** | Upload com senha interativa | `./upload_individual.sh` |
| **limpar_cartwavehub_antigo.sh** | Remove implementação antiga | No servidor via SSH |
| **verificar_estrutura_banco.sh** | Verifica banco de dados | No servidor via SSH |

---

### 📝 Comandos Prontos

| Arquivo | Descrição | Quando Usar |
|---------|-----------|-------------|
| **COMANDOS_SSH_PRONTOS.sh** | Comandos para copiar/colar | Durante instalação |
| **CORRIGIR_BANCO_DADOS.sh** | Adicionar coluna external_id | Se SOLUCAO_RAPIDA.md não funcionar |

---

### 💻 Arquivos de Código (PHP/Laravel)

| Arquivo | Descrição | Local no Servidor |
|---------|-----------|-------------------|
| **app/Helpers/CartwavehubHelper.php** | Classe principal da API | `app/Helpers/` |
| **app/Http/Controllers/Api/CartwavehubDepositController.php** | Controller de depósitos | `app/Http/Controllers/Api/` |
| **app/Http/Controllers/Api/CartwavehubWebhookController.php** | Controller de webhooks | `app/Http/Controllers/Api/` |
| **routes/api_cartwavehub.php** | Rotas da API | `routes/` |

---

### 🗄️ Migrations (Banco de Dados)

| Arquivo | Descrição | Como Executar |
|---------|-----------|---------------|
| **database/migrations/2025_01_26_000000_add_external_id_to_deposits.php** | Adiciona coluna external_id | `php artisan migrate` |

---

## 🎬 ROTEIRO DE EXECUÇÃO

### Fase 1: Corrigir o Site (10 min)

```
1. Abra: EXECUTAR_AGORA.md
2. Copie e cole os comandos do PASSO 2
3. Teste: https://betgeniusbr.com/profile/deposit
4. ✅ Site funcionando? Continue para Fase 2
5. ❌ Ainda com erro? Veja: CORRIGIR_404_ROTAS.md
```

---

### Fase 2: Preparar o Banco (5 min)

```
1. Abra: SOLUCAO_RAPIDA.md
2. Execute o comando SQL direto (mais rápido)
3. Verifique se a coluna foi criada
4. ✅ Coluna criada? Continue para Fase 3
```

---

### Fase 3: Instalar Cartwavehub (15 min)

```
1. Abra: RESUMO_INSTALACAO.md
2. Escolha uma das 3 opções de upload:
   - Opção A: FileZilla (RECOMENDADO)
   - Opção B: upload_individual.sh
   - Opção C: Copiar e colar via SSH
3. Siga o checklist de instalação
4. Configure as credenciais no admin
5. ✅ Instalação concluída!
```

---

### Fase 4: Testar (5 min)

```
1. Acesse o admin: https://betgeniusbr.com/admin
2. Configure as credenciais do Cartwavehub
3. Teste criar um depósito PIX
4. Verifique os logs: tail -f storage/logs/laravel.log
5. ✅ Tudo funcionando!
```

---

## 🆘 SE PRECISAR DE AJUDA

### Problema: Erro 404 não foi corrigido
**Solução:** Abra `CORRIGIR_404_ROTAS.md` e execute o "SCRIPT COMPLETO DE CORREÇÃO"

### Problema: Não consigo adicionar a coluna external_id
**Solução:** Execute o SQL direto no phpMyAdmin ou via Tinker

### Problema: Upload dos arquivos falha
**Solução:** Use FileZilla em vez dos scripts SCP

### Problema: Rotas do Cartwavehub não aparecem
**Solução:** 
```bash
# Verificar se o arquivo foi incluído
grep "api_cartwavehub" routes/api.php

# Se não aparecer, adicione:
echo "require __DIR__ . '/api_cartwavehub.php';" >> routes/api.php
```

### Problema: Webhook não funciona
**Solução:** Verifique os logs em `storage/logs/laravel.log`

---

## 📊 STATUS ATUAL

### ✅ Concluído:
- [x] Arquivos criados localmente
- [x] Scripts preparados
- [x] Documentação completa
- [x] Migration criada

### ⏳ Pendente:
- [ ] Corrigir erro 404 do site
- [ ] Adicionar coluna `external_id`
- [ ] Fazer upload dos arquivos PHP
- [ ] Configurar rotas
- [ ] Configurar credenciais
- [ ] Testar o fluxo completo

---

## 🎯 PRÓXIMO PASSO

**👉 Abra agora: `EXECUTAR_AGORA.md`**

Execute o PASSO 2 e me avise o resultado!

---

## 📞 CONTATOS DE SUPORTE

### Hostinger (Problemas no Servidor)
- Painel: https://hpanel.hostinger.com
- Chat/Ticket: Disponível 24/7

### Cartwavehub (Problemas na API)
- Documentação: https://api-docs.cashtime.com.br
- Suporte: Contato via dashboard do Cartwavehub

---

## 📚 ARQUIVOS DE REFERÊNCIA

- `CORRECOES_SSH.md` - Histórico de correções anteriores
- `GUIA_SSH_UPLOAD.md` - Como usar SSH/SCP
- `DIAGNOSTICO_404.md` - Diagnóstico detalhado de 404
- `SOLUCAO_404.md` - Soluções anteriores para 404

---

**Boa sorte! 🚀**

*Última atualização: 2025-01-26*

