FROM babim/ubuntubase

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install software-properties-common -yq && add-apt-repository ppa:ondrej/php -y && \
    apt-get update && \
    apt-get install -y --force-yes php5.6-fpm telnet \
    php5.6-json php5.6-gd php5.6-sqlite curl php5.6-curl php-xml-parser php5.6-ldap \
    php5.6-mysql php5.6-pgsql php5.6-imap php5.6-tidy php5.6-xmlrpc php5.6-zip php5.6-mcrypt php5.6-memcache php5.6-intl \
    php-imagick php5.6-mbstring imagemagick php5.6-sqlite3 php5.6-sybase php5.6-bcmath php5.6-memcached memcached \
    php-mongodb php-redis php-smbclient php-uploadprogress php5.6-phpdbg \
    php5.6-opcache php-xdebug php5.6-bz2 php5.6-odbc php5.6-interbase php5.6-gmp php5.6-xsl \
    php5.6-soap php5.6-xml && \
    apt-get purge -y apache* && apt-get autoremove --purge -y

# Fix run suck
RUN mkdir -p /run/php/

RUN apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove -y && \
    rm -rf /build && \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /etc/dpkg/dpkg.cfg.d/02apt-speedup

RUN mkdir -p /var/www
VOLUME ["/var/www", "/etc/php"]

RUN mkdir -p /etc-start/php \
	&& cp -R /etc/php/* /etc-start/php

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm5.6", "-F"]

# Define working directory.
WORKDIR /etc/php/5.6/fpm

ENV PHP_FPM_USER=www-data

EXPOSE 9000
