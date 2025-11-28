import React, { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { useQuery } from 'react-query'
import { useAuth } from '../contexts/AuthContext'
import { gamesAPI, categoriesAPI, bannersAPI } from '../services/api'
import GameCard from '../components/GameCard'
import './Home.css'

const Home = () => {
  const navigate = useNavigate()
  const { isAuthenticated } = useAuth()
  const [searchTerm, setSearchTerm] = useState('')
  const [selectedCategory, setSelectedCategory] = useState('featured')
  const [currentBannerIndex, setCurrentBannerIndex] = useState(0)

  // Buscar dados - sempre carregar featured e categories
  const { data: featuredData, isLoading: loadingFeatured, error: errorFeatured } = useQuery(
    'featured-games', 
    gamesAPI.getFeatured,
    {
      retry: 2,
      refetchOnWindowFocus: false,
      staleTime: 5 * 60 * 1000, // 5 minutos
    }
  )
  
  const { data: categoriesData, isLoading: loadingCategories } = useQuery(
    'categories', 
    categoriesAPI.getAll,
    {
      retry: 2,
      refetchOnWindowFocus: false,
      staleTime: 10 * 60 * 1000, // 10 minutos
    }
  )
  
  // Sempre carregar todos os jogos (fallback)
  const { data: allGamesData, isLoading: loadingAllGames } = useQuery(
    'all-games-default',
    () => gamesAPI.getAllGames({}),
    {
      retry: 2,
      refetchOnWindowFocus: false,
      staleTime: 2 * 60 * 1000,
    }
  )

  // Carregar jogos baseado na categoria selecionada
  const { data: categoryGamesData, isLoading: loadingCategoryGames } = useQuery(
    ['all-games', selectedCategory, searchTerm],
    () => gamesAPI.getAllGames({
      category: selectedCategory === 'all' ? undefined : selectedCategory,
      searchTerm: searchTerm.length >= 3 ? searchTerm : undefined,
    }),
    { 
      enabled: (selectedCategory !== 'featured' && selectedCategory !== 'all') || searchTerm.length >= 3,
      retry: 2,
      refetchOnWindowFocus: false,
      staleTime: 2 * 60 * 1000,
    }
  )

  // Banners
  const { data: bannersData, error: errorBanners } = useQuery(
    'banners', 
    bannersAPI.getAll,
    {
      retry: 1,
      refetchOnWindowFocus: false,
      staleTime: 10 * 60 * 1000, // 10 minutos
    }
  )

  const categories = categoriesData?.data?.categories || []
  const featuredGames = featuredData?.data?.featured_games || []
  // Usar jogos da categoria se disponível, senão usar todos os jogos
  const categoryGames = categoryGamesData?.data?.games?.data || []
  const allGames = allGamesData?.data?.games?.data || []
  
  // Determinar quais jogos mostrar
  let gamesToShow = []
  if (selectedCategory === 'featured') {
    gamesToShow = featuredGames.length > 0 ? featuredGames : allGames.slice(0, 12)
  } else if (selectedCategory === 'all') {
    gamesToShow = allGames
  } else if (categoryGames.length > 0) {
    gamesToShow = categoryGames
  } else {
    gamesToShow = allGames
  }
  
  const banners = bannersData?.data?.banners || []
  // Banners para carrossel principal (tipo 'carousel')
  const homeBanners = banners.filter(b => b.type === 'carousel')
  // Banners TOP (tipo 'home' ou 'top', limitado a 3)
  const topBanners = banners
    .filter(b => b.type === 'home' || b.type === 'top')
    .slice(0, 3)

  // Auto-rotacionar banners a cada 5 segundos
  useEffect(() => {
    if (homeBanners.length > 1) {
      const interval = setInterval(() => {
        setCurrentBannerIndex((prev) => (prev + 1) % homeBanners.length)
      }, 5000) // 5 segundos

      return () => clearInterval(interval)
    }
  }, [homeBanners.length])

  // Debug: Log para verificar dados
  useEffect(() => {
    if (featuredData) {
      console.log('Featured games:', featuredData)
    }
    if (categoriesData) {
      console.log('Categories:', categoriesData)
    }
    if (bannersData) {
      console.log('Banners:', bannersData)
    }
    if (errorFeatured) {
      console.error('Erro ao carregar featured:', errorFeatured)
    }
    if (errorBanners) {
      console.error('Erro ao carregar banners:', errorBanners)
    }
  }, [featuredData, categoriesData, bannersData, errorFeatured, errorBanners])

  const handlePlayGame = async (game) => {
    if (!isAuthenticated) {
      alert('Faça login para jogar')
      return
    }

    try {
      const response = await gamesAPI.getSingle(game.id)
      
      // Verificar se a resposta tem erro
      if (response.data.error || response.data.status === false) {
        const errorMsg = response.data.error || 'Erro ao abrir o jogo'
        if (errorMsg.includes('saldo') || errorMsg.includes('precisa ter saldo')) {
          alert('Você precisa ter saldo para jogar. Faça um depósito!')
        } else if (errorMsg.includes('autenticado') || errorMsg.includes('tá autenticado')) {
          alert('Você precisa estar autenticado para jogar')
        } else {
          alert(errorMsg)
        }
        return
      }

      const { gameUrl, token } = response.data

      if (gameUrl) {
        // Abrir jogo em nova aba
        window.open(gameUrl, '_blank')
      } else {
        alert('Erro ao abrir o jogo: URL do jogo não encontrada')
      }
    } catch (error) {
      console.error('Erro ao abrir jogo:', error)
      const errorMsg = error.response?.data?.error || error.message || 'Erro ao abrir o jogo'
      if (errorMsg.includes('saldo') || errorMsg.includes('precisa ter saldo')) {
        alert('Você precisa ter saldo para jogar. Faça um depósito!')
      } else if (errorMsg.includes('autenticado') || errorMsg.includes('tá autenticado')) {
        alert('Você precisa estar autenticado para jogar')
      } else {
        alert(errorMsg)
      }
    }
  }


  const isLoading = loadingFeatured || loadingAllGames || loadingCategories || 
    (selectedCategory !== 'featured' && selectedCategory !== 'all' && loadingCategoryGames)

  const nextBanner = () => {
    setCurrentBannerIndex((prev) => (prev + 1) % homeBanners.length)
  }

  const prevBanner = () => {
    setCurrentBannerIndex((prev) => (prev - 1 + homeBanners.length) % homeBanners.length)
  }

  const goToBanner = (index) => {
    setCurrentBannerIndex(index)
  }

  return (
    <div className="home-page">
      {/* Banner Promocional - Carrossel */}
      {homeBanners.length > 0 ? (
        <div className="banner-carousel">
          <div 
            className="banner-carousel-container"
            style={{
              transform: `translateX(-${currentBannerIndex * 100}%)`
            }}
          >
            {homeBanners.map((banner, index) => (
              <div 
                key={banner.id} 
                className="promo-banner carousel-slide"
                style={{ 
                  backgroundImage: `url(${banner.image?.startsWith('http') ? banner.image : `https://betgeniusbr.com/storage/${banner.image}`})`,
                  backgroundSize: 'cover',
                  backgroundPosition: 'center',
                }}
              >
                <div className="promo-content">
                  {banner.description && (
                    <div className="promo-title">{banner.description}</div>
                  )}
                  {banner.link && (
                    <a href={banner.link} className="promo-link">Ver mais</a>
                  )}
                </div>
              </div>
            ))}
          </div>

          {/* Botões de navegação */}
          {homeBanners.length > 1 && (
            <>
              <button className="carousel-btn carousel-btn-prev" onClick={prevBanner}>
                ‹
              </button>
              <button className="carousel-btn carousel-btn-next" onClick={nextBanner}>
                ›
              </button>

              {/* Indicadores (dots) */}
              <div className="carousel-indicators">
                {homeBanners.map((_, index) => (
                  <button
                    key={index}
                    className={`carousel-indicator ${index === currentBannerIndex ? 'active' : ''}`}
                    onClick={() => goToBanner(index)}
                    aria-label={`Ir para banner ${index + 1}`}
                  />
                ))}
              </div>
            </>
          )}
        </div>
      ) : (
        <div className="promo-banner">
          <div className="promo-content">
            <div className="promo-title">🎁 VOCÊ GANHOU! GIROS GRÁTIS</div>
            <div className="promo-subtitle">CUPOM: BEMVINDO</div>
          </div>
        </div>
      )}

      {/* Search Bar */}
      <div className="search-container">
        <form 
          onSubmit={(e) => {
            e.preventDefault()
            if (searchTerm.length >= 3) {
              navigate(`/games?search=${encodeURIComponent(searchTerm)}&name=${encodeURIComponent(`Busca: ${searchTerm}`)}`)
            }
          }}
        >
          <input
            type="text"
            className="search-bar"
            placeholder="Pesquise por nome de jogo..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </form>
      </div>

      {/* Category Filters */}
      <div className="category-filters">
        <button
          className={`category-filter ${selectedCategory === 'all' ? 'active' : ''}`}
          onClick={() => navigate(`/games?category=all&name=${encodeURIComponent('Todos os Jogos')}`)}
        >
          Todos
        </button>
        <button
          className={`category-filter ${selectedCategory === 'featured' ? 'active' : ''}`}
          onClick={() => setSelectedCategory('featured')}
        >
          Recomendados
        </button>
        {categories.slice(0, 8).map((cat) => (
          <button
            key={cat.id}
            className={`category-filter ${selectedCategory === cat.slug ? 'active' : ''}`}
            onClick={() => navigate(`/games?category=${cat.slug}&name=${encodeURIComponent(cat.name)}`)}
          >
            {cat.name}
          </button>
        ))}
      </div>

      {/* Banners TOP */}
      {topBanners.length > 0 && (
        <div className="top-banners-section">
          <h3 className="section-title">Jogos em Destaque</h3>
          <div className="top-banners-grid">
            {topBanners.map((banner, index) => (
              <div key={banner.id} className="top-banner-card">
                <div className="top-banner-ribbon">TOP {index + 1}</div>
                <div 
                  className="top-banner-image"
                  style={{
                    backgroundImage: `url(${banner.image?.startsWith('http') ? banner.image : `https://betgeniusbr.com/storage/${banner.image}`})`,
                    backgroundSize: 'cover',
                    backgroundPosition: 'center',
                  }}
                >
                  {banner.description && (
                    <div className="top-banner-title">{banner.description}</div>
                  )}
                </div>
                {banner.link ? (
                  <a href={banner.link} className="top-banner-button" target="_blank" rel="noopener noreferrer">
                    <span className="top-banner-button-icon">♠</span>
                    JOGAR AGORA!
                  </a>
                ) : (
                  <button className="top-banner-button">
                    <span className="top-banner-button-icon">♠</span>
                    JOGAR AGORA!
                  </button>
                )}
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Surprise Boxes */}
      <div className="surprise-boxes">
        <div className="surprise-box iphone">
          <div className="surprise-box-title">📱 IPHONE</div>
          <button className="surprise-box-btn">ABRIR CAIXA</button>
        </div>
        <div className="surprise-box xiaomi">
          <div className="surprise-box-title">📱 XIAOMI</div>
          <button className="surprise-box-btn">ABRIR CAIXA</button>
        </div>
        <div className="surprise-box sextou">
          <div className="surprise-box-title">🎉 SEXTOU</div>
          <button className="surprise-box-btn">ABRIR CAIXA</button>
        </div>
      </div>

      {/* Loading */}
      {isLoading && (
        <div style={{ textAlign: 'center', padding: '40px' }}>
          <div className="spinner"></div>
          <p style={{ marginTop: '10px', color: '#ffffff', opacity: 0.8 }}>Carregando jogos...</p>
        </div>
      )}

      {/* Games Sections */}
      {!isLoading && gamesToShow.length > 0 && (
        <div className="game-section">
          <h3 className="section-title">
            {selectedCategory === 'featured' 
              ? (featuredGames.length > 0 ? 'Recomendados' : 'Jogos Populares')
              : selectedCategory === 'all' 
              ? 'Todos os Jogos'
              : categories.find(c => c.slug === selectedCategory)?.name || 'Jogos'}
          </h3>
          <div className="games-grid">
            {gamesToShow.map((game) => (
              <GameCard key={game.id} game={game} onPlay={handlePlayGame} />
            ))}
          </div>
        </div>
      )}

      {!isLoading && gamesToShow.length === 0 && (
        <div className="game-section">
          <h3 className="section-title">
            {selectedCategory === 'featured' ? 'Recomendados' : 'Jogos'}
          </h3>
          <p style={{ textAlign: 'center', color: '#ffffff', opacity: 0.8, padding: '40px' }}>
            {searchTerm.length >= 3 
              ? 'Nenhum jogo encontrado para sua busca'
              : 'Nenhum jogo disponível no momento'}
          </p>
        </div>
      )}
    </div>
  )
}

export default Home

