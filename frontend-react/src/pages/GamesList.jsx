import React, { useState, useEffect } from 'react'
import { useNavigate, useSearchParams } from 'react-router-dom'
import { useQuery } from 'react-query'
import { useAuth } from '../contexts/AuthContext'
import { gamesAPI, categoriesAPI } from '../services/api'
import GameCard from '../components/GameCard'
import './GamesList.css'

const GamesList = () => {
  const navigate = useNavigate()
  const [searchParams] = useSearchParams()
  const { isAuthenticated } = useAuth()
  const [searchTerm, setSearchTerm] = useState('')
  const [page, setPage] = useState(1)
  const [allGames, setAllGames] = useState([])
  
  // Pegar categoria e busca da URL
  const categorySlug = searchParams.get('category') || 'all'
  const categoryName = searchParams.get('name') || 'Todos os Jogos'
  const urlSearchTerm = searchParams.get('search') || ''
  
  // Usar busca da URL se existir
  useEffect(() => {
    if (urlSearchTerm) {
      setSearchTerm(urlSearchTerm)
    }
  }, [urlSearchTerm])

  // Resetar jogos quando categoria ou busca mudar
  useEffect(() => {
    setAllGames([])
    setPage(1)
  }, [categorySlug, urlSearchTerm])

  const { data: categoriesData } = useQuery('categories', categoriesAPI.getAll, {
    retry: 2,
    refetchOnWindowFocus: false,
    staleTime: 10 * 60 * 1000,
  })

  // Determinar termo de busca (URL ou input)
  const effectiveSearchTerm = urlSearchTerm || searchTerm

  const { data: gamesData, isLoading, isFetching } = useQuery(
    ['games-list', categorySlug, effectiveSearchTerm, page],
    () => gamesAPI.getAllGames({
      category: categorySlug === 'all' ? undefined : categorySlug,
      searchTerm: effectiveSearchTerm.length >= 3 ? effectiveSearchTerm : undefined,
      page: page,
    }),
    {
      retry: 2,
      refetchOnWindowFocus: false,
      staleTime: 2 * 60 * 1000,
    }
  )

  const categories = categoriesData?.data?.categories || []
  const newGames = gamesData?.data?.games?.data || []
  const pagination = gamesData?.data?.games || {}
  const totalGames = pagination.total || 0
  const currentPage = pagination.current_page || 1
  const lastPage = pagination.last_page || 1

  // Acumular jogos quando página mudar
  useEffect(() => {
    if (newGames.length > 0) {
      if (page === 1) {
        setAllGames(newGames)
      } else {
        setAllGames(prev => [...prev, ...newGames])
      }
    }
  }, [newGames, page])

  const games = allGames

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

  const handleSearch = (e) => {
    e.preventDefault()
    setPage(1)
    // Atualizar URL com o termo de busca
    if (searchTerm.length >= 3) {
      navigate(`/games?category=${categorySlug}&search=${encodeURIComponent(searchTerm)}&name=${encodeURIComponent(`Busca: ${searchTerm}`)}`)
    } else {
      navigate(`/games?category=${categorySlug}&name=${encodeURIComponent(categoryName)}`)
    }
  }

  const handleLoadMore = () => {
    if (currentPage < lastPage) {
      setPage(prev => prev + 1)
    }
  }

  return (
    <div className="games-list-page">
      {/* Barra de Pesquisa */}
      <div className="games-list-search">
        <form onSubmit={handleSearch} className="search-form">
          <input
            type="text"
            className="search-input"
            placeholder="Pesquisar jogos..."
            value={effectiveSearchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
          <button type="submit" className="search-button">
            🔍
          </button>
        </form>
      </div>

      {/* Título da Categoria */}
      <div className="games-list-header">
        <h2 className="games-list-title">{categoryName}</h2>
        <p className="games-list-count">
          Mostrando {games.length} de {totalGames} jogos
          {isFetching && games.length > 0 && <span> (carregando mais...)</span>}
        </p>
      </div>

      {/* Loading */}
      {(isLoading || isFetching) && games.length === 0 && (
        <div className="games-list-loading">
          <div className="spinner"></div>
          <p>Carregando jogos...</p>
        </div>
      )}

      {/* Grid de Jogos */}
      {games.length > 0 && (
        <div className="games-list-grid">
          {games.map((game) => (
            <GameCard key={game.id} game={game} onPlay={handlePlayGame} />
          ))}
        </div>
      )}

      {/* Mensagem quando não há jogos */}
      {!isLoading && !isFetching && games.length === 0 && (
        <div className="games-list-empty">
          <p>Nenhum jogo encontrado</p>
          {effectiveSearchTerm && (
            <button 
              className="btn-clear-search"
              onClick={() => {
                setSearchTerm('')
                setPage(1)
                navigate(`/games?category=${categorySlug}&name=${encodeURIComponent(categoryName)}`)
              }}
            >
              Limpar busca
            </button>
          )}
        </div>
      )}

      {/* Botão Ver Mais */}
      {games.length > 0 && currentPage < lastPage && (
        <div className="games-list-load-more">
          <button className="btn-load-more" onClick={handleLoadMore}>
            Ver Mais
            <span className="btn-load-more-icon">▼</span>
          </button>
        </div>
      )}

      {/* Informação de paginação */}
      {games.length > 0 && (
        <div className="games-list-pagination-info">
          Página {currentPage} de {lastPage}
        </div>
      )}
    </div>
  )
}

export default GamesList

