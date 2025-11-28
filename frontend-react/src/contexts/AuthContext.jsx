import React, { createContext, useContext, useState, useEffect } from 'react'
import { authAPI } from '../services/api'

const AuthContext = createContext()

export const useAuth = () => {
  const context = useContext(AuthContext)
  if (!context) {
    throw new Error('useAuth must be used within AuthProvider')
  }
  return context
}

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null)
  const [token, setToken] = useState(localStorage.getItem('token'))
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    if (token) {
      verifyToken()
    } else {
      setLoading(false)
    }
  }, [])

  const verifyToken = async () => {
    try {
      const response = await authAPI.verify()
      setUser(response.data)
      setLoading(false)
    } catch (error) {
      localStorage.removeItem('token')
      setToken(null)
      setUser(null)
      setLoading(false)
    }
  }

  const login = async (email, password) => {
    try {
      const response = await authAPI.login(email, password)
      const { access_token } = response.data
      if (!access_token) {
        return {
          success: false,
          error: 'Token não recebido',
        }
      }
      localStorage.setItem('token', access_token)
      setToken(access_token)
      await verifyToken()
      return { success: true }
    } catch (error) {
      return {
        success: false,
        error: error.response?.data?.error || 'Erro ao fazer login',
      }
    }
  }

  const register = async (data) => {
    try {
      const response = await authAPI.register(data)
      const { access_token } = response.data
      if (!access_token) {
        return {
          success: false,
          error: 'Token não recebido',
        }
      }
      localStorage.setItem('token', access_token)
      setToken(access_token)
      await verifyToken()
      return { success: true }
    } catch (error) {
      // Tratar erros de validação
      if (error.response?.data) {
        const errorData = error.response.data
        
        // Se for um objeto com erros de validação
        if (typeof errorData === 'object' && !errorData.error) {
          const validationErrors = Object.values(errorData).flat()
          return {
            success: false,
            error: validationErrors.join(', ') || 'Erro ao cadastrar',
          }
        }
        
        // Se for uma mensagem de erro simples
        return {
          success: false,
          error: errorData.error || errorData.message || 'Erro ao cadastrar',
        }
      }
      
      return {
        success: false,
        error: error.message || 'Erro ao cadastrar',
      }
    }
  }

  const logout = async () => {
    try {
      await authAPI.logout()
    } catch (error) {
      console.error('Erro ao fazer logout:', error)
    } finally {
      localStorage.removeItem('token')
      setToken(null)
      setUser(null)
    }
  }

  return (
    <AuthContext.Provider
      value={{
        user,
        token,
        loading,
        login,
        register,
        logout,
        isAuthenticated: !!token && !!user,
      }}
    >
      {children}
    </AuthContext.Provider>
  )
}

