import React, { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { useQuery, useMutation, useQueryClient } from 'react-query'
import { useAuth } from '../contexts/AuthContext'
import { useWallet } from '../contexts/WalletContext'
import { missionsAPI } from '../services/api'
import { getImageUrl } from '../services/api'
import './Missions.css'

const Missions = () => {
  const navigate = useNavigate()
  const { isAuthenticated } = useAuth()
  const { loadWallet } = useWallet()
  const queryClient = useQueryClient()
  const [redeeming, setRedeeming] = useState({})

  const { data: missionsData, isLoading, error, refetch } = useQuery(
    'missions',
    missionsAPI.getAll,
    {
      enabled: isAuthenticated,
      retry: 2,
      refetchOnWindowFocus: false,
      staleTime: 30 * 1000, // 30 segundos
    }
  )

  const missions = missionsData?.data || []

  const redeemMutation = useMutation(
    (missionId) => missionsAPI.redeemReward(missionId),
    {
      onSuccess: (response, missionId) => {
        const reward = response.data?.reward || missions.find(m => m.id === missionId)?.reward
        alert(`Bônus de R$${reward.toFixed(2).replace('.', ',')} resgatado com sucesso!`)
        queryClient.invalidateQueries('missions')
        loadWallet()
        setRedeeming(prev => ({ ...prev, [missionId]: false }))
      },
      onError: (error, missionId) => {
        const message = error.response?.data?.message || 'Erro ao resgatar recompensa'
        alert(message)
        setRedeeming(prev => ({ ...prev, [missionId]: false }))
      },
    }
  )

  const handleRedeem = async (mission) => {
    if (!mission.completed) {
      alert('Complete a missão antes de resgatar a recompensa!')
      return
    }

    if (redeeming[mission.id]) return

    setRedeeming(prev => ({ ...prev, [mission.id]: true }))
    redeemMutation.mutate(mission.id)
  }

  const getMissionTypeLabel = (type) => {
    const types = {
      'game_bet': 'Missão de Aposta por Jogo',
      'total_bet': 'Missão de Aposta Total',
      'deposit': 'Missão de Depósito',
      'rounds_played': 'Missão de Rodadas Jogadas',
      'win_amount': 'Missão de Ganho por Jogo',
      'loss_amount': 'Missão de Perda por Jogo',
    }
    return types[type] || type
  }

  const getMissionStatus = (mission) => {
    if (mission.completed) {
      return 'Concluída'
    }
    if (mission.progress > 0) {
      return 'Em Progresso'
    }
    return 'Não Iniciada'
  }

  const getTargetLabel = (mission) => {
    if (mission.type === 'rounds_played') {
      return `${mission.target_amount} Rodadas`
    }
    if (mission.type === 'deposit' || mission.type === 'win_amount' || mission.type === 'loss_amount' || mission.type === 'game_bet' || mission.type === 'total_bet') {
      return `R$ ${mission.target_amount.toFixed(2).replace('.', ',')}`
    }
    return mission.target_amount
  }

  // Auto-refresh a cada 30 segundos
  useEffect(() => {
    if (!isAuthenticated) return

    const interval = setInterval(() => {
      refetch()
    }, 30000) // 30 segundos

    return () => clearInterval(interval)
  }, [isAuthenticated, refetch])

  if (!isAuthenticated) {
    navigate('/')
    return null
  }

  if (isLoading) {
    return (
      <div className="missions-page">
        <div className="missions-loading">
          <div className="spinner"></div>
          <p>Carregando missões...</p>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="missions-page">
        <div className="missions-error">
          <p>Erro ao carregar missões. Tente novamente.</p>
          <button onClick={() => refetch()}>Tentar novamente</button>
        </div>
      </div>
    )
  }

  return (
    <div className="missions-page">
      <div className="missions-container">
        <h1 className="missions-title">
          <span className="missions-icon">🏆</span>
          Missões
        </h1>

        {missions.length === 0 ? (
          <div className="missions-empty">
            <p>Nenhuma missão disponível no momento.</p>
          </div>
        ) : (
          <div className="missions-grid">
            {missions.map((mission) => {
              const status = getMissionStatus(mission)
              const progressPercentage = mission.progress || 0

              return (
                <div key={mission.id} className="mission-card">
                  <div className="mission-image">
                    {mission.image ? (
                      <img 
                        src={getImageUrl(mission.image)} 
                        alt={mission.title}
                        className="mission-image-img"
                      />
                    ) : (
                      <div className="mission-image-icon">🎯</div>
                    )}
                  </div>
                  <div className="mission-content">
                    <h3 className="mission-title">{mission.title}</h3>
                    {mission.description && (
                      <p className="mission-description">{mission.description}</p>
                    )}
                    <div className="mission-type">
                      <span className="mission-type-label">Tipo:</span>
                      <span className="mission-type-value">{getMissionTypeLabel(mission.type)}</span>
                    </div>
                    <div className="mission-target">
                      <span className="mission-target-label">Meta:</span>
                      <span className="mission-target-value">{getTargetLabel(mission)}</span>
                    </div>
                    <div className="mission-reward">
                      <span className="mission-reward-label">Recompensa:</span>
                      <span className="mission-reward-value">
                        R$ {mission.reward.toFixed(2).replace('.', ',')}
                      </span>
                    </div>
                    <div className="mission-status">
                      <button 
                        className={`mission-status-btn ${
                          status === 'Concluída' 
                            ? 'completed' 
                            : status === 'Em Progresso' 
                            ? 'in-progress' 
                            : 'not-started'
                        }`}
                        onClick={() => mission.completed ? handleRedeem(mission) : null}
                        disabled={!mission.completed || redeeming[mission.id]}
                      >
                        {redeeming[mission.id] 
                          ? 'Resgatando...' 
                          : mission.completed 
                          ? 'Resgatar Recompensa' 
                          : status}
                      </button>
                    </div>
                    <div className="mission-progress">
                      <div className="mission-progress-bar-container">
                        <div 
                          className="mission-progress-bar" 
                          style={{ width: `${Math.min(100, progressPercentage)}%` }}
                        ></div>
                      </div>
                      <span className="mission-progress-text">
                        {progressPercentage.toFixed(0)}%
                      </span>
                    </div>
                  </div>
                </div>
              )
            })}
          </div>
        )}
      </div>
    </div>
  )
}

export default Missions

