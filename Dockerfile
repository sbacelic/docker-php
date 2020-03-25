FROM debian:stretch

# Base packages
# -----------------------------------------------------------------------------
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates wget curl git make libxml2-utils gnupg2

# Adding packages.sury.org repository for PHP 7.4
RUN curl https://packages.sury.org/php/apt.gpg | gpg --dearmor > /usr/share/keyrings/php.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/php.gpg] https://packages.sury.org/php/ stretch main" > /etc/apt/sources.list.d/php.list

# Add node 10.x repo
RUN curl https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor > /usr/share/keyrings/node.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/node.gpg] https://deb.nodesource.com/node_10.x stretch main" > /etc/apt/sources.list.d/nodesource.list

# PHP packages
# -----------------------------------------------------------------------------
RUN apt-get update && \
    apt-get install -y \
    php7.4-cli \
    php7.4-opcache \
    php7.4-bcmath \
    php7.4-zip \
    php7.4-dom \
    php7.4-intl \
    php7.4-mbstring \
    php7.4-xml \
    php7.4-mysql \
    php7.4-sqlite3 \
    php7.4-curl \
    php-apcu \
    php-apcu-bc \ 
    php-redis \
    php-mongodb \
    php-xdebug \
    unzip \
    nodejs \
    build-essential
    
# Clear archives in apt cache folder
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash"]
