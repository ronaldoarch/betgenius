# ⚡ SOLUÇÃO RÁPIDA - Adicionar Coluna external_id

## 🎯 Problema Identificado

A coluna `external_id` está **faltando** na tabela `deposits`. Esta coluna é essencial para o Cartwavehub funcionar.

---

## 🔧 SOLUÇÃO IMEDIATA (Execute no SSH)

Conecte ao servidor e execute este comando SQL diretamente:

```bash
ssh -p 65002 u127271520@betgeniusbr.com
```

Depois, copie e cole este bloco completo:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Adicionar a coluna via SQL direto
php artisan tinker --execute="
\DB::statement('ALTER TABLE deposits ADD COLUMN IF NOT EXISTS external_id VARCHAR(100) NULL UNIQUE AFTER id');
\DB::statement('ALTER TABLE deposits ADD INDEX IF NOT EXISTS idx_external_id (external_id)');
echo '✅ Coluna external_id adicionada!' . PHP_EOL;
"

# Verificar se funcionou
php artisan tinker --execute="
if (\Schema::hasColumn('deposits', 'external_id')) {
    echo '✅ SUCESSO: Coluna external_id existe!' . PHP_EOL;
} else {
    echo '❌ ERRO: Coluna external_id ainda não existe' . PHP_EOL;
}
"
```

---

## 🔄 ALTERNATIVA: Via Migration Laravel

Se preferir usar migration (método mais "Laravel"):

### 1️⃣ Fazer Upload da Migration

Use FileZilla ou SCP para enviar:

**Arquivo:**
```
database/migrations/2025_01_26_000000_add_external_id_to_deposits.php
```

**Destino:**
```
/home/u127271520/domains/betgeniusbr.com/public_html/database/migrations/
```

### 2️⃣ Executar a Migration

```bash
ssh -p 65002 u127271520@betgeniusbr.com
cd /home/u127271520/domains/betgeniusbr.com/public_html
php artisan migrate
```

---

## ✅ Verificação Final

Após executar uma das soluções acima, verifique:

```bash
php artisan tinker --execute="
echo '🔍 Verificando estrutura do banco...' . PHP_EOL;
echo '' . PHP_EOL;

// Verificar gateways
if (\Schema::hasColumn('gateways', 'cartwavehub_api_secret')) {
    echo '✅ gateways.cartwavehub_api_secret: OK' . PHP_EOL;
} else {
    echo '❌ gateways.cartwavehub_api_secret: FALTA' . PHP_EOL;
}

if (\Schema::hasColumn('gateways', 'cartwavehub_api_public')) {
    echo '✅ gateways.cartwavehub_api_public: OK' . PHP_EOL;
} else {
    echo '⚠️  gateways.cartwavehub_api_public: FALTA (opcional)' . PHP_EOL;
}

if (\Schema::hasColumn('gateways', 'cartwavehub_uri')) {
    echo '✅ gateways.cartwavehub_uri: OK' . PHP_EOL;
} else {
    echo '⚠️  gateways.cartwavehub_uri: FALTA (opcional)' . PHP_EOL;
}

// Verificar deposits
if (\Schema::hasColumn('deposits', 'external_id')) {
    echo '✅ deposits.external_id: OK' . PHP_EOL;
} else {
    echo '❌ deposits.external_id: FALTA (CRÍTICO!)' . PHP_EOL;
}

if (\Schema::hasColumn('deposits', 'proof')) {
    echo '✅ deposits.proof: OK' . PHP_EOL;
} else {
    echo '⚠️  deposits.proof: FALTA (recomendado)' . PHP_EOL;
}

echo '' . PHP_EOL;
echo '✅ Verificação concluída!' . PHP_EOL;
"
```

**Resultado esperado:**
```
🔍 Verificando estrutura do banco...

✅ gateways.cartwavehub_api_secret: OK
✅ gateways.cartwavehub_api_public: OK (ou ⚠️ se não existir, mas é opcional)
✅ gateways.cartwavehub_uri: OK (ou ⚠️ se não existir, mas é opcional)
✅ deposits.external_id: OK
✅ deposits.proof: OK (ou ⚠️ se não existir, mas é recomendado)

✅ Verificação concluída!
```

---

## 📋 Após Corrigir o Banco

Depois de adicionar a coluna `external_id`, continue com a instalação do Cartwavehub:

1. ✅ **Coluna external_id adicionada** (você está aqui)
2. ⏭️ **Fazer upload dos arquivos PHP** (Helper, Controllers, Rotas)
3. ⏭️ **Incluir rotas no routes/api.php**
4. ⏭️ **Limpar cache do Laravel**
5. ⏭️ **Configurar credenciais no admin**
6. ⏭️ **Testar o fluxo completo**

---

## 🚨 Dica Importante

Se você receber erro de "UNKNOWN COLUMN" ao adicionar a coluna:
- A coluna pode já existir mas com nome diferente
- Execute: `SHOW COLUMNS FROM deposits;` para ver todas as colunas

Se você receber erro de "IF NOT EXISTS not supported":
- Seu MySQL/MariaDB pode ser antigo
- Use este comando alternativo:

```bash
php artisan tinker --execute="
try {
    \DB::statement('ALTER TABLE deposits ADD COLUMN external_id VARCHAR(100) NULL UNIQUE AFTER id');
    echo '✅ Coluna external_id adicionada!' . PHP_EOL;
} catch (\Exception \$e) {
    if (strpos(\$e->getMessage(), 'Duplicate column') !== false) {
        echo '⚠️  Coluna external_id já existe!' . PHP_EOL;
    } else {
        echo '❌ Erro: ' . \$e->getMessage() . PHP_EOL;
    }
}
"
```

---

**Depois de adicionar a coluna, volte ao `RESUMO_INSTALACAO.md` para continuar! 🚀**

