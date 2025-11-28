import React, { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { useWallet } from '../contexts/WalletContext'
import { withdrawalAPI } from '../services/api'
import './Withdraw.css'

const Withdraw = () => {
  const navigate = useNavigate()
  const { isAuthenticated } = useAuth()
  const { loadWallet } = useWallet()
  const [amount, setAmount] = useState('')
  const [pixKey, setPixKey] = useState('')
  const [pixType, setPixType] = useState('cpf')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')

  useEffect(() => {
    if (!isAuthenticated) {
      navigate('/')
    }
  }, [isAuthenticated, navigate])

  const handleSubmit = async (e) => {
    e.preventDefault()
    setError('')
    setSuccess('')

    if (!amount || parseFloat(amount) <= 0) {
      setError('Informe um valor válido')
      return
    }

    if (!pixKey) {
      setError('Informe a chave PIX')
      return
    }

    setLoading(true)
    try {
      const response = await withdrawalAPI.requestWithdrawal({
        amount: parseFloat(amount),
        pix_key: pixKey,
        pix_key_type: pixType,
        type: 'pix',
      })

      if (response.data.status) {
        setSuccess('Saque solicitado com sucesso!')
        setAmount('')
        setPixKey('')
        await loadWallet()
      } else {
        setError(response.data.error || 'Erro ao solicitar saque')
      }
    } catch (error) {
      setError(error.response?.data?.error || 'Erro ao processar saque')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="withdraw-page">
      <div className="content-box">
        <h2>💸 Solicitar Saque</h2>
        {error && <div className="alert alert-error">{error}</div>}
        {success && <div className="alert alert-success">{success}</div>}

        <form onSubmit={handleSubmit}>
          <div className="form-group">
            <label>Valor (R$):</label>
            <input
              type="number"
              value={amount}
              onChange={(e) => setAmount(e.target.value)}
              step="0.01"
              min="1"
              required
            />
          </div>

          <div className="form-group">
            <label>Chave PIX:</label>
            <input
              type="text"
              value={pixKey}
              onChange={(e) => setPixKey(e.target.value)}
              placeholder="CPF, Email, Telefone ou Chave Aleatória"
              required
            />
          </div>

          <div className="form-group">
            <label>Tipo de Chave:</label>
            <select value={pixType} onChange={(e) => setPixType(e.target.value)}>
              <option value="cpf">CPF</option>
              <option value="email">Email</option>
              <option value="phoneNumber">Telefone</option>
              <option value="randomKey">Chave Aleatória</option>
            </select>
          </div>

          <button type="submit" className="btn btn-primary" disabled={loading} style={{ width: '100%', padding: '15px', fontSize: '16px' }}>
            {loading ? 'Processando...' : '💸 Solicitar Saque'}
          </button>
        </form>
      </div>
    </div>
  )
}

export default Withdraw

