# 🎰 BetGenius - Frontend React

Frontend completo em React para o cassino BetGenius, com todas as funcionalidades de depósito, saque, jogos e gerenciamento de saldo.

## 🚀 Instalação

```bash
# Instalar dependências
npm install

# Iniciar servidor de desenvolvimento
npm run dev

# Build para produção
npm run build
```

## 📋 Funcionalidades

### ✅ Implementadas

1. **Autenticação**
   - Login com JWT
   - Cadastro de usuários
   - Logout
   - Verificação automática de token

2. **Home Pública**
   - Lista de jogos por categoria
   - Busca de jogos
   - Filtros por categoria
   - Jogos em destaque
   - Banner promocional
   - Caixas surpresa

3. **Depósito**
   - Formulário de depósito
   - Geração de QR Code PIX
   - Verificação automática de status (polling)
   - Atualização automática de saldo após aprovação

4. **Saque**
   - Solicitação de saque via PIX
   - Validação de chave PIX
   - Atualização de saldo

5. **Histórico**
   - Lista de depósitos
   - Lista de saques
   - Status das transações

6. **Perfil**
   - Visualização de dados do usuário

7. **Jogos**
   - Abertura de jogos com verificação de saldo
   - Imagens dos jogos carregadas corretamente
   - Integração com PlayFiver

8. **Saldo em Tempo Real**
   - Atualização automática após depósito
   - Exibição no header
   - Verificação antes de abrir jogos

## 🔌 Integrações com API

### Rotas Utilizadas

- `GET /api/categories` - Lista categorias
- `GET /api/featured/games` - Jogos em destaque
- `GET /api/casinos/games` - Todos os jogos
- `GET /api/games/single/{id}` - Abrir jogo (verifica saldo)
- `POST /api/auth/login` - Login
- `POST /api/auth/register` - Cadastro
- `POST /api/auth/me` - Verificar token
- `GET /api/profile/wallet` - Obter saldo
- `POST /api/carteira_wallet/deposit/payment` - Criar depósito
- `GET /api/carteira_wallet/deposit` - Listar depósitos
- `POST /api/carteira_wallet/withdraw/request` - Solicitar saque
- `GET /api/carteira_wallet/withdraw` - Listar saques
- `GET /api/promocoes` - Listar promoções

### Imagens dos Jogos

As imagens são servidas via:
```
https://betgeniusbr.com/storage/{caminho_do_cover}
```

O campo `cover` no banco armazena o caminho relativo (ex: `games/fortune-tiger.webp`)

## 💰 Fluxo de Depósito e Saldo

1. **Usuário faz depósito:**
   - Preenche valor e CPF
   - Sistema gera QR Code PIX
   - Depósito criado com status `0` (pendente)

2. **Webhook do Gateway:**
   - Gateway envia webhook quando pagamento é aprovado
   - Backend atualiza status do depósito para `1` (aprovado)
   - Backend credita saldo na carteira (`wallet->balance`)

3. **Frontend verifica status:**
   - Polling a cada 5 segundos
   - Quando status muda para `1`, atualiza saldo
   - Saldo aparece no header automaticamente

4. **Usuário joga:**
   - Clica no jogo
   - Sistema verifica `wallet->total_balance > 0`
   - Se tiver saldo, abre o jogo
   - Saldo é enviado para o provedor do jogo (PlayFiver)

## 🎮 Abertura de Jogos

Quando o usuário clica em um jogo:

1. Verifica autenticação
2. Chama `/api/games/single/{id}`
3. Backend verifica `wallet->total_balance > 0`
4. Se tiver saldo:
   - Gera token JWT com `user_id` e `game_code`
   - Para PlayFiver, envia `user_balance` (total_balance)
   - Retorna `gameUrl` e `token`
5. Frontend abre `gameUrl` em nova aba

## 📁 Estrutura de Pastas

```
src/
├── components/       # Componentes reutilizáveis
│   ├── Header.jsx
│   ├── Sidebar.jsx
│   ├── GameCard.jsx
│   ├── LoginModal.jsx
│   └── RegisterModal.jsx
├── contexts/         # Contextos React
│   ├── AuthContext.jsx
│   └── WalletContext.jsx
├── pages/            # Páginas
│   ├── Home.jsx
│   ├── Deposit.jsx
│   ├── Withdraw.jsx
│   ├── History.jsx
│   ├── Profile.jsx
│   └── Promotions.jsx
├── services/         # Serviços de API
│   └── api.js
├── App.jsx           # Componente principal
└── main.jsx          # Entry point
```

## 🔧 Configuração

O arquivo `vite.config.js` está configurado com proxy para a API:
- Desenvolvimento: `http://localhost:3000` (proxy para `https://betgeniusbr.com`)
- Produção: Requer build e deploy

## 📦 Build para Produção

```bash
npm run build
```

Os arquivos serão gerados em `dist/` e podem ser servidos via qualquer servidor web estático ou integrados ao Laravel.

## 🌐 Deploy

Após o build, você pode:

1. **Integrar ao Laravel:**
   - Copiar arquivos de `dist/` para `public/`
   - Ou servir via CDN

2. **Servir separadamente:**
   - Deploy em Vercel, Netlify, etc.
   - Configurar CORS na API Laravel

## ⚠️ Importante

- O token JWT é armazenado no `localStorage`
- Todas as requisições autenticadas incluem `Authorization: Bearer <token>`
- O saldo é atualizado automaticamente após depósitos aprovados
- As imagens dos jogos devem estar em `/public/storage/games/`

## 🐛 Troubleshooting

### Imagens não aparecem
- Verifique se o caminho no banco está correto
- Verifique se as imagens existem em `/public/storage/`
- Verifique permissões do diretório

### Saldo não atualiza
- Verifique se o webhook está funcionando
- Verifique se o polling está ativo
- Verifique console do navegador para erros

### Jogos não abrem
- Verifique se o usuário está autenticado
- Verifique se tem saldo (`total_balance > 0`)
- Verifique console para erros da API

