# 📦 Guia de Instalação - Frontend React

## Pré-requisitos

- Node.js 18+ instalado
- npm ou yarn

## Passo a Passo

### 1. Instalar Dependências

```bash
cd frontend-react
npm install
```

### 2. Executar em Desenvolvimento

```bash
npm run dev
```

O frontend estará disponível em: `http://localhost:3000`

### 3. Build para Produção

```bash
npm run build
```

Os arquivos serão gerados em `dist/`

### 4. Deploy

#### Opção 1: Integrar ao Laravel

1. Após o build, copie os arquivos de `dist/` para `public_html/public/`
2. Ou configure o Laravel para servir os arquivos React

#### Opção 2: Deploy Separado

1. Faça upload da pasta `dist/` para seu servidor
2. Configure o servidor web (Nginx/Apache) para servir os arquivos
3. Configure CORS na API Laravel se necessário

## 🔧 Configuração da API

A API está configurada para:
- **Base URL**: `https://betgeniusbr.com/api`
- **Proxy em desenvolvimento**: Configurado no `vite.config.js`

Para mudar a URL da API, edite `src/services/api.js`:

```javascript
const API_BASE = 'https://betgeniusbr.com/api' // Altere aqui
```

## ✅ Funcionalidades Implementadas

- ✅ Autenticação completa (Login/Register/Logout)
- ✅ Home pública com jogos e categorias
- ✅ Imagens dos jogos carregadas corretamente
- ✅ Depósito com QR Code PIX
- ✅ Verificação automática de status do depósito
- ✅ Atualização automática de saldo após depósito
- ✅ Abertura de jogos com verificação de saldo
- ✅ Saque via PIX
- ✅ Histórico de transações
- ✅ Perfil do usuário
- ✅ Promoções

## 🎮 Como Funciona o Saldo nos Jogos

1. **Usuário deposita:**
   - Cria depósito via `/api/carteira_wallet/deposit/payment`
   - Recebe QR Code PIX
   - Frontend verifica status a cada 5 segundos

2. **Webhook aprova depósito:**
   - Gateway envia webhook
   - Backend credita saldo em `wallet->balance`
   - Frontend detecta mudança e atualiza saldo

3. **Usuário joga:**
   - Clica no jogo
   - Sistema verifica `wallet->total_balance > 0`
   - Se tiver saldo, abre o jogo
   - Saldo é enviado para o provedor (PlayFiver)

## 📝 Notas Importantes

- O token JWT é armazenado no `localStorage`
- Todas as requisições autenticadas incluem `Authorization: Bearer <token>`
- O saldo é calculado como: `balance + balance_bonus + balance_withdrawal`
- As imagens dos jogos devem estar em `/public/storage/games/`

