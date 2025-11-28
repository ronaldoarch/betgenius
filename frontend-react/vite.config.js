import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  // Base path para funcionar na raiz do site
  // Se quiser usar em subpasta, mude para base: '/app/'
  base: '/',
  server: {
    port: 3000,
    proxy: {
      '/api': {
        target: 'https://betgeniusbr.com',
        changeOrigin: true,
        secure: false
      }
    }
  }
})

