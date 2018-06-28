FROM babim/alpinebase

RUN apk add --no-cache wget bash && cd / && wget --no-check-certificate https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20SCRIPT%20AUTO/option.sh && \
    chmod 755 /option.sh && pk del wget

RUN apk add --no-cache imagemagick \
	nano php5-fpm php5-json php5-gd php5-sqlite3 curl php5-curl php5-ldap php5-mysql php5-mysqli php5-pgsql php5-imap php5-bcmath \
	php5-xmlrpc php5-mcrypt php5-memcache php5-intl php5-zip php5-opcache php5-mssql php5-bz2 php5-odbc php5-gettext php5-dba php5-soap \
	php5-xml php5-zlib php5-exif php5-pdo php5-pdo_odbc php5-pdo_dblib php5-pdo_sqlite php5-pdo_pgsql php5-pdo_mysql php5-pear

RUN mkdir -p /var/www/
VOLUME ["/var/www", "/etc/php5"]

RUN mkdir -p /etc-start/php5 \
	&& cp -R /etc/php5/* /etc-start/php5

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm", "-F"]

EXPOSE 9000
