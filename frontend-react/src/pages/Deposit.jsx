import React, { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { useWallet } from '../contexts/WalletContext'
import { depositAPI } from '../services/api'
import './Deposit.css'

const Deposit = () => {
  const navigate = useNavigate()
  const { isAuthenticated } = useAuth()
  const { loadWallet } = useWallet()
  const [amount, setAmount] = useState(30)
  const [cpf, setCpf] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [success, setSuccess] = useState('')
  const [depositResult, setDepositResult] = useState(null)
  const [checkingStatus, setCheckingStatus] = useState(false)

  useEffect(() => {
    if (!isAuthenticated) {
      navigate('/')
    }
  }, [isAuthenticated, navigate])

  // Polling para verificar status do depósito
  useEffect(() => {
    if (!depositResult || checkingStatus) return

    const checkDepositStatus = async () => {
      setCheckingStatus(true)
      try {
        const response = await depositAPI.getDeposits()
        const deposits = response.data.deposits || []
        const currentDeposit = deposits.find(d => d.id === depositResult.idTransaction)

        if (currentDeposit && currentDeposit.status === 1) {
          // Depósito aprovado!
          setSuccess('Depósito aprovado! Seu saldo foi creditado.')
          setDepositResult(null)
          await loadWallet() // Atualiza o saldo
          setCheckingStatus(false)
          return
        }

        // Continua verificando a cada 5 segundos
        setTimeout(() => {
          setCheckingStatus(false)
        }, 5000)
      } catch (error) {
        console.error('Erro ao verificar status:', error)
        setCheckingStatus(false)
      }
    }

    const interval = setInterval(checkDepositStatus, 5000)
    return () => clearInterval(interval)
  }, [depositResult, checkingStatus, loadWallet])

  const setQuickAmount = (value) => {
    setAmount(value)
  }

  const formatCPF = (value) => {
    const numbers = value.replace(/\D/g, '')
    if (numbers.length <= 11) {
      return numbers.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/, '$1.$2.$3-$4')
    }
    return value
  }

  const handleCPFChange = (e) => {
    const formatted = formatCPF(e.target.value)
    setCpf(formatted)
  }

  const handleSubmit = async (e) => {
    e.preventDefault()
    setError('')
    setSuccess('')
    setDepositResult(null)

    const cpfNumbers = cpf.replace(/\D/g, '')
    if (cpfNumbers.length !== 11) {
      setError('Informe um CPF válido')
      return
    }

    if (!amount || amount <= 0) {
      setError('Informe um valor válido')
      return
    }

    setLoading(true)
    try {
      const response = await depositAPI.createDeposit({
        amount: parseFloat(amount),
        cpf: cpfNumbers,
      })

      if (response.data.status && response.data.qrcode) {
        setDepositResult({
          idTransaction: response.data.idTransaction,
          qrcode: response.data.qrcode,
        })
        setSuccess('Depósito criado com sucesso!')
        // Inicia verificação de status
      } else {
        setError(response.data.error || 'Erro ao criar depósito')
      }
    } catch (error) {
      setError(error.response?.data?.error || 'Erro ao processar depósito')
    } finally {
      setLoading(false)
    }
  }

  const copyQrcode = () => {
    if (depositResult?.qrcode) {
      navigator.clipboard.writeText(depositResult.qrcode)
      setSuccess('Código PIX copiado!')
    }
  }

  return (
    <div className="deposit-page">
      <div className="content-box">
        <h2>💰 Fazer Depósito</h2>
        {error && <div className="alert alert-error">{error}</div>}
        {success && <div className="alert alert-success">{success}</div>}

        <form onSubmit={handleSubmit}>
          <div className="form-group">
            <label>Valor (R$):</label>
            <input
              type="number"
              value={amount}
              onChange={(e) => setAmount(parseFloat(e.target.value) || 0)}
              step="0.01"
              min="1"
              required
            />
          </div>

          <div className="quick-amounts">
            {[30, 50, 100, 200, 500].map((value) => (
              <button
                key={value}
                type="button"
                className="quick-amount-btn"
                onClick={() => setQuickAmount(value)}
              >
                R$ {value}
              </button>
            ))}
          </div>

          <div className="form-group">
            <label>CPF:</label>
            <input
              type="text"
              value={cpf}
              onChange={handleCPFChange}
              placeholder="000.000.000-00"
              maxLength="14"
              required
            />
          </div>

          <button type="submit" className="btn btn-primary" disabled={loading} style={{ width: '100%', padding: '15px', fontSize: '16px' }}>
            {loading ? 'Gerando QR Code...' : '💳 Gerar QR Code PIX'}
          </button>
        </form>

        {depositResult && (
          <div className="qrcode-container">
            <h3 style={{ color: '#01b7fc', marginBottom: '15px' }}>✅ Depósito Criado!</h3>
            <p style={{ marginBottom: '10px' }}>
              ID da Transação: <strong>{depositResult.idTransaction}</strong>
            </p>
            <p style={{ marginBottom: '15px' }}>Escaneie o QR Code ou copie o código PIX:</p>
            <div className="qrcode-text">{depositResult.qrcode}</div>
            <button className="btn btn-secondary" onClick={copyQrcode} style={{ marginTop: '15px' }}>
              📋 Copiar Código PIX
            </button>
            {checkingStatus && (
              <p style={{ marginTop: '15px', color: '#01b7fc' }}>
                ⏳ Verificando status do pagamento...
              </p>
            )}
          </div>
        )}
      </div>
    </div>
  )
}

export default Deposit

