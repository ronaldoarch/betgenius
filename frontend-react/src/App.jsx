import React, { useState, useEffect } from 'react'
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import { QueryClient, QueryClientProvider } from 'react-query'
import { AuthProvider } from './contexts/AuthContext'
import { WalletProvider } from './contexts/WalletContext'
import Header from './components/Header'
import Sidebar from './components/Sidebar'
import LoadingScreen from './components/LoadingScreen'
import Home from './pages/Home'
import Deposit from './pages/Deposit'
import Withdraw from './pages/Withdraw'
import History from './pages/History'
import Profile from './pages/Profile'
import Promotions from './pages/Promotions'
import Wallet from './pages/Wallet'
import GamesList from './pages/GamesList'
import VIP from './pages/VIP'
import Missions from './pages/Missions'
import Affiliates from './pages/Affiliates'
import './App.css'

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      refetchOnWindowFocus: false,
      retry: 1,
    },
  },
})

function App() {
  const [sidebarOpen, setSidebarOpen] = useState(false)
  const [isLoading, setIsLoading] = useState(true)

  useEffect(() => {
    // Simula carregamento inicial
    const timer = setTimeout(() => {
      setIsLoading(false)
    }, 2000) // 2 segundos

    return () => clearTimeout(timer)
  }, [])

  const handleMenuToggle = () => {
    setSidebarOpen(!sidebarOpen)
  }

  const handleOverlayClick = () => {
    setSidebarOpen(false)
  }

  return (
    <QueryClientProvider client={queryClient}>
      <AuthProvider>
        <WalletProvider>
          <Router>
            {isLoading && <LoadingScreen />}
            <div className="app">
              <Header onMenuToggle={handleMenuToggle} />
              <div className={`sidebar-overlay ${sidebarOpen ? 'active' : ''}`} onClick={handleOverlayClick}></div>
              <div className="app-container">
                <Sidebar isOpen={sidebarOpen} onClose={() => setSidebarOpen(false)} />
                <main className="main-content">
                  <Routes>
                    <Route path="/" element={<Home />} />
                    <Route path="/deposit" element={<Deposit />} />
                    <Route path="/withdraw" element={<Withdraw />} />
                    <Route path="/history" element={<History />} />
                    <Route path="/profile" element={<Profile />} />
                    <Route path="/promotions" element={<Promotions />} />
                    <Route path="/wallet" element={<Wallet />} />
                    <Route path="/games" element={<GamesList />} />
                    <Route path="/vip" element={<VIP />} />
                    <Route path="/missions" element={<Missions />} />
                    <Route path="/affiliates" element={<Affiliates />} />
                  </Routes>
                </main>
              </div>
            </div>
          </Router>
        </WalletProvider>
      </AuthProvider>
    </QueryClientProvider>
  )
}

export default App

