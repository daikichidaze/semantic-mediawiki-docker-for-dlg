FROM mediawiki

# install missung stuff and php extensions
RUN apt-get update && apt-get install -y \
      vim \
      unzip \
      libzip-dev \
    && docker-php-ext-install zip

# install composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer
    
# update mediawiki extensions via composer
COPY composer.local.json .
RUN composer update --no-dev

# permissions for the Scribunto Lua binaries
RUN chmod a+x extensions/Scribunto/includes/engines/LuaStandalone/binaries/lua5_1_5_linux_64_generic/lua
