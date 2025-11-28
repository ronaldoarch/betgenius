import React, { useState } from 'react'
import { useNavigate, useLocation } from 'react-router-dom'
import { useQuery } from 'react-query'
import { categoriesAPI } from '../services/api'
import './Sidebar.css'

const Sidebar = ({ isOpen, onClose }) => {
  const navigate = useNavigate()
  const location = useLocation()
  const [isCassinoOpen, setIsCassinoOpen] = useState(true)

  const { data: categoriesData } = useQuery('categories', categoriesAPI.getAll, {
    retry: 2,
    refetchOnWindowFocus: false,
    staleTime: 10 * 60 * 1000,
  })

  const categories = categoriesData?.data?.categories || []

  const handleCassinoToggle = () => {
    setIsCassinoOpen(!isCassinoOpen)
  }

  const handleItemClick = (e, action) => {
    e.preventDefault()
    if (action) action()
    if (window.innerWidth <= 768) {
      onClose && onClose()
    }
  }

  // Mapear nomes dos botões para slugs de categorias
  const categoryMap = {
    'favoritos': 'favoritos',
    'slots': 'slots',
    'crash': 'crash',
    'ao vivo': 'ao-vivo',
    'all games': 'all',
    'aviator': 'aviator',
    'mines': 'mines',
    'provedores': 'provedores',
    'roleta ao vivo': 'roleta-ao-vivo',
    'spaceman': 'spaceman',
    'fortune tiger': 'fortune-tiger',
  }

  const navigateToCategory = (categoryKey) => {
    const key = categoryKey.toLowerCase()
    
    // Se for "all games", navegar sem categoria
    if (key === 'all games') {
      navigate(`/games?category=all&name=${encodeURIComponent('Todos os Jogos')}`)
      return
    }

    // Buscar categoria pelo slug ou nome
    const mappedSlug = categoryMap[key] || key
    const category = categories.find(c => 
      c.slug === mappedSlug || 
      c.slug === key ||
      c.name.toLowerCase() === key
    )
    
    const slug = category?.slug || mappedSlug
    const categoryName = category?.name || categoryKey
    
    navigate(`/games?category=${slug}&name=${encodeURIComponent(categoryName)}`)
  }

  return (
    <aside className={`sidebar ${isOpen ? 'mobile-open' : ''}`}>
      {/* Botões Superiores */}
      <div className="sidebar-buttons">
        <button className="sidebar-btn sidebar-btn-missoes">
          <span>Participe das Missões Clube Vip</span>
          <span className="sidebar-btn-icon">🏆</span>
        </button>
        <button className="sidebar-btn sidebar-btn-vip">
          <span>Acompanhe Seu Nível No Clube Vip</span>
          <span className="sidebar-btn-icon">👑</span>
        </button>
        <button className="sidebar-btn sidebar-btn-promocoes">
          <span>Aproveite Nossas Promoções exclusivas</span>
          <span className="sidebar-btn-icon">🎁</span>
        </button>
      </div>

      {/* Seção CASSINO */}
      <div className="sidebar-section">
        <div className="sidebar-title-container" onClick={handleCassinoToggle}>
          <div className="sidebar-title">CASSINO</div>
          <span className={`sidebar-chevron ${isCassinoOpen ? 'open' : ''}`}>▲</span>
        </div>
        {isCassinoOpen && (
          <div className="sidebar-menu-items">
            <a href="#" className="sidebar-menu-item" onClick={(e) => handleItemClick(e, () => navigateToCategory('favoritos'))}>
              <span className="sidebar-menu-icon">⭐</span>
              <span>Favoritos</span>
            </a>
            <a href="#" className="sidebar-menu-item" onClick={(e) => handleItemClick(e, () => navigateToCategory('slots'))}>
              <span className="sidebar-menu-icon">🎰</span>
              <span>Slots</span>
            </a>
            <a href="#" className="sidebar-menu-item" onClick={(e) => handleItemClick(e, () => navigateToCategory('crash'))}>
              <span className="sidebar-menu-icon">💥</span>
              <span>Crash</span>
            </a>
            <a href="#" className="sidebar-menu-item" onClick={(e) => handleItemClick(e, () => navigateToCategory('ao vivo'))}>
              <span className="sidebar-menu-icon">🎲</span>
              <span>Ao vivo</span>
            </a>
            <a href="#" className="sidebar-menu-item" onClick={(e) => handleItemClick(e, () => navigateToCategory('all games'))}>
              <span className="sidebar-menu-icon">👑</span>
              <span>All games</span>
            </a>
            <a href="#" className="sidebar-menu-item" onClick={(e) => handleItemClick(e, () => navigateToCategory('aviator'))}>
              <span className="sidebar-menu-icon">✈️</span>
              <span>Aviator</span>
            </a>
            <a href="#" className="sidebar-menu-item" onClick={(e) => handleItemClick(e, () => navigateToCategory('mines'))}>
              <span className="sidebar-menu-icon">💣</span>
              <span>Mines</span>
            </a>
            <a href="#" className="sidebar-menu-item" onClick={(e) => handleItemClick(e, () => navigateToCategory('provedores'))}>
              <span className="sidebar-menu-icon">🎮</span>
              <span>Provedores</span>
            </a>
            <a href="#" className="sidebar-menu-item" onClick={(e) => handleItemClick(e, () => navigateToCategory('roleta ao vivo'))}>
              <span className="sidebar-menu-icon">🎡</span>
              <span>Roleta Ao vivo</span>
            </a>
            <a href="#" className="sidebar-menu-item" onClick={(e) => handleItemClick(e, () => navigateToCategory('spaceman'))}>
              <span className="sidebar-menu-icon">👨‍🚀</span>
              <span>Spaceman</span>
            </a>
            <a href="#" className="sidebar-menu-item" onClick={(e) => handleItemClick(e, () => navigateToCategory('fortune tiger'))}>
              <span className="sidebar-menu-icon">🐅</span>
              <span>Fortune Tiger</span>
            </a>
          </div>
        )}
      </div>

      {/* Links Inferiores */}
      <div className="sidebar-footer">
        <a href="#" className="sidebar-footer-item" onClick={(e) => handleItemClick(e)}>
          <span className="sidebar-footer-icon">✈️</span>
          <span>Canal do Telegram</span>
        </a>
        <a href="#" className="sidebar-footer-item" onClick={(e) => handleItemClick(e)}>
          <span className="sidebar-footer-icon">👥</span>
          <span>Seja um Afiliado</span>
        </a>
        <a href="#" className="sidebar-footer-item" onClick={(e) => handleItemClick(e)}>
          <span className="sidebar-footer-icon">💬</span>
          <span>Suporte Ao Vivo</span>
        </a>
        <a href="#" className="sidebar-footer-item" onClick={(e) => handleItemClick(e)}>
          <span className="sidebar-footer-icon">⚠️</span>
          <span>Denunciar Cassino</span>
        </a>
      </div>
    </aside>
  )
}

export default Sidebar

