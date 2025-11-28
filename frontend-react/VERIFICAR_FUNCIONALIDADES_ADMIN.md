# ✅ FUNCIONALIDADES DO ADMIN NO SITE

## 📋 STATUS ATUAL

O React **JÁ ESTÁ CONFIGURADO** para buscar e exibir todas as funcionalidades do admin:

### ✅ 1. Logo no Header
- **Campo usado**: `software_logo_white`
- **Arquivo**: `src/components/Header.jsx`
- **API**: `/api/settings/data`
- **Status**: ✅ Configurado

### ✅ 2. Logo no Loading Screen
- **Campo usado**: `software_logo_black`
- **Arquivo**: `src/components/LoadingScreen.jsx`
- **API**: `/api/settings/data`
- **Status**: ✅ Configurado

### ✅ 3. Banners no Carrossel
- **Tipo**: `carousel`
- **Arquivo**: `src/pages/Home.jsx`
- **API**: `/api/settings/banners`
- **Status**: ✅ Configurado

### ✅ 4. Banners TOP
- **Tipo**: `home` ou `top`
- **Arquivo**: `src/pages/Home.jsx`
- **API**: `/api/settings/banners`
- **Status**: ✅ Configurado

---

## 🔍 VERIFICAÇÃO

Para verificar se está funcionando, execute no SSH:

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

# 1. Verificar se a API retorna settings
echo "Testando /api/settings/data:"
curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/data | jq '.data.setting | {software_logo_white, software_logo_black}' 2>/dev/null || curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/data | grep -o '"software_logo_[^"]*":"[^"]*"' | head -2

# 2. Verificar se a API retorna banners
echo ""
echo "Testando /api/settings/banners:"
curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/banners | jq '.data.banners | length' 2>/dev/null || curl -s -H "Accept: application/json" https://betgeniusbr.com/api/settings/banners | grep -o '"id"' | wc -l
```

---

## 📝 COMO FUNCIONA

### Logo no Header
```javascript
// src/components/Header.jsx
const settings = settingsData?.data?.setting || {}
const logoPath = settings?.software_logo_white
const logoUrl = logoPath 
  ? `https://betgeniusbr.com/storage/${logoPath}`
  : null
```

### Logo no Loading
```javascript
// src/components/LoadingScreen.jsx
const settings = settingsData?.data?.setting || {}
const logoUrl = settings?.software_logo_black 
  ? `https://betgeniusbr.com/storage/${settings.software_logo_black}`
  : null
```

### Banners
```javascript
// src/pages/Home.jsx
const banners = bannersData?.data?.banners || []
const homeBanners = banners.filter(b => b.type === 'carousel')
const topBanners = banners
  .filter(b => b.type === 'home' || b.type === 'top')
  .slice(0, 3)
```

---

## 🎯 PRÓXIMOS PASSOS

1. **Fazer upload dos logos via admin**:
   - Acesse: `https://betgeniusbr.com/zirigui`
   - Vá em: Settings
   - Faça upload de:
     - LOGOTIPO 1 (software_logo_white) - para o header
     - LOGOTIPO 2 (software_logo_black) - para o loading

2. **Criar banners via admin**:
   - Acesse: `https://betgeniusbr.com/zirigui`
   - Vá em: Banners
   - Crie banners com tipo:
     - `carousel` - para o carrossel principal
     - `home` - para os banners TOP

3. **Verificar no site**:
   - Acesse: `https://betgeniusbr.com/`
   - Verifique se:
     - Logo aparece no header
     - Logo aparece no loading
     - Banners aparecem no carrossel
     - Banners TOP aparecem

---

## ✅ CONCLUSÃO

**Tudo já está configurado!** O React já busca e exibe:
- ✅ Logo do header
- ✅ Logo do loading
- ✅ Banners do carrossel
- ✅ Banners TOP

Apenas certifique-se de que:
1. Os logos foram enviados via admin
2. Os banners foram criados via admin
3. As imagens estão sendo servidas corretamente pelo storage

