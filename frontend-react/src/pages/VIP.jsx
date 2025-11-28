import React, { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { useQuery, useMutation, useQueryClient } from 'react-query'
import { useAuth } from '../contexts/AuthContext'
import { useWallet } from '../contexts/WalletContext'
import { vipAPI } from '../services/api'
import { getImageUrl } from '../services/api'
import './VIP.css'

const VIP = () => {
  const navigate = useNavigate()
  const { isAuthenticated, user } = useAuth()
  const { loadWallet } = useWallet()
  const queryClient = useQueryClient()
  const [claiming, setClaiming] = useState(false)

  const { data: vipsData, isLoading, error } = useQuery('vips', vipAPI.getVips, {
    enabled: isAuthenticated,
    retry: 2,
    refetchOnWindowFocus: false,
    staleTime: 2 * 60 * 1000,
  })

  const vips = vipsData?.data || []
  const currentVip = vips.find(vip => vip.eligible && !vips.some(v => v.eligible && v.required_missions > vip.required_missions))
  const nextVip = vips.find(vip => !vip.eligible && vip.required_missions > (currentVip?.required_missions || 0))

  const claimMutation = useMutation(
    (vipId) => vipAPI.claimReward(vipId),
    {
      onSuccess: (response) => {
        const reward = response.data.reward || response.data.weekly_reward
        alert(`Bônus de R$${reward.toFixed(2).replace('.', ',')} resgatado com sucesso!`)
        queryClient.invalidateQueries('vips')
        loadWallet()
      },
      onError: (error) => {
        const message = error.response?.data?.message || 'Erro ao resgatar recompensa'
        alert(message)
      },
      onSettled: () => {
        setClaiming(false)
      },
    }
  )

  const handleRedeem = async () => {
    if (!currentVip) {
      alert('Você ainda não alcançou nenhum nível VIP!')
      return
    }

    if (currentVip.claimed) {
      alert('Você já resgatou a recompensa semanal deste nível VIP.')
      return
    }

    if (claiming) return

    setClaiming(true)
    claimMutation.mutate(currentVip.id)
  }

  const getProgressToNext = () => {
    if (!currentVip || !nextVip) return 0
    const currentMissions = currentVip.required_missions
    const nextMissions = nextVip.required_missions
    const completedMissions = Math.floor((currentVip.progress * currentVip.required_missions) / 100)
    
    if (nextMissions === currentMissions) return 100
    return ((completedMissions - currentMissions) / (nextMissions - currentMissions)) * 100
  }

  const progressToNext = getProgressToNext()

  if (!isAuthenticated) {
    navigate('/')
    return null
  }

  if (isLoading) {
    return (
      <div className="vip-page">
        <div className="vip-loading">
          <div className="spinner"></div>
          <p>Carregando níveis VIP...</p>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="vip-page">
        <div className="vip-error">
          <p>Erro ao carregar níveis VIP. Tente novamente.</p>
        </div>
      </div>
    )
  }

  return (
    <div className="vip-page">
      <div className="vip-container">
        <h1 className="vip-title">Bem vindo à área de Níveis VIP!</h1>
        <p className="vip-description">
          Junte-se ao nosso Clube VIP e tenha acesso exclusivo a conquistas e benefícios personalizados! 
          Experimente o privilégio de receber mais bônus de volta e recompensas que certamente farão você 
          alcançar níveis mais altos!
        </p>

        {/* Nível Atual */}
        {currentVip && (
          <div className="vip-current-level">
            <div className="vip-badge-large">
              {currentVip.image ? (
                <img 
                  src={getImageUrl(currentVip.image)} 
                  alt={currentVip.title}
                  className="vip-badge-image"
                />
              ) : (
                <div className="vip-badge-icon">⭐</div>
              )}
              <div className="vip-badge-name">{currentVip.title}</div>
            </div>
            <button 
              className={`btn-redeem ${currentVip.claimed ? 'btn-redeem-disabled' : ''}`}
              onClick={handleRedeem}
              disabled={currentVip.claimed || claiming}
            >
              {claiming ? 'Resgatando...' : currentVip.claimed ? 'Já Resgatado' : `Resgatar ${currentVip.title}`}
            </button>
            {currentVip.weekly_reward && (
              <p className="vip-reward-info">
                Recompensa semanal: R$ {currentVip.weekly_reward.toFixed(2).replace('.', ',')}
              </p>
            )}
          </div>
        )}

        {!currentVip && vips.length > 0 && (
          <div className="vip-no-level">
            <p>Complete missões para alcançar seu primeiro nível VIP!</p>
            <p className="vip-next-level-info">
              Próximo nível: {vips[0]?.title} - {vips[0]?.required_missions} missões necessárias
            </p>
          </div>
        )}

        {/* Progresso */}
        {nextVip && (
          <div className="vip-progress">
            <p className="vip-progress-label">Progresso até o próximo nível:</p>
            <div className="vip-progress-bar-container">
              <div 
                className="vip-progress-bar" 
                style={{ width: `${Math.max(0, Math.min(100, progressToNext))}%` }}
              ></div>
            </div>
            <p className="vip-progress-percentage">
              {Math.max(0, Math.min(100, Math.round(progressToNext)))}%
            </p>
            {nextVip && (
              <p className="vip-progress-info">
                {nextVip.required_missions} missões necessárias para {nextVip.title}
              </p>
            )}
          </div>
        )}

        {/* Benefícios de cada nível */}
        {vips.length > 0 && (
          <div className="vip-levels-section">
            <div className="vip-levels-header">
              <h2 className="vip-levels-title">Benefícios de cada nível</h2>
              <div className="vip-levels-nav">
                <button className="vip-nav-btn" onClick={() => {
                  const carousel = document.querySelector('.vip-levels-carousel')
                  if (carousel) carousel.scrollBy({ left: -300, behavior: 'smooth' })
                }}>‹</button>
                <button className="vip-nav-btn" onClick={() => {
                  const carousel = document.querySelector('.vip-levels-carousel')
                  if (carousel) carousel.scrollBy({ left: 300, behavior: 'smooth' })
                }}>›</button>
              </div>
            </div>
            <div className="vip-levels-carousel">
              {vips.map((vip) => {
                const isCurrent = currentVip?.id === vip.id
                const isNext = nextVip?.id === vip.id
                
                return (
                  <div 
                    key={vip.id} 
                    className={`vip-level-card ${isCurrent ? 'current' : ''} ${isNext ? 'next' : ''}`}
                  >
                    {isCurrent && <div className="vip-level-badge-label">ATUAL</div>}
                    {isNext && <div className="vip-level-badge-label next-label">PRÓXIMO</div>}
                    {vip.image ? (
                      <img 
                        src={getImageUrl(vip.image)} 
                        alt={vip.title}
                        className="vip-level-image"
                      />
                    ) : (
                      <div className="vip-level-icon">⭐</div>
                    )}
                    <div className="vip-level-name">{vip.title}</div>
                    <div className="vip-level-points">{vip.required_missions} missões</div>
                    {vip.weekly_reward && (
                      <div className="vip-level-reward">
                        R$ {vip.weekly_reward.toFixed(2).replace('.', ',')}/semana
                      </div>
                    )}
                    <div className="vip-level-progress">
                      <div className="vip-level-progress-bar">
                        <div 
                          className="vip-level-progress-fill" 
                          style={{ width: `${Math.min(100, vip.progress || 0)}%` }}
                        ></div>
                      </div>
                      <span>{Math.round(vip.progress || 0)}%</span>
                    </div>
                  </div>
                )
              })}
            </div>
          </div>
        )}
      </div>
    </div>
  )
}

export default VIP

