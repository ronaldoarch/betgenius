# 🎰 Frontend React - BetGenius

## ✅ Projeto Completo Criado!

### 📁 Estrutura Criada

```
frontend-react/
├── package.json              # Dependências e scripts
├── vite.config.js            # Configuração do Vite
├── index.html                # HTML base
├── .gitignore                # Arquivos ignorados
├── README.md                 # Documentação completa
├── INSTALACAO.md             # Guia de instalação
└── src/
    ├── main.jsx              # Entry point
    ├── App.jsx               # Componente principal
    ├── index.css             # Estilos globais
    ├── App.css               # Estilos do App
    ├── services/
    │   └── api.js            # Serviços de API
    ├── contexts/
    │   ├── AuthContext.jsx   # Contexto de autenticação
    │   └── WalletContext.jsx # Contexto de carteira/saldo
    ├── components/
    │   ├── Header.jsx        # Cabeçalho
    │   ├── Header.css
    │   ├── Sidebar.jsx       # Barra lateral
    │   ├── Sidebar.css
    │   ├── GameCard.jsx      # Card de jogo
    │   ├── GameCard.css
    │   ├── LoginModal.jsx    # Modal de login
    │   ├── RegisterModal.jsx # Modal de cadastro
    │   └── Modal.css
    └── pages/
        ├── Home.jsx          # Página inicial
        ├── Home.css
        ├── Deposit.jsx       # Página de depósito
        ├── Deposit.css
        ├── Withdraw.jsx      # Página de saque
        ├── Withdraw.css
        ├── History.jsx       # Histórico
        ├── History.css
        ├── Profile.jsx       # Perfil
        ├── Profile.css
        ├── Promotions.jsx    # Promoções
        └── Promotions.css
```

## 🚀 Como Usar

### 1. Instalar Dependências

```bash
cd frontend-react
npm install
```

### 2. Executar

```bash
npm run dev
```

Acesse: `http://localhost:3000`

### 3. Build

```bash
npm run build
```

## ✨ Funcionalidades Implementadas

### ✅ Autenticação
- Login com JWT
- Cadastro
- Logout
- Verificação automática de token

### ✅ Home Pública
- Lista de jogos
- Busca de jogos
- Filtros por categoria
- Jogos em destaque
- Banner promocional

### ✅ Depósito
- Formulário de depósito
- Geração de QR Code PIX
- **Verificação automática de status (polling a cada 5s)**
- **Atualização automática de saldo após aprovação**

### ✅ Jogos
- **Imagens carregadas corretamente** (`/storage/{cover}`)
- **Abertura de jogos com verificação de saldo**
- Integração com PlayFiver
- Saldo enviado para o provedor

### ✅ Saldo
- **Exibição no header**
- **Atualização automática após depósito**
- **Verificação antes de abrir jogos**
- Cálculo: `balance + balance_bonus + balance_withdrawal`

### ✅ Outras Funcionalidades
- Saque via PIX
- Histórico de transações
- Perfil do usuário
- Promoções

## 🔌 Integrações

### Rotas da API Utilizadas

- `GET /api/categories` - Categorias
- `GET /api/featured/games` - Jogos em destaque
- `GET /api/casinos/games` - Todos os jogos
- `GET /api/games/single/{id}` - Abrir jogo (verifica saldo)
- `POST /api/auth/login` - Login
- `POST /api/auth/register` - Cadastro
- `GET /api/auth/verify` - Verificar token
- `GET /api/profile/wallet` - Obter saldo
- `GET /api/profile/mywallet` - Obter carteiras
- `POST /api/carteira_wallet/deposit/payment` - Criar depósito
- `GET /api/carteira_wallet/deposit` - Listar depósitos
- `POST /api/carteira_wallet/withdraw/request` - Solicitar saque
- `GET /api/carteira_wallet/withdraw` - Listar saques
- `GET /api/promocoes` - Promoções

### Imagens dos Jogos

Formato: `https://betgeniusbr.com/storage/{campo_cover}`

Exemplo: Se `cover = "games/fortune-tiger.webp"`, URL = `https://betgeniusbr.com/storage/games/fortune-tiger.webp`

## 💰 Fluxo Completo de Depósito e Saldo

1. **Usuário faz depósito:**
   ```
   POST /api/carteira_wallet/deposit/payment
   Body: { amount: 30, cpf: "12345678900" }
   ```

2. **Sistema retorna QR Code:**
   ```json
   {
     "status": true,
     "idTransaction": 123,
     "qrcode": "00020126..."
   }
   ```

3. **Frontend verifica status (polling):**
   ```
   GET /api/carteira_wallet/deposit
   Verifica se deposit.status === 1 (aprovado)
   ```

4. **Webhook aprova depósito:**
   - Gateway envia webhook
   - Backend atualiza `deposit.status = 1`
   - Backend credita: `wallet->balance += deposit.amount`

5. **Frontend detecta aprovação:**
   - Polling detecta `status === 1`
   - Chama `loadWallet()` para atualizar saldo
   - Saldo aparece no header automaticamente

6. **Usuário joga:**
   ```
   GET /api/games/single/{id}
   Backend verifica: wallet->total_balance > 0
   Se sim, retorna gameUrl e token
   Frontend abre gameUrl em nova aba
   ```

## 🎯 Próximos Passos

1. **Instalar dependências:**
   ```bash
   cd frontend-react
   npm install
   ```

2. **Testar localmente:**
   ```bash
   npm run dev
   ```

3. **Fazer build:**
   ```bash
   npm run build
   ```

4. **Deploy:**
   - Upload da pasta `dist/` para o servidor
   - Ou integrar ao Laravel

## 📝 Notas

- ✅ Todas as rotas estão conectadas
- ✅ Imagens dos jogos formatadas corretamente
- ✅ Saldo atualiza automaticamente após depósito
- ✅ Verificação de saldo antes de abrir jogos
- ✅ Token JWT gerenciado automaticamente
- ✅ Design responsivo
- ✅ Tema escuro aplicado

