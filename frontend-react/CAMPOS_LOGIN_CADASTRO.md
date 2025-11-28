# Campos de Login e Cadastro - Comparação Backend vs Frontend

## 🔐 LOGIN

### Backend (AuthController::login)
| Campo | Tipo | Obrigatório | Validação |
|-------|------|-------------|-----------|
| `email` | string | ✅ SIM | Email válido |
| `password` | string | ✅ SIM | - |

### Frontend (LoginModal)
| Campo | Tipo | Obrigatório | Status |
|-------|------|-------------|--------|
| `email` | email | ✅ SIM | ✅ OK |
| `password` | password | ✅ SIM | ✅ OK |

**✅ LOGIN ESTÁ CORRETO - Todos os campos obrigatórios estão presentes**

---

## 📝 CADASTRO

### Backend (AuthController::register)
| Campo | Tipo | Obrigatório | Validação |
|-------|------|-------------|-----------|
| `name` | string | ✅ SIM | max:255 |
| `email` | string | ✅ SIM | email, unique, max:255 |
| `phone` | string | ✅ SIM | min:10, max:15 |
| `password` | string | ✅ SIM | min:6 |
| `cupom` | string | ❌ NÃO | nullable (opcional) |
| `reference_code` | string | ❌ NÃO | nullable (opcional) |

### Frontend (RegisterModal)
| Campo | Tipo | Obrigatório | Status |
|-------|------|-------------|--------|
| `name` | text | ✅ SIM | ✅ OK |
| `email` | email | ✅ SIM | ✅ OK |
| `phone` | tel | ✅ SIM | ✅ OK |
| `password` | password | ✅ SIM | ✅ OK |
| `passwordConfirm` | password | ✅ SIM | ✅ OK (validação local) |
| `cupom` | - | ❌ NÃO | ❌ FALTANDO |
| `reference_code` | - | ❌ NÃO | ❌ FALTANDO |

**⚠️ CADASTRO FALTA CAMPOS OPCIONAIS:**
- `cupom` (código de cupom de bônus)
- `reference_code` (código de referência/afiliado)

---

## 📊 RESUMO

### Login
- ✅ **100% Completo** - Todos os campos obrigatórios estão presentes

### Cadastro
- ✅ **Campos Obrigatórios: 100% Completo**
- ❌ **Campos Opcionais: 0% Completo** (faltam 2 campos opcionais)

---

## 🔧 RECOMENDAÇÃO

Adicionar os campos opcionais `cupom` e `reference_code` no formulário de cadastro para permitir que usuários:
1. Resgatem cupons de bônus durante o cadastro
2. Usem códigos de referência de afiliados

