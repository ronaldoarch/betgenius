# 🚀 Guia de Deploy - Frontend React

## Opções de Deploy

### Opção 1: Build e Upload Manual (Recomendado para Laravel)

### Opção 2: Deploy via SSH

### Opção 3: Integrar ao Laravel (Servir via Laravel)

---

## 📦 Opção 1: Build e Upload Manual

### Passo 1: Build do Projeto

```bash
cd frontend-react
npm install
npm run build
```

Isso criará a pasta `dist/` com os arquivos otimizados.

### Passo 2: Upload dos Arquivos

**Via FileZilla:**
1. Conecte ao servidor
2. Navegue até: `/public_html/public/`
3. Crie uma pasta: `app` (ou outro nome)
4. Faça upload de TODOS os arquivos de `dist/` para essa pasta

**Via SSH:**
```bash
# No seu computador local
cd frontend-react
npm run build

# Compactar
tar -czf frontend-react.tar.gz dist/

# Upload via SCP (se funcionar)
scp frontend-react.tar.gz u127271520@betgeniusbr.com:/home/u127271520/domains/betgeniusbr.com/public_html/public/

# No servidor, descompactar
ssh u127271520@betgeniusbr.com
cd /home/u127271520/domains/betgeniusbr.com/public_html/public
tar -xzf frontend-react.tar.gz
mv dist/* app/
rm -rf dist frontend-react.tar.gz
```

### Passo 3: Configurar Acesso

Após o upload, acesse:
```
https://betgeniusbr.com/app/
```

---

## 🔧 Opção 2: Deploy via SSH (Script Automatizado)

### Criar Script de Deploy

```bash
#!/bin/bash
# deploy.sh

echo "📦 Fazendo build..."
npm run build

echo "📤 Compactando arquivos..."
tar -czf frontend-react.tar.gz dist/

echo "📤 Fazendo upload..."
scp frontend-react.tar.gz u127271520@betgeniusbr.com:/tmp/

echo "🔄 Descompactando no servidor..."
ssh u127271520@betgeniusbr.com << 'EOF'
cd /home/u127271520/domains/betgeniusbr.com/public_html/public
mkdir -p app
cd /tmp
tar -xzf frontend-react.tar.gz
mv dist/* /home/u127271520/domains/betgeniusbr.com/public_html/public/app/
rm -rf dist frontend-react.tar.gz
echo "✅ Deploy concluído!"
EOF

echo "✅ Deploy finalizado!"
echo "🌐 Acesse: https://betgeniusbr.com/app/"
```

---

## 🎯 Opção 3: Integrar ao Laravel (Melhor Opção)

### Passo 1: Build

```bash
cd frontend-react
npm install
npm run build
```

### Passo 2: Configurar Laravel para Servir React

**Opção A: Servir como SPA (Recomendado)**

1. Copie os arquivos de `dist/` para `public_html/public/`
2. Configure o Laravel para redirecionar todas as rotas para `index.html`

**Opção B: Integrar ao Laravel Blade**

1. Copie os arquivos de `dist/` para `public_html/public/build/`
2. Modifique o `index.php` do Laravel para servir o React

---

## 📋 Passo a Passo Detalhado (Opção 1 - Manual)

### 1. Build Local

```bash
cd /Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo/frontend-react
npm install
npm run build
```

### 2. Verificar Build

```bash
ls -la dist/
```

Você deve ver:
- `index.html`
- `assets/` (com JS e CSS)

### 3. Upload via FileZilla

1. Abra FileZilla
2. Conecte: `betgeniusbr.com` (usuário: `u127271520`)
3. Navegue até: `/public_html/public/`
4. Crie pasta: `app` (ou `react` ou `frontend`)
5. Arraste TODOS os arquivos de `dist/` para `app/`

### 4. Acessar

```
https://betgeniusbr.com/app/
```

---

## ⚙️ Configuração de Rotas (Importante!)

### Se usar subpasta (ex: `/app/`)

Edite `vite.config.js` ANTES do build:

```javascript
export default defineConfig({
  plugins: [react()],
  base: '/app/', // Adicione esta linha
  // ... resto da config
})
```

Depois faça o build novamente.

### Se usar raiz (`/`)

Não precisa configurar nada, apenas faça upload para `public_html/public/`

---

## 🔄 Atualizar API Base URL (Se Necessário)

Se o frontend estiver em subpasta, a API continua funcionando normalmente pois usa URL absoluta.

Mas se precisar mudar, edite `src/services/api.js`:

```javascript
const API_BASE = 'https://betgeniusbr.com/api' // Já está correto
```

---

## ✅ Checklist de Deploy

- [ ] `npm install` executado
- [ ] `npm run build` executado com sucesso
- [ ] Pasta `dist/` criada
- [ ] Arquivos enviados para o servidor
- [ ] Permissões corretas (755 para pastas, 644 para arquivos)
- [ ] Testado acesso via navegador
- [ ] API respondendo corretamente
- [ ] Imagens carregando
- [ ] Login funcionando

---

## 🐛 Troubleshooting

### Erro 404 nas rotas
- Configure `base` no `vite.config.js`
- Ou configure `.htaccess` para redirecionar

### Imagens não aparecem
- Verifique se `/storage/` está acessível
- Verifique permissões

### API não funciona
- Verifique CORS no Laravel
- Verifique se a URL da API está correta

### Build falha
- Verifique se todas as dependências estão instaladas
- Verifique erros no console

---

## 📝 Comandos Rápidos

```bash
# Build
npm run build

# Preview do build local
npm run preview

# Ver tamanho do build
du -sh dist/
```

