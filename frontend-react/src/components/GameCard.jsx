import React from 'react'
import { useAuth } from '../contexts/AuthContext'
import { getImageUrl } from '../services/api'
import './GameCard.css'

const GameCard = ({ game, onPlay }) => {
  const { isAuthenticated } = useAuth()

  const handleClick = () => {
    if (!isAuthenticated) {
      alert('Faça login para jogar')
      return
    }
    if (onPlay) {
      onPlay(game)
    }
  }

  return (
    <div className="game-card" onClick={handleClick}>
      <img
        src={getImageUrl(game.cover)}
        alt={game.game_name}
        className="game-image"
        onError={(e) => {
          // Usar placeholder base64 ao invés de URL externa
          e.target.src = 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTgwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiBmaWxsPSIjMzMzIi8+PHRleHQgeD0iNTAlIiB5PSI1MCUiIGZvbnQtZmFtaWx5PSJBcmlhbCwgc2Fucy1zZXJpZiIgZm9udC1zaXplPSIxNCIgZmlsbD0iI2ZmZiIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZHk9Ii4zZW0iPkdhbWU8L3RleHQ+PC9zdmc+'
        }}
      />
      <div className="game-info">
        <div className="game-name">{game.game_name}</div>
        <div className="game-provider">{game.provider?.name || 'N/A'}</div>
      </div>
    </div>
  )
}

export default GameCard

