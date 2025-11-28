import React, { useState } from 'react'
import { useAuth } from '../contexts/AuthContext'
import './Modal.css'

const RegisterModal = ({ onClose, onSwitch }) => {
  const [name, setName] = useState('')
  const [email, setEmail] = useState('')
  const [phone, setPhone] = useState('')
  const [password, setPassword] = useState('')
  const [passwordConfirm, setPasswordConfirm] = useState('')
  const [cupom, setCupom] = useState('')
  const [referenceCode, setReferenceCode] = useState('')
  const [error, setError] = useState('')
  const [loading, setLoading] = useState(false)
  const { register } = useAuth()

  const handleSubmit = async (e) => {
    e.preventDefault()
    setError('')

    if (password !== passwordConfirm) {
      setError('As senhas não coincidem')
      return
    }

    if (password.length < 6) {
      setError('A senha deve ter no mínimo 6 caracteres')
      return
    }

    // Validar telefone (mínimo 10 caracteres, máximo 15)
    const phoneClean = phone.replace(/\D/g, '') // Remove caracteres não numéricos
    if (phoneClean.length < 10 || phoneClean.length > 15) {
      setError('O telefone deve ter entre 10 e 15 dígitos')
      return
    }

    setLoading(true)
    const registerData = { 
      name, 
      email, 
      phone: phoneClean, 
      password 
    }
    
    // Adicionar campos opcionais apenas se preenchidos
    if (cupom.trim()) {
      registerData.cupom = cupom.trim()
    }
    
    if (referenceCode.trim()) {
      registerData.reference_code = referenceCode.trim()
    }
    
    const result = await register(registerData)
    if (result.success) {
      onClose()
    } else {
      setError(result.error)
    }
    setLoading(false)
  }

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className="modal-content" onClick={(e) => e.stopPropagation()}>
        <div className="modal-header">
          <h2 className="modal-title">📝 Cadastro</h2>
          <button className="modal-close" onClick={onClose}>&times;</button>
        </div>
        {error && <div className="alert alert-error">{error}</div>}
        <form onSubmit={handleSubmit}>
          <div className="form-group">
            <label>Nome:</label>
            <input
              type="text"
              value={name}
              onChange={(e) => setName(e.target.value)}
              placeholder="Seu nome"
              required
            />
          </div>
          <div className="form-group">
            <label>Email:</label>
            <input
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              placeholder="seu@email.com"
              required
            />
          </div>
          <div className="form-group">
            <label>Telefone:</label>
            <input
              type="tel"
              value={phone}
              onChange={(e) => setPhone(e.target.value)}
              placeholder="(00) 00000-0000"
              required
            />
          </div>
          <div className="form-group">
            <label>Senha:</label>
            <input
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder="Mínimo 6 caracteres"
              required
            />
          </div>
          <div className="form-group">
            <label>Confirmar Senha:</label>
            <input
              type="password"
              value={passwordConfirm}
              onChange={(e) => setPasswordConfirm(e.target.value)}
              placeholder="Confirme sua senha"
              required
            />
          </div>
          <div className="form-group">
            <label>Cupom de Bônus (Opcional):</label>
            <input
              type="text"
              value={cupom}
              onChange={(e) => setCupom(e.target.value)}
              placeholder="Digite o código do cupom"
            />
          </div>
          <div className="form-group">
            <label>Código de Referência (Opcional):</label>
            <input
              type="text"
              value={referenceCode}
              onChange={(e) => setReferenceCode(e.target.value)}
              placeholder="Digite o código de referência"
            />
          </div>
          <button type="submit" className="btn btn-primary" style={{ width: '100%' }} disabled={loading}>
            {loading ? 'Cadastrando...' : 'Cadastrar'}
          </button>
        </form>
        <p style={{ textAlign: 'center', marginTop: '20px', color: '#ffffff', opacity: 0.8 }}>
          Já tem conta?{' '}
          <a href="#" onClick={(e) => { e.preventDefault(); onSwitch(); }} style={{ color: '#01b7fc' }}>
            Faça login
          </a>
        </p>
      </div>
    </div>
  )
}

export default RegisterModal

