import axios from 'axios'

const API_BASE = 'https://betgeniusbr.com/api'

const api = axios.create({
  baseURL: API_BASE,
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
})

// Interceptor para adicionar token JWT
api.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('token')
    if (token) {
      config.headers.Authorization = `Bearer ${token}`
    }
    return config
  },
  (error) => {
    return Promise.reject(error)
  }
)

// Interceptor para tratar erros 401
api.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response?.status === 401) {
      localStorage.removeItem('token')
      window.location.href = '/'
    }
    return Promise.reject(error)
  }
)

// Placeholder base64 para evitar erros DNS
const PLACEHOLDER_IMAGE = 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTgwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiBmaWxsPSIjMzMzIi8+PHRleHQgeD0iNTAlIiB5PSI1MCUiIGZvbnQtZmFtaWx5PSJBcmlhbCwgc2Fucy1zZXJpZiIgZm9udC1zaXplPSIxNCIgZmlsbD0iI2ZmZiIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZHk9Ii4zZW0iPkdhbWU8L3RleHQ+PC9zdmc+'

// Função para formatar URL de imagem
export const getImageUrl = (cover) => {
  if (!cover) return PLACEHOLDER_IMAGE
  if (cover.startsWith('http')) return cover
  return `https://betgeniusbr.com/storage/${cover}`
}

// Auth
export const authAPI = {
  login: (email, password) => api.post('/auth/login', { email, password }),
  register: (data) => api.post('/auth/register', data),
  logout: () => api.post('/auth/logout'),
  me: () => api.post('/auth/me'),
  verify: () => api.get('/auth/verify'),
}

// Wallet
export const walletAPI = {
  getWallet: () => api.get('/profile/wallet'),
  getMyWallets: () => api.get('/profile/mywallet'),
}

// Games
export const gamesAPI = {
  getAll: () => api.get('/games/all'),
  getFeatured: () => api.get('/featured/games'),
  getAllGames: (params) => api.get('/casinos/games', { params }),
  getSingle: (id) => api.get(`/games/single/${id}`),
  toggleFavorite: (id) => api.post(`/games/favorite/${id}`),
  toggleLike: (id) => api.post(`/games/like/${id}`),
}

// Categories
export const categoriesAPI = {
  getAll: () => api.get('/categories'),
}

// Deposits
export const depositAPI = {
  getDeposits: () => api.get('/carteira_wallet/deposit'),
  createDeposit: (data) => api.post('/carteira_wallet/deposit/payment', data),
}

// Withdrawals
export const withdrawalAPI = {
  getWithdrawals: () => api.get('/carteira_wallet/withdraw'),
  requestWithdrawal: (data) => api.post('/carteira_wallet/withdraw/request', data),
}

// Promotions
export const promotionsAPI = {
  getAll: () => api.get('/promocoes'),
}

// Banners
export const bannersAPI = {
  getAll: () => api.get('/settings/banners'),
}

// Settings
export const settingsAPI = {
  get: () => api.get('/settings/data'),
}

// VIP
export const vipAPI = {
  getVips: () => api.get('/vips'),
  claimReward: (vipId) => api.post(`/vips/${vipId}/claim`),
}

// Missions
export const missionsAPI = {
  getAll: () => api.get('/missions'),
  updateProgress: (missionId) => api.post(`/missions/${missionId}/progress`),
  redeemReward: (missionId) => api.post(`/missions/${missionId}/redeem`),
  checkRedeemed: (missionId) => api.get(`/missions/${missionId}/check`),
}

// Affiliates
export const affiliatesAPI = {
  getData: () => api.get('/profile/affiliates'),
  generateCode: () => api.get('/profile/affiliates/generate'),
  requestWithdraw: (data) => api.post('/profile/affiliates/request', data),
}

// Profile
export const profileAPI = {
  getProfile: () => api.get('/profile'),
  updateName: (name) => api.post('/profile/update-name', { name }),
  uploadAvatar: (formData) => api.post('/profile/upload-avatar', formData, {
    headers: { 'Content-Type': 'multipart/form-data' },
  }),
}

export default api

