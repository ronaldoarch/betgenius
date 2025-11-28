import React, { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { useQuery } from 'react-query'
import { useAuth } from '../contexts/AuthContext'
import { profileAPI } from '../services/api'
import { getImageUrl } from '../services/api'
import './Profile.css'

const Profile = () => {
  const navigate = useNavigate()
  const { isAuthenticated, user } = useAuth()
  const [showModal, setShowModal] = useState(true)

  const { data: profileData, isLoading } = useQuery(
    'profile',
    profileAPI.getProfile,
    {
      enabled: isAuthenticated,
      retry: 2,
      refetchOnWindowFocus: false,
      staleTime: 2 * 60 * 1000,
    }
  )

  useEffect(() => {
    if (!isAuthenticated) {
      navigate('/')
    }
  }, [isAuthenticated, navigate])

  if (!user || isLoading) {
    return (
      <div className="profile-page">
        <div className="profile-loading">
          <div className="spinner"></div>
          <p>Carregando perfil...</p>
        </div>
      </div>
    )
  }

  const profileUser = profileData?.data?.user || user
  const totalEarnings = parseFloat(profileData?.data?.totalEarnings || 0)
  const totalBets = profileData?.data?.totalBets || 0
  const sumBets = parseFloat(profileData?.data?.sumBets || 0)
  const losses = sumBets - totalEarnings

  // Calcular meses desde criação da conta
  const accountCreatedDate = profileUser.created_at ? new Date(profileUser.created_at) : new Date()
  const monthsAgo = Math.floor((new Date() - accountCreatedDate) / (1000 * 60 * 60 * 24 * 30))

  const stats = {
    winnings: totalEarnings,
    bets: totalBets,
    losses: Math.max(0, losses),
  }

  return (
    <div className="profile-page">
      {showModal && (
        <div className="profile-modal-overlay" onClick={() => setShowModal(false)}>
          <div className="profile-modal" onClick={(e) => e.stopPropagation()}>
            <div className="profile-modal-header">
              <h2 className="profile-modal-title">Seu Perfil</h2>
              <button 
                className="profile-modal-close"
                onClick={() => setShowModal(false)}
              >
                ✕
              </button>
            </div>

            <div className="profile-modal-content">
            <div className="profile-avatar-container">
              {profileUser.avatar ? (
                <img 
                  src={getImageUrl(profileUser.avatar)} 
                  alt={profileUser.name}
                  className="profile-avatar-large-img"
                />
              ) : (
                <div className="profile-avatar-large">👤</div>
              )}
            </div>

            <div className="profile-user-info">
              <div className="profile-username">{profileUser.name || 'Usuário'}</div>
              <div className="profile-email">{profileUser.email || ''}</div>
            </div>

              <div className="profile-stats-section">
                <div className="profile-stats-title">
                  <span className="profile-stats-icon">📊</span>
                  Estatísticas
                </div>
                <div className="profile-stats-grid">
                  <div className="profile-stat-card">
                    <div className="profile-stat-label">Ganhos</div>
                    <div className="profile-stat-value">
                      R$ {stats.winnings.toFixed(2).replace('.', ',')}
                    </div>
                  </div>
                  <div className="profile-stat-card">
                    <div className="profile-stat-label">Apostas</div>
                    <div className="profile-stat-value">{stats.bets}</div>
                  </div>
                  <div className="profile-stat-card">
                    <div className="profile-stat-label">Percas</div>
                    <div className="profile-stat-value">
                      R$ {stats.losses.toFixed(2).replace('.', ',')}
                    </div>
                  </div>
                </div>
              </div>

              <div className="profile-account-age">
                Conta criada há {monthsAgo} meses
              </div>
            </div>
          </div>
        </div>
      )}

      {/* Versão em página também */}
      <div className="profile-page-content">
        <div className="content-box">
          <h2>👤 Meu Perfil</h2>
          <div className="form-group">
            <label>Nome:</label>
            <input type="text" value={user.name || ''} readOnly />
          </div>
          <div className="form-group">
            <label>Email:</label>
            <input type="email" value={user.email || ''} readOnly />
          </div>
          <div className="form-group">
            <label>ID:</label>
            <input type="text" value={user.id || ''} readOnly />
          </div>
        </div>
      </div>
    </div>
  )
}

export default Profile

