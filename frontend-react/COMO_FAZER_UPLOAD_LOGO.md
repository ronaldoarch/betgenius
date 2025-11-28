# 📤 COMO FAZER UPLOAD DOS LOGOS

## 🎯 MÉTODO 1: Via Interface do Admin (RECOMENDADO)

### Passo a Passo:

1. **Acesse o admin:**
   - URL: `https://betgeniusbr.com/zirigui`
   - Faça login com suas credenciais

2. **Vá em Settings:**
   - No menu lateral, clique em **"Settings"** ou **"DEFINIÇÕES DA PLATAFORMA"**

3. **Faça upload dos logos:**
   - **LOGOTIPO 1** (`software_logo_white`):
     - Label: "LOGOTIPO 1 | --> [ 1228 x 274 ] FICA NA HOME"
     - Este é o logo que aparece no header do site
     - Clique no campo e selecione o arquivo
   
   - **LOGOTIPO 2** (`software_logo_black`):
     - Label: "LOGOTIPO 2 | --> [ 400x100 ] FICA NO CARREGAMENTO"
     - Este é o logo que aparece na tela de loading
     - Clique no campo e selecione o arquivo

4. **Salve:**
   - Clique no botão **"Salvar Informações"** (botão roxo/azul no canto inferior esquerdo)

---

## 🔧 MÉTODO 2: Via SSH (Se você tem os arquivos localmente)

### Se você tem os arquivos de logo no seu computador:

1. **Copie os arquivos para o servidor via SCP:**

```bash
# No seu MacBook (terminal local):
scp -P 65002 /caminho/para/seu/logo-white.png u127271520@betgeniusbr.com:~/logo-white.png
scp -P 65002 /caminho/para/seu/logo-black.png u127271520@betgeniusbr.com:~/logo-black.png
```

2. **Conecte via SSH e mova os arquivos:**

```bash
ssh -p 65002 u127271520@betgeniusbr.com

# Depois de conectar:
cd /home/u127271520/domains/betgeniusbr.com/public_html

# Criar diretório se não existir
mkdir -p storage/app/public/uploads

# Mover os arquivos (substitua pelos nomes corretos)
mv ~/logo-white.png storage/app/public/uploads/
mv ~/logo-black.png storage/app/public/uploads/

# Ajustar permissões
chmod 644 storage/app/public/uploads/*.png
```

3. **Atualizar no banco de dados:**

Depois de fazer upload via admin, os paths serão salvos automaticamente no banco.

---

## 📋 MÉTODO 3: Upload via File Manager do Hosting

1. **Acesse o hPanel:**
   - URL: `https://hpanel.hostinger.com/`
   - Faça login

2. **Vá em File Manager:**
   - Navegue até: `public_html/storage/app/public/uploads/`

3. **Faça upload dos arquivos:**
   - Clique em "Upload"
   - Selecione os arquivos de logo
   - Aguarde o upload completar

4. **Atualizar via admin:**
   - Acesse: `https://betgeniusbr.com/zirigui`
   - Vá em Settings
   - Selecione os arquivos que você acabou de fazer upload
   - Salve

---

## ✅ VERIFICAÇÃO APÓS UPLOAD

Execute no SSH para verificar:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html && LOGO_WHITE=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/data | grep -o '"software_logo_white":"[^"]*' | cut -d'"' -f4 | sed 's/\\//g') && LOGO_BLACK=$(curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/data | grep -o '"software_logo_black":"[^"]*' | cut -d'"' -f4 | sed 's/\\//g') && echo "Verificando logos:" && if [ -f "storage/app/public/$LOGO_WHITE" ]; then echo "✅ Logo White existe"; ls -lh "storage/app/public/$LOGO_WHITE"; else echo "❌ Logo White NÃO existe"; fi && if [ -f "storage/app/public/$LOGO_BLACK" ]; then echo "✅ Logo Black existe"; ls -lh "storage/app/public/$LOGO_BLACK"; else echo "❌ Logo Black NÃO existe"; fi
```

---

## 💡 RECOMENDAÇÃO

**Use o MÉTODO 1 (via interface do admin)** - é mais fácil e atualiza automaticamente o banco de dados com os paths corretos.

