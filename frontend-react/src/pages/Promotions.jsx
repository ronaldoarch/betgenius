import React from 'react'
import { useQuery } from 'react-query'
import { promotionsAPI } from '../services/api'
import './Promotions.css'

const Promotions = () => {
  const { data, isLoading } = useQuery('promotions', promotionsAPI.getAll)

  if (isLoading) {
    return (
      <div className="promotions-page">
        <div className="content-box">
          <p>Carregando promoções...</p>
        </div>
      </div>
    )
  }

  const promotions = data?.data || []

  return (
    <div className="promotions-page">
      <div className="content-box">
        <h2>🎁 Promoções</h2>
        {promotions.length > 0 ? (
          promotions.map((promo) => (
            <div key={promo.id} className="promotion-card">
              <h3>{promo.titulo}</h3>
              {promo.imagem && (
                <img src={promo.imagem} alt={promo.titulo} className="promotion-image" />
              )}
              {promo.regras_html && (
                <div dangerouslySetInnerHTML={{ __html: promo.regras_html }} />
              )}
            </div>
          ))
        ) : (
          <p style={{ textAlign: 'center', color: '#ffffff', opacity: 0.8, padding: '40px' }}>
            Nenhuma promoção disponível
          </p>
        )}
      </div>
    </div>
  )
}

export default Promotions

