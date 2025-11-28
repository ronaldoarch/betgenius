#!/bin/bash

# Script para fazer upload do frontend-completo-home.html via SSH
# Uso: ./upload_frontend.sh

echo "📤 Fazendo upload do frontend-completo-home.html via SSH..."
echo ""

# Ler o arquivo local e criar no servidor via SSH
ssh u127271520@betgeniusbr.com << 'SSH_EOF'
cd /home/u127271520/domains/betgeniusbr.com/public_html/public

cat > frontend-completo-home.html << 'FILE_EOF'
<!DOCTYPE html>
<html lang="pt-BR" class="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BetGenius - Cassino Online</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto Condensed', Arial, sans-serif;
            background: #030c16;
            color: #ffffff;
            min-height: 100vh;
        }

        /* Header */
        .header {
            background: #000f21;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 1000;
            border-bottom: 2px solid #01b7fc;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #01b7fc;
            cursor: pointer;
        }

        .header-nav {
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .nav-link {
            color: #ffffff;
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 5px;
            transition: all 0.3s;
        }

        .nav-link:hover {
            background: #01b7fc;
            color: #ffffff;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .balance {
            background: #002769;
            padding: 10px 20px;
            border-radius: 5px;
            border: 1px solid #01b7fc;
        }

        .balance-label {
            font-size: 12px;
            color: #ffffff;
            opacity: 0.8;
        }

        .balance-value {
            font-size: 18px;
            font-weight: bold;
            color: #01b7fc;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .btn-primary {
            background: #01b7fc;
            color: #ffffff;
        }

        .btn-primary:hover {
            background: #0199d4;
        }

        .btn-secondary {
            background: #002769;
            color: #ffffff;
            border: 1px solid #01b7fc;
        }

        .btn-secondary:hover {
            background: #003993;
        }

        .btn-danger {
            background: #b22e2e;
            color: #ffffff;
        }

        .btn-orange {
            background: #ff6b00;
            color: #ffffff;
        }

        .btn-orange:hover {
            background: #e55a00;
        }

        /* Container */
        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 20px;
            display: flex;
            gap: 20px;
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            background: #00152f;
            border-radius: 10px;
            padding: 20px;
            height: fit-content;
            position: sticky;
            top: 90px;
        }

        .sidebar-section {
            margin-bottom: 30px;
        }

        .sidebar-title {
            color: #01b7fc;
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 15px;
            text-transform: uppercase;
        }

        .sidebar-link {
            display: block;
            color: #ffffff;
            padding: 10px;
            margin-bottom: 5px;
            border-radius: 5px;
            text-decoration: none;
            transition: all 0.3s;
            cursor: pointer;
        }

        .sidebar-link:hover {
            background: #01b7fc;
            color: #ffffff;
        }

        .sidebar-link.active {
            background: #01b7fc;
            color: #ffffff;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            min-width: 0;
        }

        /* Banner Promocional */
        .promo-banner {
            background: linear-gradient(135deg, #ff6b00 0%, #ff8c00 100%);
            border-radius: 10px;
            padding: 30px;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            gap: 20px;
            position: relative;
            overflow: hidden;
        }

        .promo-banner::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            animation: rotate 20s linear infinite;
        }

        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .promo-content {
            flex: 1;
            position: relative;
            z-index: 1;
        }

        .promo-title {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .promo-subtitle {
            font-size: 18px;
            opacity: 0.9;
        }

        /* Search Bar */
        .search-container {
            margin-bottom: 30px;
        }

        .search-bar {
            width: 100%;
            padding: 15px 20px;
            background: #021c47;
            border: 2px solid #01b7fc;
            border-radius: 10px;
            color: #ffffff;
            font-size: 16px;
        }

        .search-bar:focus {
            outline: none;
            border-color: #03c6fc;
            box-shadow: 0 0 0 3px rgba(1, 183, 252, 0.1);
        }

        /* Category Filters */
        .category-filters {
            display: flex;
            gap: 10px;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }

        .category-filter {
            padding: 10px 20px;
            background: #021c47;
            border: 1px solid #01b7fc;
            border-radius: 20px;
            color: #ffffff;
            cursor: pointer;
            transition: all 0.3s;
            font-size: 14px;
        }

        .category-filter:hover,
        .category-filter.active {
            background: #01b7fc;
            color: #ffffff;
        }

        /* Game Section */
        .game-section {
            margin-bottom: 40px;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .section-title {
            font-size: 24px;
            font-weight: bold;
            color: #01b7fc;
        }

        .games-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
            gap: 20px;
        }

        .game-card {
            background: #021c47;
            border-radius: 10px;
            overflow: hidden;
            cursor: pointer;
            transition: all 0.3s;
            border: 2px solid transparent;
        }

        .game-card:hover {
            transform: translateY(-5px);
            border-color: #01b7fc;
            box-shadow: 0 10px 30px rgba(1, 183, 252, 0.3);
        }

        .game-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            background: #002769;
        }

        .game-info {
            padding: 15px;
        }

        .game-name {
            font-size: 14px;
            font-weight: bold;
            color: #ffffff;
            margin-bottom: 5px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .game-provider {
            font-size: 12px;
            color: #01b7fc;
            opacity: 0.8;
        }

        /* Surprise Boxes */
        .surprise-boxes {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 40px;
        }

        .surprise-box {
            border-radius: 10px;
            padding: 30px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
        }

        .surprise-box:hover {
            transform: scale(1.05);
        }

        .surprise-box.iphone {
            background: linear-gradient(135deg, #ff1493 0%, #ff69b4 100%);
        }

        .surprise-box.xiaomi {
            background: linear-gradient(135deg, #32cd32 0%, #00ff00 100%);
        }

        .surprise-box.sextou {
            background: linear-gradient(135deg, #ff0000 0%, #ff4500 100%);
        }

        .surprise-box-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .surprise-box-btn {
            background: rgba(255, 255, 255, 0.2);
            border: 2px solid #ffffff;
            color: #ffffff;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            margin-top: 15px;
        }

        /* Forms */
        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #ffffff;
            font-weight: bold;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 12px;
            background: #ffffff;
            border: 1px solid #01b7fc;
            border-radius: 5px;
            color: #030c16;
            font-size: 16px;
        }

        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: #03c6fc;
            box-shadow: 0 0 0 3px rgba(1, 183, 252, 0.1);
        }

        /* Quick Amount Buttons */
        .quick-amounts {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .quick-amount-btn {
            padding: 10px 20px;
            background: #002769;
            color: #ffffff;
            border: 1px solid #01b7fc;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .quick-amount-btn:hover {
            background: #01b7fc;
        }

        /* Alert */
        .alert {
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            display: none;
        }

        .alert.show {
            display: block;
        }

        .alert-success {
            background: #d4edda;
            border: 1px solid #c3e6cb;
            color: #155724;
        }

        .alert-error {
            background: #f8d7da;
            border: 1px solid #f5c6cb;
            color: #721c24;
        }

        .alert-info {
            background: #d1ecf1;
            border: 1px solid #bee5eb;
            color: #0c5460;
        }

        /* QR Code */
        .qrcode-container {
            margin-top: 20px;
            padding: 20px;
            background: #002769;
            border-radius: 5px;
            text-align: center;
        }

        .qrcode-text {
            word-break: break-all;
            font-family: monospace;
            font-size: 12px;
            background: #ffffff;
            color: #030c16;
            padding: 15px;
            border-radius: 5px;
            margin-top: 10px;
        }

        /* Table */
        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .table th,
        .table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #01b7fc;
        }

        .table th {
            background: #002769;
            color: #01b7fc;
            font-weight: bold;
        }

        .table td {
            color: #ffffff;
        }

        .status-badge {
            padding: 5px 10px;
            border-radius: 3px;
            font-size: 12px;
            font-weight: bold;
        }

        .status-pending {
            background: #ffc107;
            color: #000;
        }

        .status-approved {
            background: #28a745;
            color: #fff;
        }

        .status-rejected {
            background: #dc3545;
            color: #fff;
        }

        /* Loading */
        .loading {
            display: none;
            text-align: center;
            padding: 40px;
        }

        .loading.show {
            display: block;
        }

        .spinner {
            border: 3px solid #002769;
            border-top: 3px solid #01b7fc;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            animation: spin 1s linear infinite;
            margin: 0 auto;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Modal */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            z-index: 2000;
            align-items: center;
            justify-content: center;
        }

        .modal.show {
            display: flex;
        }

        .modal-content {
            background: #021c47;
            padding: 30px;
            border-radius: 10px;
            max-width: 500px;
            width: 90%;
            max-height: 90vh;
            overflow-y: auto;
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .modal-title {
            font-size: 24px;
            color: #01b7fc;
        }

        .modal-close {
            background: none;
            border: none;
            color: #ffffff;
            font-size: 30px;
            cursor: pointer;
        }

        /* Page */
        .page {
            display: none;
        }

        .page.active {
            display: block;
        }

        /* Content Box */
        .content-box {
            background: #021c47;
            padding: 30px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        /* Hidden */
        .hidden {
            display: none !important;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                position: static;
            }

            .header {
                flex-wrap: wrap;
            }

            .header-nav {
                order: 3;
                width: 100%;
                margin-top: 10px;
            }

            .games-grid {
                grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <div class="logo" onclick="showPage('home')">🎰 BetGenius</div>
        <div class="header-nav" id="headerNav">
            <a href="#" class="nav-link" onclick="showPage('home'); return false;">Cassino</a>
            <a href="#" class="nav-link" onclick="showPage('home'); return false;">Esportes</a>
        </div>
        <div class="user-info" id="userInfo">
            <div class="balance hidden" id="userBalance">
                <div class="balance-label">Saldo</div>
                <div class="balance-value" id="balanceValue">R$ 0,00</div>
            </div>
            <button class="btn btn-primary hidden" id="btnDeposit" onclick="showPage('deposit')">💰 Depositar</button>
            <button class="btn btn-secondary hidden" id="btnProfile" onclick="showPage('profile')">👤 Perfil</button>
            <button class="btn btn-danger hidden" id="btnLogout" onclick="logout()">Sair</button>
            <button class="btn btn-primary" id="btnLogin" onclick="showLoginModal()">Entrar</button>
            <button class="btn btn-orange" id="btnRegister" onclick="showRegisterModal()">Cadastrar</button>
        </div>
    </div>

    <!-- Main Container -->
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar" id="sidebar">
            <div class="sidebar-section">
                <div class="sidebar-title">Cassino</div>
                <a href="#" class="sidebar-link" onclick="loadCategory('all'); return false;">Todos os jogos</a>
                <a href="#" class="sidebar-link" onclick="loadCategory('new'); return false;">Jogos novos</a>
                <a href="#" class="sidebar-link" onclick="loadCategory('featured'); return false;">Recomendados</a>
            </div>
            <div class="sidebar-section">
                <div class="sidebar-title">Categorias</div>
                <div id="sidebarCategories"></div>
            </div>
            <div class="sidebar-section">
                <div class="sidebar-title">Geral</div>
                <a href="#" class="sidebar-link" onclick="showPage('promotions'); return false;">Promoções</a>
                <a href="#" class="sidebar-link" onclick="showPage('promotions'); return false;">Códigos promocionais</a>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Home Page -->
            <div id="homePage" class="page active">
                <!-- Banner Promocional -->
                <div class="promo-banner">
                    <div class="promo-content">
                        <div class="promo-title">🎁 VOCÊ GANHOU! GIROS GRÁTIS</div>
                        <div class="promo-subtitle">CUPOM: BEMVINDO</div>
                    </div>
                </div>

                <!-- Search Bar -->
                <div class="search-container">
                    <input type="text" class="search-bar" id="searchGames" placeholder="Pesquise por nome de jogo..." onkeyup="searchGames(this.value)" />
                </div>

                <!-- Category Filters -->
                <div class="category-filters" id="categoryFilters"></div>

                <!-- Surprise Boxes -->
                <div class="surprise-boxes">
                    <div class="surprise-box iphone">
                        <div class="surprise-box-title">📱 IPHONE</div>
                        <button class="surprise-box-btn">ABRIR CAIXA</button>
                    </div>
                    <div class="surprise-box xiaomi">
                        <div class="surprise-box-title">📱 XIAOMI</div>
                        <button class="surprise-box-btn">ABRIR CAIXA</button>
                    </div>
                    <div class="surprise-box sextou">
                        <div class="surprise-box-title">🎉 SEXTOU</div>
                        <button class="surprise-box-btn">ABRIR CAIXA</button>
                    </div>
                </div>

                <!-- Games Sections -->
                <div id="gamesSections"></div>

                <!-- Loading -->
                <div id="loading" class="loading">
                    <div class="spinner"></div>
                    <p style="margin-top: 10px;">Carregando jogos...</p>
                </div>
            </div>

            <!-- Deposit Page -->
            <div id="depositPage" class="page">
                <div class="content-box">
                    <h2 style="margin-bottom: 20px; color: #01b7fc;">💰 Fazer Depósito</h2>
                    <div id="depositAlert" class="alert"></div>
                    
                    <div class="form-group">
                        <label>Valor (R$):</label>
                        <input type="number" id="depositAmount" placeholder="30.00" step="0.01" min="1" value="30" />
                    </div>

                    <div class="quick-amounts">
                        <button class="quick-amount-btn" onclick="setAmount(30)">R$ 30</button>
                        <button class="quick-amount-btn" onclick="setAmount(50)">R$ 50</button>
                        <button class="quick-amount-btn" onclick="setAmount(100)">R$ 100</button>
                        <button class="quick-amount-btn" onclick="setAmount(200)">R$ 200</button>
                        <button class="quick-amount-btn" onclick="setAmount(500)">R$ 500</button>
                    </div>

                    <div class="form-group">
                        <label>CPF:</label>
                        <input type="text" id="depositCpf" placeholder="000.000.000-00" />
                    </div>

                    <button class="btn btn-primary" onclick="submitDeposit()" style="width: 100%; padding: 15px; font-size: 16px;">
                        💳 Gerar QR Code PIX
                    </button>

                    <div id="depositResult" class="qrcode-container hidden">
                        <h3 style="color: #01b7fc; margin-bottom: 15px;">✅ Depósito Criado!</h3>
                        <p style="margin-bottom: 10px;">ID da Transação: <strong id="depositId"></strong></p>
                        <p style="margin-bottom: 15px;">Escaneie o QR Code ou copie o código PIX:</p>
                        <div class="qrcode-text" id="depositQrcode"></div>
                        <button class="btn btn-secondary" onclick="copyQrcode()" style="margin-top: 15px;">📋 Copiar Código PIX</button>
                    </div>
                </div>
            </div>

            <!-- Withdraw Page -->
            <div id="withdrawPage" class="page">
                <div class="content-box">
                    <h2 style="margin-bottom: 20px; color: #01b7fc;">💸 Solicitar Saque</h2>
                    <div id="withdrawAlert" class="alert"></div>
                    
                    <div class="form-group">
                        <label>Valor (R$):</label>
                        <input type="number" id="withdrawAmount" placeholder="50.00" step="0.01" min="1" />
                    </div>

                    <div class="form-group">
                        <label>Chave PIX:</label>
                        <input type="text" id="withdrawPixKey" placeholder="CPF, Email, Telefone ou Chave Aleatória" />
                    </div>

                    <div class="form-group">
                        <label>Tipo de Chave:</label>
                        <select id="withdrawPixType">
                            <option value="cpf">CPF</option>
                            <option value="email">Email</option>
                            <option value="phoneNumber">Telefone</option>
                            <option value="randomKey">Chave Aleatória</option>
                        </select>
                    </div>

                    <button class="btn btn-primary" onclick="submitWithdraw()" style="width: 100%; padding: 15px; font-size: 16px;">
                        💸 Solicitar Saque
                    </button>
                </div>
            </div>

            <!-- History Page -->
            <div id="historyPage" class="page">
                <div class="content-box">
                    <h2 style="margin-bottom: 20px; color: #01b7fc;">📋 Histórico de Transações</h2>
                    
                    <div style="margin-bottom: 20px;">
                        <button class="btn btn-secondary" onclick="loadDeposits()">💰 Depósitos</button>
                        <button class="btn btn-secondary" onclick="loadWithdrawals()">💸 Saques</button>
                    </div>

                    <div id="historyContent">
                        <p style="text-align: center; color: #ffffff; opacity: 0.8;">Selecione uma opção acima</p>
                    </div>
                </div>
            </div>

            <!-- Profile Page -->
            <div id="profilePage" class="page">
                <div class="content-box">
                    <h2 style="margin-bottom: 20px; color: #01b7fc;">👤 Meu Perfil</h2>
                    <div id="profileContent">
                        <p style="text-align: center; color: #ffffff; opacity: 0.8;">Carregando...</p>
                    </div>
                </div>
            </div>

            <!-- Promotions Page -->
            <div id="promotionsPage" class="page">
                <div class="content-box">
                    <h2 style="margin-bottom: 20px; color: #01b7fc;">🎁 Promoções</h2>
                    <div id="promotionsContent">
                        <p style="text-align: center; color: #ffffff; opacity: 0.8;">Carregando promoções...</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Login Modal -->
    <div id="loginModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title">🔐 Login</h2>
                <button class="modal-close" onclick="closeModal('loginModal')">&times;</button>
            </div>
            <div id="loginAlert" class="alert"></div>
            <div class="form-group">
                <label>Email:</label>
                <input type="email" id="loginEmail" placeholder="seu@email.com" />
            </div>
            <div class="form-group">
                <label>Senha:</label>
                <input type="password" id="loginPassword" placeholder="Sua senha" />
            </div>
            <button class="btn btn-primary" onclick="login()" style="width: 100%;">Entrar</button>
            <p style="text-align: center; margin-top: 20px; color: #ffffff; opacity: 0.8;">
                Não tem conta? <a href="#" onclick="closeModal('loginModal'); showRegisterModal();" style="color: #01b7fc;">Cadastre-se</a>
            </p>
        </div>
    </div>

    <!-- Register Modal -->
    <div id="registerModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title">📝 Cadastro</h2>
                <button class="modal-close" onclick="closeModal('registerModal')">&times;</button>
            </div>
            <div id="registerAlert" class="alert"></div>
            <div class="form-group">
                <label>Nome:</label>
                <input type="text" id="registerName" placeholder="Seu nome" />
            </div>
            <div class="form-group">
                <label>Email:</label>
                <input type="email" id="registerEmail" placeholder="seu@email.com" />
            </div>
            <div class="form-group">
                <label>Senha:</label>
                <input type="password" id="registerPassword" placeholder="Mínimo 8 caracteres" />
            </div>
            <div class="form-group">
                <label>Confirmar Senha:</label>
                <input type="password" id="registerPasswordConfirm" placeholder="Confirme sua senha" />
            </div>
            <button class="btn btn-primary" onclick="register()" style="width: 100%;">Cadastrar</button>
            <p style="text-align: center; margin-top: 20px; color: #ffffff; opacity: 0.8;">
                Já tem conta? <a href="#" onclick="closeModal('registerModal'); showLoginModal();" style="color: #01b7fc;">Faça login</a>
            </p>
        </div>
    </div>

    <script>
        const API_BASE = 'https://betgeniusbr.com/api';
        let currentToken = null;
        let currentUser = null;
        let allGames = [];
        let allCategories = [];

        // Inicialização
        window.addEventListener('DOMContentLoaded', function() {
            const savedToken = localStorage.getItem('token');
            if (savedToken) {
                currentToken = savedToken;
                verifyToken();
            } else {
                updateUIForGuest();
            }
            loadHomePage();
        });

        // Função para fazer requisições autenticadas
        async function apiRequest(url, options = {}) {
            const headers = {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                ...options.headers
            };

            if (currentToken) {
                headers['Authorization'] = `Bearer ${currentToken}`;
            }

            const response = await fetch(`${API_BASE}${url}`, {
                ...options,
                headers
            });

            if (response.status === 401) {
                localStorage.removeItem('token');
                currentToken = null;
                updateUIForGuest();
                showAlert('Sua sessão expirou. Faça login novamente.', 'error');
                return null;
            }

            return response;
        }

        // Login
        async function login() {
            const email = document.getElementById('loginEmail').value;
            const password = document.getElementById('loginPassword').value;
            const alert = document.getElementById('loginAlert');

            if (!email || !password) {
                showAlertElement(alert, 'Preencha todos os campos', 'error');
                return;
            }

            try {
                const response = await fetch(`${API_BASE}/auth/login`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'Accept': 'application/json'
                    },
                    body: JSON.stringify({ email, password })
                });

                const data = await response.json();

                if (response.ok && data.access_token) {
                    currentToken = data.access_token;
                    localStorage.setItem('token', currentToken);
                    showAlertElement(alert, 'Login realizado com sucesso!', 'success');
                    closeModal('loginModal');
                    setTimeout(() => {
                        verifyToken();
                    }, 1000);
                } else {
                    showAlertElement(alert, data.error || 'Erro ao fazer login', 'error');
                }
            } catch (error) {
                showAlertElement(alert, 'Erro ao conectar com o servidor', 'error');
            }
        }

        // Register
        async function register() {
            const name = document.getElementById('registerName').value;
            const email = document.getElementById('registerEmail').value;
            const password = document.getElementById('registerPassword').value;
            const passwordConfirm = document.getElementById('registerPasswordConfirm').value;
            const alert = document.getElementById('registerAlert');

            if (!name || !email || !password || !passwordConfirm) {
                showAlertElement(alert, 'Preencha todos os campos', 'error');
                return;
            }

            if (password !== passwordConfirm) {
                showAlertElement(alert, 'As senhas não coincidem', 'error');
                return;
            }

            if (password.length < 8) {
                showAlertElement(alert, 'A senha deve ter no mínimo 8 caracteres', 'error');
                return;
            }

            try {
                const response = await fetch(`${API_BASE}/auth/register`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'Accept': 'application/json'
                    },
                    body: JSON.stringify({ name, email, password, password_confirmation: passwordConfirm })
                });

                const data = await response.json();

                if (response.ok && data.access_token) {
                    currentToken = data.access_token;
                    localStorage.setItem('token', currentToken);
                    showAlertElement(alert, 'Cadastro realizado com sucesso!', 'success');
                    closeModal('registerModal');
                    setTimeout(() => {
                        verifyToken();
                    }, 1000);
                } else {
                    showAlertElement(alert, data.error || 'Erro ao cadastrar', 'error');
                }
            } catch (error) {
                showAlertElement(alert, 'Erro ao conectar com o servidor', 'error');
            }
        }

        // Verificar token
        async function verifyToken() {
            const response = await apiRequest('/auth/me');
            if (response && response.ok) {
                currentUser = await response.json();
                updateUIForUser();
                loadWallet();
                loadProfile();
            } else {
                updateUIForGuest();
            }
        }

        // Logout
        async function logout() {
            await apiRequest('/auth/logout', { method: 'POST' });
            localStorage.removeItem('token');
            currentToken = null;
            currentUser = null;
            updateUIForGuest();
            showPage('home');
        }

        // Atualizar UI para usuário logado
        function updateUIForUser() {
            document.getElementById('userBalance').classList.remove('hidden');
            document.getElementById('btnDeposit').classList.remove('hidden');
            document.getElementById('btnProfile').classList.remove('hidden');
            document.getElementById('btnLogout').classList.remove('hidden');
            document.getElementById('btnLogin').classList.add('hidden');
            document.getElementById('btnRegister').classList.add('hidden');
        }

        // Atualizar UI para visitante
        function updateUIForGuest() {
            document.getElementById('userBalance').classList.add('hidden');
            document.getElementById('btnDeposit').classList.add('hidden');
            document.getElementById('btnProfile').classList.add('hidden');
            document.getElementById('btnLogout').classList.add('hidden');
            document.getElementById('btnLogin').classList.remove('hidden');
            document.getElementById('btnRegister').classList.remove('hidden');
        }

        // Carregar carteira
        async function loadWallet() {
            const response = await apiRequest('/profile/wallet');
            if (response && response.ok) {
                const data = await response.json();
                if (data.wallets && data.wallets.length > 0) {
                    const wallet = data.wallets.find(w => w.active) || data.wallets[0];
                    document.getElementById('balanceValue').textContent = 
                        `R$ ${parseFloat(wallet.balance || 0).toFixed(2).replace('.', ',')}`;
                }
            }
        }

        // Carregar perfil
        async function loadProfile() {
            const response = await apiRequest('/auth/me');
            if (response && response.ok) {
                currentUser = await response.json();
                const profileContent = document.getElementById('profileContent');
                profileContent.innerHTML = `
                    <div class="form-group">
                        <label>Nome:</label>
                        <input type="text" value="${currentUser.name || ''}" readonly />
                    </div>
                    <div class="form-group">
                        <label>Email:</label>
                        <input type="email" value="${currentUser.email || ''}" readonly />
                    </div>
                    <div class="form-group">
                        <label>ID:</label>
                        <input type="text" value="${currentUser.id || ''}" readonly />
                    </div>
                `;
            }
        }

        // Carregar Home Page
        async function loadHomePage() {
            showLoading(true);
            try {
                await Promise.all([
                    loadCategories(),
                    loadFeaturedGames(),
                    loadGamesByCategories()
                ]);
            } catch (error) {
                console.error('Erro ao carregar home:', error);
            } finally {
                showLoading(false);
            }
        }

        // Carregar categorias
        async function loadCategories() {
            try {
                const response = await fetch(`${API_BASE}/categories`);
                if (response.ok) {
                    const data = await response.json();
                    allCategories = data.categories || [];
                    renderSidebarCategories();
                    renderCategoryFilters();
                }
            } catch (error) {
                console.error('Erro ao carregar categorias:', error);
            }
        }

        // Renderizar categorias na sidebar
        function renderSidebarCategories() {
            const container = document.getElementById('sidebarCategories');
            container.innerHTML = allCategories.map(cat => 
                `<a href="#" class="sidebar-link" onclick="loadCategory('${cat.slug || cat.name}'); return false;">${cat.name}</a>`
            ).join('');
        }

        // Renderizar filtros de categoria
        function renderCategoryFilters() {
            const container = document.getElementById('categoryFilters');
            const filters = [
                { name: 'Todos', slug: 'all' },
                { name: 'Recomendados', slug: 'featured' },
                ...allCategories.slice(0, 8)
            ];
            container.innerHTML = filters.map(cat => 
                `<button class="category-filter" onclick="loadCategory('${cat.slug || cat.name}')">${cat.name}</button>`
            ).join('');
        }

        // Carregar jogos em destaque
        async function loadFeaturedGames() {
            try {
                const response = await fetch(`${API_BASE}/featured/games`);
                if (response.ok) {
                    const data = await response.json();
                    if (data.featured_games && data.featured_games.length > 0) {
                        renderGameSection('Recomendados', data.featured_games);
                    }
                }
            } catch (error) {
                console.error('Erro ao carregar jogos em destaque:', error);
            }
        }

        // Carregar jogos por categorias
        async function loadGamesByCategories() {
            try {
                const response = await fetch(`${API_BASE}/casinos/games`);
                if (response.ok) {
                    const data = await response.json();
                    if (data.games && data.games.data) {
                        allGames = data.games.data;
                        // Agrupar por categoria
                        const gamesByCategory = {};
                        allGames.forEach(game => {
                            if (game.categories && game.categories.length > 0) {
                                game.categories.forEach(cat => {
                                    if (!gamesByCategory[cat.name]) {
                                        gamesByCategory[cat.name] = [];
                                    }
                                    gamesByCategory[cat.name].push(game);
                                });
                            }
                        });
                        // Renderizar cada categoria
                        Object.keys(gamesByCategory).forEach(catName => {
                            renderGameSection(catName, gamesByCategory[catName].slice(0, 12));
                        });
                    }
                }
            } catch (error) {
                console.error('Erro ao carregar jogos por categorias:', error);
            }
        }

        // Renderizar seção de jogos
        function renderGameSection(title, games) {
            const container = document.getElementById('gamesSections');
            const section = document.createElement('div');
            section.className = 'game-section';
            section.innerHTML = `
                <div class="section-header">
                    <h3 class="section-title">${title}</h3>
                </div>
                <div class="games-grid">
                    ${games.map(game => `
                        <div class="game-card" onclick="openGame(${game.id})">
                            <img src="${game.cover || '/storage/games/default.jpg'}" alt="${game.game_name}" class="game-image" onerror="this.src='https://via.placeholder.com/180x200?text=Game'">
                            <div class="game-info">
                                <div class="game-name">${game.game_name}</div>
                                <div class="game-provider">${game.provider?.name || 'N/A'}</div>
                            </div>
                        </div>
                    `).join('')}
                </div>
            `;
            container.appendChild(section);
        }

        // Carregar categoria específica
        async function loadCategory(categorySlug) {
            showLoading(true);
            const container = document.getElementById('gamesSections');
            container.innerHTML = '';
            
            try {
                const url = categorySlug === 'featured' 
                    ? `${API_BASE}/featured/games`
                    : `${API_BASE}/casinos/games?category=${categorySlug}`;
                
                const response = await fetch(url);
                if (response.ok) {
                    const data = await response.json();
                    const games = data.featured_games || (data.games?.data || []);
                    if (games.length > 0) {
                        const title = categorySlug === 'featured' ? 'Recomendados' : 
                                     categorySlug === 'all' ? 'Todos os Jogos' : 
                                     allCategories.find(c => c.slug === categorySlug)?.name || categorySlug;
                        renderGameSection(title, games);
                    }
                }
            } catch (error) {
                console.error('Erro ao carregar categoria:', error);
            } finally {
                showLoading(false);
            }
        }

        // Buscar jogos
        let searchTimeout;
        function searchGames(query) {
            clearTimeout(searchTimeout);
            if (query.length < 3) return;
            
            searchTimeout = setTimeout(async () => {
                showLoading(true);
                try {
                    const response = await fetch(`${API_BASE}/casinos/games?searchTerm=${encodeURIComponent(query)}`);
                    if (response.ok) {
                        const data = await response.json();
                        const container = document.getElementById('gamesSections');
                        container.innerHTML = '';
                        if (data.games && data.games.data && data.games.data.length > 0) {
                            renderGameSection(`Resultados para "${query}"`, data.games.data);
                        } else {
                            container.innerHTML = '<p style="text-align: center; color: #ffffff; opacity: 0.8;">Nenhum jogo encontrado</p>';
                        }
                    }
                } catch (error) {
                    console.error('Erro ao buscar jogos:', error);
                } finally {
                    showLoading(false);
                }
            }, 500);
        }

        // Abrir jogo
        function openGame(gameId) {
            if (!currentToken) {
                showLoginModal();
                return;
            }
            // Aqui você pode implementar a lógica para abrir o jogo
            alert(`Abrindo jogo ID: ${gameId}`);
        }

        // Depósito
        function setAmount(amount) {
            document.getElementById('depositAmount').value = amount;
        }

        async function submitDeposit() {
            const amount = parseFloat(document.getElementById('depositAmount').value);
            const cpf = document.getElementById('depositCpf').value.replace(/[^0-9]/g, '');

            if (!amount || amount <= 0) {
                showAlertElement(document.getElementById('depositAlert'), 'Informe um valor válido', 'error');
                return;
            }

            if (!cpf || cpf.length !== 11) {
                showAlertElement(document.getElementById('depositAlert'), 'Informe um CPF válido', 'error');
                return;
            }

            showLoading(true);
            hideAlert('depositAlert');

            try {
                const response = await apiRequest('/carteira_wallet/deposit/payment', {
                    method: 'POST',
                    body: JSON.stringify({ amount, cpf })
                });

                if (response && response.ok) {
                    const data = await response.json();
                    if (data.status && data.qrcode) {
                        document.getElementById('depositId').textContent = data.idTransaction;
                        document.getElementById('depositQrcode').textContent = data.qrcode;
                        document.getElementById('depositResult').classList.remove('hidden');
                        showAlertElement(document.getElementById('depositAlert'), 'Depósito criado com sucesso!', 'success');
                        loadWallet();
                    } else {
                        showAlertElement(document.getElementById('depositAlert'), data.error || 'Erro ao criar depósito', 'error');
                    }
                } else {
                    const error = await response.json();
                    showAlertElement(document.getElementById('depositAlert'), error.error || 'Erro ao criar depósito', 'error');
                }
            } catch (error) {
                showAlertElement(document.getElementById('depositAlert'), 'Erro ao conectar com o servidor', 'error');
            } finally {
                showLoading(false);
            }
        }

        function copyQrcode() {
            const qrcode = document.getElementById('depositQrcode').textContent;
            navigator.clipboard.writeText(qrcode).then(() => {
                showAlertElement(document.getElementById('depositAlert'), 'Código PIX copiado!', 'success');
            });
        }

        // Saque
        async function submitWithdraw() {
            const amount = parseFloat(document.getElementById('withdrawAmount').value);
            const pixKey = document.getElementById('withdrawPixKey').value;
            const pixType = document.getElementById('withdrawPixType').value;

            if (!amount || amount <= 0) {
                showAlertElement(document.getElementById('withdrawAlert'), 'Informe um valor válido', 'error');
                return;
            }

            if (!pixKey) {
                showAlertElement(document.getElementById('withdrawAlert'), 'Informe a chave PIX', 'error');
                return;
            }

            showLoading(true);
            hideAlert('withdrawAlert');

            try {
                const response = await apiRequest('/carteira_wallet/withdraw/request', {
                    method: 'POST',
                    body: JSON.stringify({ 
                        amount, 
                        pix_key: pixKey,
                        pix_key_type: pixType
                    })
                });

                if (response && response.ok) {
                    const data = await response.json();
                    showAlertElement(document.getElementById('withdrawAlert'), 'Saque solicitado com sucesso!', 'success');
                    document.getElementById('withdrawAmount').value = '';
                    document.getElementById('withdrawPixKey').value = '';
                    loadWallet();
                } else {
                    const error = await response.json();
                    showAlertElement(document.getElementById('withdrawAlert'), error.error || 'Erro ao solicitar saque', 'error');
                }
            } catch (error) {
                showAlertElement(document.getElementById('withdrawAlert'), 'Erro ao conectar com o servidor', 'error');
            } finally {
                showLoading(false);
            }
        }

        // Histórico
        async function loadDeposits() {
            showLoading(true);
            try {
                const response = await apiRequest('/carteira_wallet/deposit');
                if (response && response.ok) {
                    const data = await response.json();
                    displayHistory(data.deposits || [], 'deposit');
                }
            } catch (error) {
                showAlert('Erro ao carregar depósitos', 'error');
            } finally {
                showLoading(false);
            }
        }

        async function loadWithdrawals() {
            showLoading(true);
            try {
                const response = await apiRequest('/carteira_wallet/withdraw');
                if (response && response.ok) {
                    const data = await response.json();
                    displayHistory(data.withdrawals || [], 'withdraw');
                }
            } catch (error) {
                showAlert('Erro ao carregar saques', 'error');
            } finally {
                showLoading(false);
            }
        }

        function displayHistory(items, type) {
            const content = document.getElementById('historyContent');
            if (!items || items.length === 0) {
                content.innerHTML = '<p style="text-align: center; color: #ffffff; opacity: 0.8;">Nenhuma transação encontrada</p>';
                return;
            }

            const table = `
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Valor</th>
                            <th>Tipo</th>
                            <th>Status</th>
                            <th>Data</th>
                        </tr>
                    </thead>
                    <tbody>
                        ${items.map(item => `
                            <tr>
                                <td>#${item.id}</td>
                                <td>R$ ${parseFloat(item.amount || 0).toFixed(2).replace('.', ',')}</td>
                                <td>${type === 'deposit' ? '💰 Depósito' : '💸 Saque'}</td>
                                <td>
                                    <span class="status-badge status-${getStatusClass(item.status)}">
                                        ${getStatusText(item.status)}
                                    </span>
                                </td>
                                <td>${formatDate(item.created_at)}</td>
                            </tr>
                        `).join('')}
                    </tbody>
                </table>
            `;
            content.innerHTML = table;
        }

        function getStatusClass(status) {
            if (status === 1 || status === 'approved') return 'approved';
            if (status === 2 || status === 'rejected') return 'rejected';
            return 'pending';
        }

        function getStatusText(status) {
            if (status === 1 || status === 'approved') return 'Aprovado';
            if (status === 2 || status === 'rejected') return 'Rejeitado';
            return 'Pendente';
        }

        function formatDate(dateString) {
            if (!dateString) return '-';
            const date = new Date(dateString);
            return date.toLocaleString('pt-BR');
        }

        // Navegação
        function showPage(pageName) {
            if (pageName !== 'home' && !currentToken) {
                showLoginModal();
                return;
            }

            document.querySelectorAll('.page').forEach(page => {
                page.classList.remove('active');
            });

            document.getElementById(`${pageName}Page`).classList.add('active');

            if (pageName === 'profile') {
                loadProfile();
            } else if (pageName === 'promotions') {
                loadPromotions();
            }
        }

        // Carregar promoções
        async function loadPromotions() {
            try {
                const response = await fetch(`${API_BASE}/promocoes`);
                if (response.ok) {
                    const data = await response.json();
                    const content = document.getElementById('promotionsContent');
                    if (data && data.length > 0) {
                        content.innerHTML = data.map(promo => `
                            <div class="content-box" style="margin-bottom: 20px;">
                                <h3 style="color: #01b7fc; margin-bottom: 10px;">${promo.titulo}</h3>
                                ${promo.imagem ? `<img src="${promo.imagem}" alt="${promo.titulo}" style="max-width: 100%; border-radius: 5px; margin-bottom: 10px;">` : ''}
                                ${promo.regras_html ? `<div>${promo.regras_html}</div>` : ''}
                            </div>
                        `).join('');
                    } else {
                        content.innerHTML = '<p style="text-align: center; color: #ffffff; opacity: 0.8;">Nenhuma promoção disponível</p>';
                    }
                }
            } catch (error) {
                console.error('Erro ao carregar promoções:', error);
            }
        }

        // Modais
        function showLoginModal() {
            document.getElementById('loginModal').classList.add('show');
        }

        function showRegisterModal() {
            document.getElementById('registerModal').classList.add('show');
        }

        function closeModal(modalId) {
            document.getElementById(modalId).classList.remove('show');
        }

        // Utilitários
        function showAlert(message, type = 'info') {
            const alert = document.getElementById('alert');
            showAlertElement(alert, message, type);
        }

        function showAlertElement(element, message, type) {
            if (!element) return;
            element.textContent = message;
            element.className = `alert alert-${type} show`;
            setTimeout(() => {
                element.classList.remove('show');
            }, 5000);
        }

        function hideAlert(alertId) {
            const alert = document.getElementById(alertId);
            if (alert) alert.classList.remove('show');
        }

        function showLoading(show) {
            const loading = document.getElementById('loading');
            if (show) {
                loading.classList.add('show');
            } else {
                loading.classList.remove('show');
            }
        }

        // Fechar modal ao clicar fora
        window.addEventListener('click', function(e) {
            if (e.target.classList.contains('modal')) {
                e.target.classList.remove('show');
            }
        });

        // Enter nos campos
        document.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                if (document.getElementById('loginModal').classList.contains('show')) {
                    login();
                } else if (document.getElementById('registerModal').classList.contains('show')) {
                    register();
                }
            }
        });
    </script>
</body>
</html>

FILE_EOF

echo "✅ Arquivo criado com sucesso!"
echo ""
echo "📋 Verificando arquivo..."
ls -lh frontend-completo-home.html
echo ""
echo "✅ Upload concluído!"
echo "🌐 Acesse: https://betgeniusbr.com/frontend-completo-home.html"
SSH_EOF

echo ""
echo "✅ Upload concluído com sucesso!"
