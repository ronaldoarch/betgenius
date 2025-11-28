import React, { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { useQuery } from 'react-query'
import { useAuth } from '../contexts/AuthContext'
import { useWallet } from '../contexts/WalletContext'
import { settingsAPI } from '../services/api'
import LoginModal from './LoginModal'
import RegisterModal from './RegisterModal'
import './Header.css'

const Header = ({ onMenuToggle }) => {
  const navigate = useNavigate()
  const { isAuthenticated, logout } = useAuth()
  const { totalBalance, formatBalance, loadWallet } = useWallet()
  const [showLogin, setShowLogin] = useState(false)
  const [showRegister, setShowRegister] = useState(false)
  const [showMobileMenu, setShowMobileMenu] = useState(false)
  const [logoError, setLogoError] = useState(false)
  const [showProfileMenu, setShowProfileMenu] = useState(false)

  const { data: settingsData, isLoading: loadingSettings, error: settingsError } = useQuery('settings', settingsAPI.get, {
    retry: 2,
    refetchOnWindowFocus: false,
    staleTime: 10 * 60 * 1000,
  })

  const settings = settingsData?.data?.setting || {}
  const logoPath = settings?.software_logo_white
  const logoUrl = logoPath 
    ? (logoPath.startsWith('http') 
        ? logoPath 
        : `https://betgeniusbr.com/storage/${logoPath}`)
    : null

  // Debug detalhado
  React.useEffect(() => {
    if (settingsData) {
      console.log('=== DEBUG HEADER LOGO ===')
      console.log('1. Settings data completa:', settingsData)
      console.log('2. Settings object:', settings)
      console.log('3. Logo path (raw):', logoPath)
      console.log('4. Logo URL (final):', logoUrl)
      console.log('5. Logo existe?', !!logoPath)
      console.log('6. Logo URL válida?', !!logoUrl)
      console.log('7. Loading:', loadingSettings)
      console.log('8. Error:', settingsError)
      console.log('========================')
    }
  }, [settingsData, settings, logoPath, logoUrl, loadingSettings, settingsError])

  const handleLogout = async () => {
    await logout()
    navigate('/')
  }

  const handleRefreshBalance = () => {
    loadWallet()
  }

  // Fechar menu de perfil ao clicar fora
  useEffect(() => {
    const handleClickOutside = (event) => {
      if (showProfileMenu && !event.target.closest('.profile-menu-container')) {
        setShowProfileMenu(false)
      }
    }

    document.addEventListener('mousedown', handleClickOutside)
    return () => {
      document.removeEventListener('mousedown', handleClickOutside)
    }
  }, [showProfileMenu])

  return (
    <>
      <header className="header">
        {/* Esquerda: Links de navegação */}
        <div className="header-left-nav">
          <a href="#" className="nav-link" onClick={(e) => { e.preventDefault(); navigate('/'); }}>
            <span className="nav-icon">🃏</span>
            <span className="nav-text">CASSINO</span>
          </a>
          <a href="#" className="nav-link" onClick={(e) => { e.preventDefault(); navigate('/'); }}>
            <span className="nav-icon">⚽</span>
            <span className="nav-text">ESPORTES</span>
          </a>
          <button className="mobile-menu-btn" onClick={() => onMenuToggle && onMenuToggle()}>
            ☰
          </button>
        </div>

        {/* Centro: Logo */}
        <div className="header-center">
          {!loadingSettings && logoUrl && !logoError ? (
            <>
              <img 
                src={logoUrl} 
                alt="BetGenius" 
                className="header-logo"
                onClick={() => navigate('/')}
                onError={(e) => {
                  console.error('❌ Erro ao carregar logo')
                  console.error('URL tentada:', logoUrl)
                  console.error('Logo path original:', logoPath)
                  console.error('Elemento:', e.target)
                  setLogoError(true)
                }}
                onLoad={() => {
                  console.log('✅ Logo carregada com sucesso!')
                  console.log('URL:', logoUrl)
                }}
                style={{ display: logoError ? 'none' : 'block' }}
              />
              {logoError && (
                <div className="logo" onClick={() => navigate('/')}>
                  🎰 BetGenius
                </div>
              )}
            </>
          ) : (
            <div className="logo" onClick={() => navigate('/')}>
              🎰 BetGenius
            </div>
          )}
        </div>

        {/* Direita: Ações do usuário */}
        <div className="header-right">
          {isAuthenticated ? (
            <>
              <button className="header-icon-btn" onClick={() => navigate('/promotions')}>
                <span className="header-icon">🎁</span>
              </button>
              <div className="deposit-button-wrapper">
                <div className="pix-badge">PIX</div>
                <button className="btn btn-primary btn-deposit" onClick={() => navigate('/deposit')}>
                  Deposito
                </button>
              </div>
              <div 
                className="balance"
                onClick={() => navigate('/wallet')}
                style={{ cursor: 'pointer' }}
              >
                <button 
                  className="balance-refresh" 
                  onClick={(e) => {
                    e.stopPropagation()
                    handleRefreshBalance()
                  }}
                >
                  🔄
                </button>
                <div className="balance-content">
                  <div className="balance-value">{formatBalance(totalBalance)}</div>
                </div>
              </div>
              <div className="profile-menu-container">
                <button 
                  className="profile-btn" 
                  onClick={() => setShowProfileMenu(!showProfileMenu)}
                >
                  <div className="profile-avatar">👤</div>
                </button>

                {/* Menu Dropdown do Perfil */}
                {showProfileMenu && (
                  <div className="profile-dropdown">
                    <div className="profile-dropdown-item" onClick={() => { navigate('/vip'); setShowProfileMenu(false); }}>
                      <span className="profile-dropdown-icon">⭐</span>
                      <span>Nível VIP</span>
                    </div>
                    <div className="profile-dropdown-item" onClick={() => { navigate('/missions'); setShowProfileMenu(false); }}>
                      <span className="profile-dropdown-icon">📋</span>
                      <span>Missões</span>
                    </div>
                    <div className="profile-dropdown-item" onClick={() => { navigate('/wallet'); setShowProfileMenu(false); }}>
                      <span className="profile-dropdown-icon">👛</span>
                      <span>Carteira</span>
                    </div>
                    <div className="profile-dropdown-item" onClick={() => { navigate('/affiliates'); setShowProfileMenu(false); }}>
                      <span className="profile-dropdown-icon">👥</span>
                      <span>Indicações</span>
                    </div>
                    <div className="profile-dropdown-item" onClick={() => { navigate('/profile'); setShowProfileMenu(false); }}>
                      <span className="profile-dropdown-icon">👤</span>
                      <span>Dados da conta</span>
                    </div>
                    <div className="profile-dropdown-item" onClick={() => { /* App Download */ setShowProfileMenu(false); }}>
                      <span className="profile-dropdown-icon">📥</span>
                      <span>App Download</span>
                    </div>
                    <div className="profile-dropdown-item" onClick={() => { /* Suporte */ setShowProfileMenu(false); }}>
                      <span className="profile-dropdown-icon">🎧</span>
                      <span>Suporte ao Vivo</span>
                    </div>
                    <div className="profile-dropdown-item" onClick={() => { navigate('/promotions'); setShowProfileMenu(false); }}>
                      <span className="profile-dropdown-icon">🎁</span>
                      <span>Promoções</span>
                    </div>
                    <div className="profile-dropdown-divider"></div>
                    <div className="profile-dropdown-item profile-dropdown-item-danger" onClick={() => { handleLogout(); setShowProfileMenu(false); }}>
                      <span className="profile-dropdown-icon">🚪</span>
                      <span>Sair</span>
                    </div>
                  </div>
                )}
              </div>
            </>
          ) : (
            <>
              <button className="btn btn-primary" onClick={() => setShowLogin(true)}>
                <span className="btn-text">Entrar</span>
              </button>
              <button className="btn btn-orange" onClick={() => setShowRegister(true)}>
                <span className="btn-text">Cadastrar</span>
              </button>
            </>
          )}
        </div>
      </header>
      {showLogin && <LoginModal onClose={() => setShowLogin(false)} onSwitch={() => { setShowLogin(false); setShowRegister(true) }} />}
      {showRegister && <RegisterModal onClose={() => setShowRegister(false)} onSwitch={() => { setShowRegister(false); setShowLogin(true) }} />}
    </>
  )
}

export default Header

