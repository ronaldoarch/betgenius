import React from 'react'
import { useQuery } from 'react-query'
import { settingsAPI } from '../services/api'
import './LoadingScreen.css'

const LoadingScreen = () => {
  const { data: settingsData } = useQuery('settings', settingsAPI.get, {
    retry: 1,
    refetchOnWindowFocus: false,
    staleTime: 10 * 60 * 1000,
  })

  const settings = settingsData?.data?.setting || {}
  const logoUrl = settings?.software_logo_black 
    ? `https://betgeniusbr.com/storage/${settings.software_logo_black}`
    : null

  return (
    <div className="loading-screen">
      <div className="loading-content">
        {logoUrl ? (
          <img src={logoUrl} alt="Loading" className="loading-logo" />
        ) : (
          <div className="loading-logo-text">🎰 BetGenius</div>
        )}
        <div className="loading-spinner">
          <div className="spinner-ring"></div>
          <div className="spinner-ring"></div>
          <div className="spinner-ring"></div>
        </div>
      </div>
    </div>
  )
}

export default LoadingScreen

