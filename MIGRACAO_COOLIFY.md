# Guia de Migração para Coolify

## Pré-requisitos

1. VPS com Coolify instalado e funcionando
2. Acesso SSH à VPS
3. Domínio configurado (betgeniusbr.com)
4. Backup completo do projeto atual

## Passo 1: Preparar o Projeto Local

### 1.1 Verificar arquivos necessários

```bash
# No seu projeto local
cd /Users/ronaldodiasdesousa/Desktop/Projetos/cassino-saulo

# Verificar estrutura
ls -la
```

### 1.2 Criar arquivo .dockerignore (se não existir)

```bash
cat > .dockerignore << 'EOF'
node_modules
.git
.env
.env.backup
storage/logs/*
storage/framework/cache/*
storage/framework/sessions/*
storage/framework/views/*
bootstrap/cache/*
vendor
EOF
```

## Passo 2: Configurar no Coolify

### 2.1 Criar Nova Aplicação

1. Acesse o painel do Coolify
2. Clique em "New Resource" → "Application"
3. Escolha "Docker Compose" ou "Dockerfile"
4. Conecte seu repositório Git (ou faça upload manual)

### 2.2 Configurações da Aplicação

**Nome:** `betgeniusbr` ou `cassino-saulo`

**Porta:** `80` (Coolify gerencia automaticamente)

**Build Pack:** `Dockerfile` ou `Docker Compose`

## Passo 3: Criar Dockerfile

Crie um Dockerfile otimizado para Laravel + React:

```dockerfile
# Dockerfile
FROM php:8.2-fpm

# Instalar dependências do sistema
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    nginx \
    supervisor \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Instalar Node.js e npm
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

# Configurar diretório de trabalho
WORKDIR /var/www/html

# Copiar arquivos do projeto
COPY . .

# Instalar dependências PHP
RUN composer install --no-dev --optimize-autoloader

# Instalar dependências Node e build do React
WORKDIR /var/www/html/frontend-react
RUN npm install && npm run build

# Voltar para raiz
WORKDIR /var/www/html

# Configurar permissões
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html/storage \
    && chmod -R 755 /var/www/html/bootstrap/cache

# Copiar configuração do Nginx
COPY docker/nginx.conf /etc/nginx/sites-available/default

# Copiar configuração do Supervisor
COPY docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expor porta
EXPOSE 80

# Iniciar serviços
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
```

## Passo 4: Criar Docker Compose (Alternativa)

Se preferir Docker Compose:

```yaml
# docker-compose.yml
version: '3.8'

services:
  app:
    build: .
    container_name: betgeniusbr_app
    restart: unless-stopped
    working_dir: /var/www/html
    volumes:
      - ./storage:/var/www/html/storage
      - ./bootstrap/cache:/var/www/html/bootstrap/cache
    environment:
      - APP_ENV=production
      - APP_DEBUG=false
    networks:
      - betgeniusbr

  nginx:
    image: nginx:alpine
    container_name: betgeniusbr_nginx
    restart: unless-stopped
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./public:/var/www/html/public:ro
      - ./docker/nginx.conf:/etc/nginx/conf.d/default.conf:ro
    depends_on:
      - app
    networks:
      - betgeniusbr

networks:
  betgeniusbr:
    driver: bridge
```

## Passo 5: Configurar Nginx

Crie `docker/nginx.conf`:

```nginx
server {
    listen 80;
    server_name betgeniusbr.com www.betgeniusbr.com;
    root /var/www/html/public;
    index index.php index.html;

    # Logs
    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;

    # React Frontend
    location / {
        try_files $uri $uri/ /index.html;
    }

    # Laravel API e Admin
    location ~ ^/(api|zirigui|storage) {
        try_files $uri $uri/ /index.php?$query_string;
    }

    # PHP-FPM
    location ~ \.php$ {
        fastcgi_pass app:9000;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }

    # Storage
    location /storage {
        alias /var/www/html/storage/app/public;
        try_files $uri =404;
    }

    # Deny access to hidden files
    location ~ /\. {
        deny all;
    }
}
```

## Passo 6: Configurar Variáveis de Ambiente no Coolify

No painel do Coolify, adicione todas as variáveis do `.env`:

### Variáveis Essenciais

