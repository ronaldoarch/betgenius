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
    openssl \
    ca-certificates \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && update-ca-certificates

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Instalar Node.js e npm
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

# Configurar PHP SSL
RUN echo "openssl.cafile=/etc/ssl/certs/ca-certificates.crt" >> /usr/local/etc/php/conf.d/ssl.ini

# Copiar configurações do Docker primeiro (antes de mudar WORKDIR)
COPY docker/nginx.conf /tmp/nginx.conf
COPY docker/supervisord.conf /tmp/supervisord.conf

# Configurar diretório de trabalho
WORKDIR /var/www/html

# Copiar arquivos do Laravel usando um padrão que evita problemas com parênteses
# Copiar tudo primeiro para um diretório temporário
COPY . /tmp/source/

# Encontrar e copiar o diretório public_html (4)
RUN for dir in /tmp/source/public_html*; do \
        if [ -d "$$dir" ]; then \
            cp -r "$$dir"/. /var/www/html/; \
            break; \
        fi; \
    done && \
    rm -rf /tmp/source

# Instalar dependências PHP
RUN composer install --no-dev --optimize-autoloader --no-interaction

# Instalar dependências Node e build do React
# Primeiro copiar o frontend React
COPY "frontend-react/" frontend-react/
WORKDIR /var/www/html/frontend-react
RUN npm ci && npm run build

# Voltar para raiz do Laravel
WORKDIR /var/www/html

# Configurar permissões
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html/storage \
    && chmod -R 755 /var/www/html/bootstrap/cache

# Mover configurações do Nginx e Supervisor para os locais corretos
RUN mv /tmp/nginx.conf /etc/nginx/sites-available/default && \
    rm -f /etc/nginx/sites-enabled/default && \
    ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/ && \
    mv /tmp/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expor porta
EXPOSE 80

# Iniciar serviços
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
