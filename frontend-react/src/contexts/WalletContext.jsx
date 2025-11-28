import React, { createContext, useContext, useState, useEffect } from 'react'
import { useAuth } from './AuthContext'
import { walletAPI } from '../services/api'

const WalletContext = createContext()

export const useWallet = () => {
  const context = useContext(WalletContext)
  if (!context) {
    throw new Error('useWallet must be used within WalletProvider')
  }
  return context
}

export const WalletProvider = ({ children }) => {
  const { isAuthenticated } = useAuth()
  const [wallet, setWallet] = useState(null)
  const [loading, setLoading] = useState(false)

  const loadWallet = async () => {
    if (!isAuthenticated) {
      setWallet(null)
      return
    }

    setLoading(true)
    try {
      const response = await walletAPI.getMyWallets()
      const wallets = response.data.wallets || []
      const activeWallet = wallets.find((w) => w.active) || wallets[0]
      if (activeWallet) {
        setWallet(activeWallet)
      }
    } catch (error) {
      console.error('Erro ao carregar carteira:', error)
      // Tenta carregar via endpoint alternativo
      try {
        const altResponse = await walletAPI.getWallet()
        if (altResponse.data.wallet) {
          setWallet(altResponse.data.wallet)
        }
      } catch (altError) {
        console.error('Erro ao carregar carteira alternativa:', altError)
      }
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    if (isAuthenticated) {
      loadWallet()
    } else {
      setWallet(null)
    }
  }, [isAuthenticated])

  const getTotalBalance = () => {
    if (!wallet) return 0
    return (
      parseFloat(wallet.balance || 0) +
      parseFloat(wallet.balance_bonus || 0) +
      parseFloat(wallet.balance_withdrawal || 0)
    )
  }

  const formatBalance = (value) => {
    return new Intl.NumberFormat('pt-BR', {
      style: 'currency',
      currency: 'BRL',
    }).format(value)
  }

  return (
    <WalletContext.Provider
      value={{
        wallet,
        loading,
        loadWallet,
        totalBalance: getTotalBalance(),
        formatBalance,
      }}
    >
      {children}
    </WalletContext.Provider>
  )
}

