import React, { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { useQuery, useMutation, useQueryClient } from 'react-query'
import { useAuth } from '../contexts/AuthContext'
import { useWallet } from '../contexts/WalletContext'
import { affiliatesAPI } from '../services/api'
import './Affiliates.css'

const Affiliates = () => {
  const navigate = useNavigate()
  const { isAuthenticated } = useAuth()
  const { loadWallet } = useWallet()
  const queryClient = useQueryClient()
  const [withdrawAmount, setWithdrawAmount] = useState('')
  const [pixKey, setPixKey] = useState('')
  const [pixType, setPixType] = useState('document')

  const { data: affiliatesData, isLoading, error, refetch } = useQuery(
    'affiliates',
    affiliatesAPI.getData,
    {
      enabled: isAuthenticated,
      retry: 2,
      refetchOnWindowFocus: false,
      staleTime: 2 * 60 * 1000,
    }
  )

  const generateCodeMutation = useMutation(
    () => affiliatesAPI.generateCode(),
    {
      onSuccess: () => {
        alert('Código gerado com sucesso!')
        queryClient.invalidateQueries('affiliates')
      },
      onError: (error) => {
        alert(error.response?.data?.message || 'Erro ao gerar código')
      },
    }
  )

  const withdrawMutation = useMutation(
    (data) => affiliatesAPI.requestWithdraw(data),
    {
      onSuccess: () => {
        alert('Solicitação de saque realizada com sucesso!')
        setWithdrawAmount('')
        setPixKey('')
        queryClient.invalidateQueries('affiliates')
        loadWallet()
      },
      onError: (error) => {
        const message = error.response?.data?.error || error.response?.data?.message || 'Erro ao solicitar saque'
        alert(message)
      },
    }
  )

  const referralCode = affiliatesData?.data?.code || ''
  const referralLink = affiliatesData?.data?.url || ''
  const availableBalance = affiliatesData?.data?.wallet?.refer_rewards || 0
  const referrals = affiliatesData?.data?.indications || 0

  const handleCopyCode = () => {
    if (!referralCode) {
      alert('Gere um código primeiro!')
      return
    }
    navigator.clipboard.writeText(referralCode)
    alert('Código copiado!')
  }

  const handleCopyLink = () => {
    if (!referralLink) {
      alert('Gere um código primeiro!')
      return
    }
    navigator.clipboard.writeText(referralLink)
    alert('Link copiado!')
  }

  const handleGenerateCode = () => {
    if (referralCode) {
      if (!confirm('Você já possui um código. Deseja gerar um novo?')) {
        return
      }
    }
    generateCodeMutation.mutate()
  }

  const handleWithdraw = (e) => {
    e.preventDefault()
    
    if (availableBalance < 5) {
      alert('Saldo mínimo para saque: R$ 5,00')
      return
    }

    const amount = parseFloat(withdrawAmount)
    if (!amount || amount < 5) {
      alert('Valor mínimo para saque: R$ 5,00')
      return
    }

    if (amount > availableBalance) {
      alert('Saldo insuficiente')
      return
    }

    if (!pixKey) {
      alert('Informe a chave PIX')
      return
    }

    withdrawMutation.mutate({
      amount: amount,
      pix_key: pixKey,
      pix_type: pixType,
    })
  }

  if (!isAuthenticated) {
    navigate('/')
    return null
  }

  if (isLoading) {
    return (
      <div className="affiliates-page">
        <div className="affiliates-loading">
          <div className="spinner"></div>
          <p>Carregando dados de afiliados...</p>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="affiliates-page">
        <div className="affiliates-error">
          <p>Erro ao carregar dados. Tente novamente.</p>
          <button onClick={() => refetch()}>Tentar novamente</button>
        </div>
      </div>
    )
  }

  return (
    <div className="affiliates-page">
      <div className="affiliates-container">
        <div className="affiliates-card">
          <div className="affiliates-grid">
            {/* Código de Referência */}
            <div className="affiliates-section">
              <label className="affiliates-label">Código de Referência</label>
              <div className="affiliates-input-group">
                <input 
                  type="text" 
                  className="affiliates-input" 
                  value={referralCode || 'Não gerado'}
                  readOnly
                  placeholder="Clique em 'Gerar Código'"
                />
                <button 
                  className="affiliates-copy-btn" 
                  onClick={handleCopyCode}
                  disabled={!referralCode}
                  title="Copiar código"
                >
                  📋
                </button>
                {!referralCode && (
                  <button 
                    className="affiliates-generate-btn" 
                    onClick={handleGenerateCode}
                    disabled={generateCodeMutation.isLoading}
                  >
                    {generateCodeMutation.isLoading ? 'Gerando...' : 'Gerar Código'}
                  </button>
                )}
              </div>
            </div>

            {/* Link de Referência */}
            <div className="affiliates-section">
              <label className="affiliates-label">Link de Referência</label>
              <div className="affiliates-input-group">
                <input 
                  type="text" 
                  className="affiliates-input" 
                  value={referralLink || 'Gere um código primeiro'}
                  readOnly
                />
                <button 
                  className="affiliates-copy-btn" 
                  onClick={handleCopyLink}
                  disabled={!referralLink}
                  title="Copiar link"
                >
                  📋
                </button>
              </div>
            </div>

            {/* Saldo disponível */}
            <div className="affiliates-section">
              <div className="affiliates-info-card">
                <div className="affiliates-info-header">
                  <span className="affiliates-info-icon">💰</span>
                  <span className="affiliates-info-label">Saldo disponível:</span>
                </div>
                <div className="affiliates-info-value">
                  R$ {availableBalance.toFixed(2).replace('.', ',')}
                </div>
                <form onSubmit={handleWithdraw} className="affiliates-withdraw-form">
                  <input
                    type="number"
                    step="0.01"
                    min="5"
                    max={availableBalance}
                    className="affiliates-withdraw-input"
                    placeholder="Valor mínimo: R$ 5,00"
                    value={withdrawAmount}
                    onChange={(e) => setWithdrawAmount(e.target.value)}
                    required
                  />
                  <select
                    className="affiliates-pix-type"
                    value={pixType}
                    onChange={(e) => setPixType(e.target.value)}
                    required
                  >
                    <option value="document">CPF/CNPJ</option>
                    <option value="email">E-mail</option>
                    <option value="phoneNumber">Telefone</option>
                    <option value="randomKey">Chave Aleatória</option>
                  </select>
                  <input
                    type="text"
                    className="affiliates-pix-key"
                    placeholder="Chave PIX"
                    value={pixKey}
                    onChange={(e) => setPixKey(e.target.value)}
                    required
                  />
                  <button 
                    type="submit"
                    className="affiliates-withdraw-btn"
                    disabled={withdrawMutation.isLoading || availableBalance < 5}
                  >
                    {withdrawMutation.isLoading ? 'Processando...' : 'Solicitar Saque'}
                  </button>
                </form>
              </div>
            </div>

            {/* Seus indicados */}
            <div className="affiliates-section">
              <div className="affiliates-info-card">
                <div className="affiliates-info-header">
                  <span className="affiliates-info-icon">👥</span>
                  <span className="affiliates-info-label">Seus indicados:</span>
                </div>
                <div className="affiliates-info-value">{referrals}</div>
              </div>
            </div>

            {/* Depósito mínimo */}
            <div className="affiliates-section">
              <div className="affiliates-info-card">
                <div className="affiliates-info-header">
                  <span className="affiliates-info-icon">📦</span>
                  <span className="affiliates-info-label">Depósito mínimo</span>
                </div>
                <div className="affiliates-info-value">R$ 5,00</div>
              </div>
            </div>

            {/* Valor por indicação */}
            <div className="affiliates-section">
              <div className="affiliates-info-card">
                <div className="affiliates-info-header">
                  <span className="affiliates-info-icon">💵</span>
                  <span className="affiliates-info-label">Valor por indicação</span>
                </div>
                <div className="affiliates-info-value">R$ 15,00</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default Affiliates

