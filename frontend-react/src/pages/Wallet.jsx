import React, { useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { useQuery } from 'react-query'
import { useAuth } from '../contexts/AuthContext'
import { useWallet } from '../contexts/WalletContext'
import { walletAPI } from '../services/api'
import './Wallet.css'

const Wallet = () => {
  const navigate = useNavigate()
  const { isAuthenticated } = useAuth()
  const { wallet, totalBalance, formatBalance, loadWallet } = useWallet()

  const { data: walletData, isLoading } = useQuery('wallet-details', walletAPI.getWallet, {
    enabled: isAuthenticated,
    retry: 2,
    refetchOnWindowFocus: false,
  })

  useEffect(() => {
    if (!isAuthenticated) {
      navigate('/')
    }
  }, [isAuthenticated, navigate])

  useEffect(() => {
    if (isAuthenticated) {
      loadWallet()
    }
  }, [isAuthenticated, loadWallet])

  const walletInfo = walletData?.data?.wallet || wallet

  if (!isAuthenticated) {
    return null
  }

  const balance = parseFloat(walletInfo?.balance || 0)
  const balanceBonus = parseFloat(walletInfo?.balance_bonus || 0)
  const balanceWithdrawal = parseFloat(walletInfo?.balance_withdrawal || 0)
  const total = balance + balanceBonus + balanceWithdrawal

  return (
    <div className="wallet-page">
      <div className="wallet-container">
        {/* Menu Lateral */}
        <div className="wallet-sidebar">
          <button 
            className="wallet-menu-item active"
            onClick={() => navigate('/wallet')}
          >
            <span className="wallet-menu-icon">💼</span>
            <span>Saldo</span>
          </button>
          <button 
            className="wallet-menu-item"
            onClick={() => navigate('/deposit')}
          >
            <span className="wallet-menu-icon">💰</span>
            <span>Depósito</span>
          </button>
          <button 
            className="wallet-menu-item"
            onClick={() => navigate('/withdraw')}
          >
            <span className="wallet-menu-icon">📷</span>
            <span>Saque</span>
          </button>
          <button 
            className="wallet-menu-item"
            onClick={() => navigate('/history')}
          >
            <span className="wallet-menu-icon">🔄</span>
            <span>Transações</span>
          </button>
        </div>

        {/* Conteúdo Principal */}
        <div className="wallet-content">
          <h2 className="wallet-title">Minha Carteira</h2>

          {/* Cards de Informações */}
          <div className="wallet-cards-grid">
            <div className="wallet-card">
              <div className="wallet-card-icon">💼</div>
              <div className="wallet-card-content">
                <div className="wallet-card-label">Montante Total</div>
                <div className="wallet-card-value">{formatBalance(total)}</div>
              </div>
            </div>

            <div className="wallet-card">
              <div className="wallet-card-icon">🎁</div>
              <div className="wallet-card-content">
                <div className="wallet-card-label">Bônus</div>
                <div className="wallet-card-value">{formatBalance(balanceBonus)}</div>
              </div>
            </div>

            <div className="wallet-card">
              <div className="wallet-card-icon">💵</div>
              <div className="wallet-card-content">
                <div className="wallet-card-label">Sacável</div>
                <div className="wallet-card-value">{formatBalance(balanceWithdrawal)}</div>
              </div>
            </div>

            <div className="wallet-card">
              <div className="wallet-card-icon">🎁</div>
              <div className="wallet-card-content">
                <div className="wallet-card-label">Depósito</div>
                <div className="wallet-card-value">{formatBalance(balance)}</div>
              </div>
            </div>

            <div className="wallet-card">
              <div className="wallet-card-icon">🛡️</div>
              <div className="wallet-card-content">
                <div className="wallet-card-label">Rollover Bônus</div>
                <div className="wallet-card-value">{formatBalance(0)}</div>
              </div>
            </div>

            <div className="wallet-card">
              <div className="wallet-card-icon">💲</div>
              <div className="wallet-card-content">
                <div className="wallet-card-label">Rollover Depósito</div>
                <div className="wallet-card-value">{formatBalance(0)}</div>
              </div>
            </div>
          </div>

          {/* Botões de Ação */}
          <div className="wallet-actions">
            <button 
              className="wallet-action-btn"
              onClick={() => navigate('/deposit')}
            >
              <div className="wallet-action-icon">💰</div>
              <div className="wallet-action-content">
                <div className="wallet-action-title">Depósito</div>
                <div className="wallet-action-subtitle">Clique aqui e faça um depósito</div>
              </div>
            </button>

            <button 
              className="wallet-action-btn"
              onClick={() => navigate('/withdraw')}
            >
              <div className="wallet-action-icon">💵</div>
              <div className="wallet-action-content">
                <div className="wallet-action-title">Saque</div>
                <div className="wallet-action-subtitle">Clique aqui e faça um saque</div>
              </div>
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}

export default Wallet

