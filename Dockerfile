FROM babim/ubuntubase

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install software-properties-common -yq && add-apt-repository ppa:ondrej/php -y && \
    apt-get update && \
    apt-get install php5.6-json php5.6-gd php5.6-sqlite curl php5.6-curl php-xml-parser php5.6-ldap \
    php5.6-mysql php5.6-pgsql php5.6-imap php5.6-tidy php5.6-xmlrpc php5.6-zip php5.6-mcrypt php5.6-memcache php5.6-intl \
    php-apcu php-apcu-bc php-imagick php5.6-mbstring imagemagick php5.6-sqlite3 php5.6-sybase php5.6-bcmath \
    php-geoip php-mongodb php-oauth php-redis php-smbclient php-uploadprogress php5.6-phpdbg php5.6-snmp  \
    php5.6-opcache php-xdebug php-memcached php5.6-bz2 php5.6-odbc php5.6-interbase php5.6-gmp php5.6-xsl php-gmagick \
    php5.6-soap php5.6-xml
    
RUN apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove -y && \
    rm -rf /build && \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /etc/dpkg/dpkg.cfg.d/02apt-speedup

RUN mkdir -p /var/www
VOLUME ["/var/www", "/etc/php/5.6"]

RUN mkdir -p /etc-start/php/5.6 \
	&& cp -R /etc/php/5.6/* /etc-start/php/5.6

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["php5-fpm", "-F"]

# Define working directory.
WORKDIR /etc/php/5.6/fpm

ENV PHP_FPM_USER=www-data

EXPOSE 9000
