FROM debian:stretch

# Base packages
# -----------------------------------------------------------------------------
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates wget curl git make

# Adding packages.sury.org repository for PHP 7.1
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ stretch main" > /etc/apt/sources.list.d/php.list

# PHP packages
# -----------------------------------------------------------------------------
RUN apt-get update && \
    apt-get install -y \
    php7.1-cli \
    php7.1-opcache \
    php7.1-bcmath \
    php7.1-mcrypt \
    php7.1-zip \
    php7.1-dom \
    php7.1-intl \
    php7.1-mbstring \
    php7.1-xml \
    php7.1-mysql \
    php7.1-sqlite3 \
    php7.1-curl \
    php-apcu \
    php-apcu-bc \ 
    php-redis \
    php-mongodb \
    php-xdebug \
    unzip

# Clear archives in apt cache folder
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash"]
