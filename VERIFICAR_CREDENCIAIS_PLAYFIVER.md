# 🔑 Verificar Credenciais do PlayFiver

## ⚠️ Problema
Erro SSL ao conectar com a API do PlayFiver:
```
cURL error 35: error:0A000458:SSL routines::tlsv1 unrecognized name
```

## 🔍 Possíveis Causas

1. **Credenciais inválidas** - Token, Secret ou Code incorretos
2. **Problema temporário da API** - API do PlayFiver com problemas
3. **Configuração SSL do servidor** - Problema de infraestrutura

---

## ✅ Como Verificar

### 1. Acessar Admin
1. Acesse: `https://betgeniusbr.com/zirigui`
2. Vá em "Chaves dos Jogos" (ou similar)

### 2. Verificar Credenciais
Verifique se estão preenchidos:
- `playfiver_token`
- `playfiver_secret`
- `playfiver_code`

### 3. Testar Conexão (via SSH)
```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

php artisan tinker --execute="
\$setting = \App\Models\GamesKey::first();
if (\$setting) {
    echo 'Token: ' . (empty(\$setting->playfiver_token) ? 'VAZIO' : 'Preenchido') . PHP_EOL;
    echo 'Secret: ' . (empty(\$setting->playfiver_secret) ? 'VAZIO' : 'Preenchido') . PHP_EOL;
    echo 'Code: ' . (empty(\$setting->playfiver_code) ? 'VAZIO' : 'Preenchido') . PHP_EOL;
} else {
    echo 'GamesKey não encontrado!' . PHP_EOL;
}
"
```

---

## 🆘 Se as Credenciais Estiverem Corretas

O erro SSL pode ser:
1. **Problema temporário da API do PlayFiver**
2. **Configuração SSL do servidor**
3. **Firewall bloqueando conexões**

**Solução:** Contatar suporte do PlayFiver informando o erro SSL.

---

## 📝 Nota

O código já está tratando esse erro corretamente e retornando mensagem de erro clara ao usuário. O problema é de conexão com a API externa, não do seu código.