```env
APP_NAME=BetGenius
APP_ENV=production
APP_KEY=base64:SUA_CHAVE_AQUI
APP_DEBUG=false
APP_URL=https://betgeniusbr.com

DB_CONNECTION=mysql
DB_HOST=seu_host_mysql
DB_PORT=3306
DB_DATABASE=nome_do_banco
DB_USERNAME=usuario
DB_PASSWORD=senha

# JWT
JWT_SECRET=sua_chave_jwt
JWT_TTL=60

# PlayFiver
PLAYFIVER_TOKEN=seu_token
PLAYFIVER_SECRET=seu_secret
PLAYFIVER_CODE=seu_code

# Mail
MAIL_MAILER=smtp
MAIL_HOST=seu_smtp
MAIL_PORT=587
MAIL_USERNAME=seu_email
MAIL_PASSWORD=sua_senha
MAIL_ENCRYPTION=tls
MAIL_FROM_ADDRESS=noreply@betgeniusbr.com
```

## Passo 7: Configurar SSL/TLS no Coolify

1. No painel do Coolify, vá em "SSL/TLS"
2. Configure certificado Let's Encrypt automático
3. Ou adicione certificado customizado

**Importante:** Coolify gerencia SSL automaticamente, o que resolve problemas de certificados.

## Passo 8: Configurações Específicas para Resolver SSL PlayFiver

### 8.1 Atualizar OpenSSL no Container

Adicione ao Dockerfile:

```dockerfile
# Atualizar OpenSSL e cURL
RUN apt-get update && apt-get install -y \
    openssl \
    ca-certificates \
    && update-ca-certificates
```

### 8.2 Configurar PHP para SSL

No `php.ini` ou via Dockerfile:

```dockerfile
# Configurar PHP SSL
RUN echo "openssl.cafile=/etc/ssl/certs/ca-certificates.crt" >> /usr/local/etc/php/conf.d/ssl.ini
```

## Passo 9: Deploy

### 9.1 Via Git (Recomendado)

1. Faça push do código para seu repositório
2. No Coolify, configure webhook do Git
3. Deploy automático a cada push

### 9.2 Via Upload Manual

1. Compacte o projeto (sem node_modules, vendor, .env)
2. Faça upload via interface do Coolify
3. Configure variáveis de ambiente
4. Faça deploy

## Passo 10: Pós-Deploy

### 10.1 Executar Comandos no Container

No Coolify, vá em "Execute Command" e execute:

```bash
# Instalar dependências
composer install --no-dev --optimize-autoloader

# Gerar chave da aplicação
php artisan key:generate

# Limpar e otimizar cache
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear

# Cache de configuração (produção)
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Criar link simbólico do storage
php artisan storage:link

# Rodar migrações (se necessário)
php artisan migrate --force

# Build do React
cd frontend-react
npm install
npm run build
```

### 10.2 Verificar Permissões

```bash
chmod -R 755 storage bootstrap/cache
chown -R www-data:www-data storage bootstrap/cache
```

## Passo 11: Testar Conexão PlayFiver

Após o deploy, teste a conexão:

```bash
# No terminal do Coolify ou SSH
curl -v https://api.playfiver.com/api/v2/game_launch \
  -H "Content-Type: application/json" \
  -d '{"test":"connection"}' \
  --max-time 10
```

## Passo 12: Monitoramento

### 12.1 Logs

No Coolify, monitore:
- Logs da aplicação
- Logs do Nginx
- Logs do PHP-FPM

### 12.2 Verificar Erros

```bash
# Ver logs do Laravel
tail -f storage/logs/laravel.log

# Ver logs do Nginx
tail -f /var/log/nginx/error.log
```

## Vantagens do Coolify

1. ✅ **SSL Automático:** Let's Encrypt configurado automaticamente
2. ✅ **Deploy Fácil:** Interface gráfica simples
3. ✅ **Git Integration:** Deploy automático
4. ✅ **Logs Centralizados:** Fácil monitoramento
5. ✅ **Backup Automático:** Configurável
6. ✅ **Escalabilidade:** Fácil adicionar recursos

## Resolução do Problema SSL

Com Coolify/VPS, você terá:
- ✅ OpenSSL atualizado
- ✅ Certificados CA atualizados
- ✅ Controle total sobre configurações SSL
- ✅ Sem limitações de shared hosting
- ✅ Melhor diagnóstico de problemas

## Checklist Final

- [ ] Dockerfile criado
- [ ] Nginx configurado
- [ ] Variáveis de ambiente configuradas
- [ ] SSL/TLS configurado no Coolify
- [ ] Deploy realizado
- [ ] Comandos pós-deploy executados
- [ ] Teste de conexão PlayFiver realizado
- [ ] Logs verificados
- [ ] Site funcionando

## Suporte

Se encontrar problemas:
1. Verifique logs no Coolify
2. Verifique variáveis de ambiente
3. Teste conexão SSL manualmente
4. Verifique permissões de arquivos

