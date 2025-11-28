import React, { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { depositAPI, withdrawalAPI } from '../services/api'
import './History.css'

const History = () => {
  const navigate = useNavigate()
  const { isAuthenticated } = useAuth()
  const [activeTab, setActiveTab] = useState('deposits')
  const [deposits, setDeposits] = useState([])
  const [withdrawals, setWithdrawals] = useState([])
  const [loading, setLoading] = useState(false)

  useEffect(() => {
    if (!isAuthenticated) {
      navigate('/')
    }
  }, [isAuthenticated, navigate])

  useEffect(() => {
    if (activeTab === 'deposits') {
      loadDeposits()
    } else {
      loadWithdrawals()
    }
  }, [activeTab])

  const loadDeposits = async () => {
    setLoading(true)
    try {
      const response = await depositAPI.getDeposits()
      setDeposits(response.data.deposits || [])
    } catch (error) {
      console.error('Erro ao carregar depósitos:', error)
    } finally {
      setLoading(false)
    }
  }

  const loadWithdrawals = async () => {
    setLoading(true)
    try {
      const response = await withdrawalAPI.getWithdrawals()
      setWithdrawals(response.data.withdrawals || [])
    } catch (error) {
      console.error('Erro ao carregar saques:', error)
    } finally {
      setLoading(false)
    }
  }

  const getStatusClass = (status) => {
    if (status === 1) return 'approved'
    if (status === 2) return 'rejected'
    return 'pending'
  }

  const getStatusText = (status) => {
    if (status === 1) return 'Aprovado'
    if (status === 2) return 'Rejeitado'
    return 'Pendente'
  }

  const formatDate = (dateString) => {
    if (!dateString) return '-'
    return new Date(dateString).toLocaleString('pt-BR')
  }

  const formatCurrency = (value) => {
    return new Intl.NumberFormat('pt-BR', {
      style: 'currency',
      currency: 'BRL',
    }).format(value)
  }

  return (
    <div className="history-page">
      <div className="content-box">
        <h2>📋 Histórico de Transações</h2>

        <div className="history-tabs">
          <button
            className={`tab-btn ${activeTab === 'deposits' ? 'active' : ''}`}
            onClick={() => setActiveTab('deposits')}
          >
            💰 Depósitos
          </button>
          <button
            className={`tab-btn ${activeTab === 'withdrawals' ? 'active' : ''}`}
            onClick={() => setActiveTab('withdrawals')}
          >
            💸 Saques
          </button>
        </div>

        {loading ? (
          <p style={{ textAlign: 'center', padding: '40px' }}>Carregando...</p>
        ) : (
          <div className="history-content">
            {activeTab === 'deposits' ? (
              deposits.length > 0 ? (
                <table className="history-table">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Valor</th>
                      <th>Status</th>
                      <th>Data</th>
                    </tr>
                  </thead>
                  <tbody>
                    {deposits.map((item) => (
                      <tr key={item.id}>
                        <td>#{item.id}</td>
                        <td>{formatCurrency(item.amount)}</td>
                        <td>
                          <span className={`status-badge status-${getStatusClass(item.status)}`}>
                            {getStatusText(item.status)}
                          </span>
                        </td>
                        <td>{formatDate(item.created_at)}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              ) : (
                <p style={{ textAlign: 'center', color: '#ffffff', opacity: 0.8, padding: '40px' }}>
                  Nenhum depósito encontrado
                </p>
              )
            ) : (
              withdrawals.length > 0 ? (
                <table className="history-table">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Valor</th>
                      <th>Status</th>
                      <th>Data</th>
                    </tr>
                  </thead>
                  <tbody>
                    {withdrawals.map((item) => (
                      <tr key={item.id}>
                        <td>#{item.id}</td>
                        <td>{formatCurrency(item.amount)}</td>
                        <td>
                          <span className={`status-badge status-${getStatusClass(item.status)}`}>
                            {getStatusText(item.status)}
                          </span>
                        </td>
                        <td>{formatDate(item.created_at)}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              ) : (
                <p style={{ textAlign: 'center', color: '#ffffff', opacity: 0.8, padding: '40px' }}>
                  Nenhum saque encontrado
                </p>
              )
            )}
          </div>
        )}
      </div>
    </div>
  )
}

export default History

