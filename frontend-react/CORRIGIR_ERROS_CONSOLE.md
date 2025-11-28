# 🔧 CORRIGIR ERROS DO CONSOLE

## 📋 PROBLEMAS IDENTIFICADOS

### 1. ❌ Logo não carrega
- **URL**: `https://betgeniusbr.com/storage/uploads/Nx72GR0pqlAV417TGLzp7ltgEP55R8raNB0pBI1q.png`
- **Problema**: Arquivo não encontrado ou não sendo servido corretamente
- **Solução**: Verificar se o arquivo existe e se o symlink do storage está correto

### 2. ❌ Banners com erro DNS (`ERR_NAME_NOT_RESOLVED`)
- **URL**: `https://via.placeholder.com/180x200?text=Game`
- **Problema**: Domínio externo não resolve (DNS)
- **Solução**: ✅ **CORRIGIDO** - Substituído por placeholder base64 inline

### 3. ❌ API retorna 500 (`/api/games/single/1422`)
- **Problema**: Erro interno no servidor ao buscar jogo
- **Solução**: Verificar logs do Laravel e se o jogo existe no banco

---

## ✅ CORREÇÕES APLICADAS

### 1. Placeholders corrigidos
- ✅ Substituído `https://via.placeholder.com/180x200?text=Game` por imagem SVG base64 inline
- ✅ Arquivos corrigidos:
  - `frontend-react/src/services/api.js`
  - `frontend-react/src/components/GameCard.jsx`

---

## 🔧 PRÓXIMOS PASSOS

### 1. Rebuild do React
```bash
cd frontend-react
npm run build
```

Depois, faça upload dos arquivos em `dist/` para o servidor.

### 2. Verificar logo no servidor
Execute no SSH:
```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html
bash DIAGNOSTICAR_ERROS_CONSOLE.sh
```

Ou execute manualmente:
```bash
# Verificar se o logo existe
ls -la public/storage/uploads/Nx72GR0pqlAV417TGLzp7ltgEP55R8raNB0pBI1q.png

# Se não existir, verificar em storage/app/public/uploads/
find storage/app/public/uploads -name "*Nx72GR0pqlAV*"

# Criar symlink se necessário
php artisan storage:link
```

### 3. Verificar erro 500 da API
```bash
# Ver logs do Laravel
tail -50 storage/logs/laravel.log | grep -i "games/single\|error\|exception"

# Verificar se o jogo existe
php artisan tinker
>>> \App\Models\Game::find(1422)
```

### 4. Testar logo
```bash
# Testar URL do logo
curl -I https://betgeniusbr.com/storage/uploads/Nx72GR0pqlAV417TGLzp7ltgEP55R8raNB0pBI1q.png

# Deve retornar:
# HTTP/2 200
# content-type: image/png
```

---

## 📝 COMANDO COMPLETO PARA EXECUTAR

```bash
cd /home/u127271520/domains/betgeniusbr.com/public_html

# 1. Diagnosticar problemas
bash DIAGNOSTICAR_ERROS_CONSOLE.sh

# 2. Verificar/criar symlink
php artisan storage:link

# 3. Verificar permissões
chmod -R 755 storage/app/public
chmod -R 755 public/storage

# 4. Limpar cache
php artisan config:clear
php artisan cache:clear
php artisan route:clear
```

---

## 🎯 RESUMO

✅ **Corrigido**: Placeholders dos banners (erro DNS)
⏳ **Pendente**: 
- Verificar logo no servidor
- Investigar erro 500 da API
- Rebuild do React com as correções

