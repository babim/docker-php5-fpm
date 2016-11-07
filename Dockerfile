FROM babim/alpinebase

RUN apk add --no-cache imagemagick \
	nano php5-fpm php5-json php5-gd php5-sqlite3 curl php5-curl php5-ldap php5-mysql php5-mysqli php5-pgsql php5-imap php5-bcmath \
	php5-xmlrpc php5-mcrypt php5-memcache php5-intl php5-zip php5-opcache php5-mssql php5-bz2 php5-odbc php5-gettext php5-dba php5-soap \
	php5-xml php5-zlib php5-exif php5-pdo php5-pdo_odbc php5-pdo_dblib php5-pdo_sqlite php5-pdo_pgsql php5-pdo_mysql php5-pear

RUN sed -ri 's/^display_errors\s*=\s*Off/display_errors = On/g' /etc/php5/php.ini && \
    sed -i 's/\;date\.timezone\ \=/date\.timezone\ \=\ Asia\/Ho_Chi_Minh/g' /etc/php5/php.ini && \
    sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php5/php.ini && \
    sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 520M/" /etc/php5/php.ini && \
    sed -i "s/post_max_size = 8M/post_max_size = 520M/" /etc/php5/php.ini && \
    sed -i "s/;opcache.enable=0/opcache.enable=0/" /etc/php5/php.ini && \
    sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/php-fpm.conf
    #sed -i '/^listen = /clisten = 9000' /etc/php5/fpm.d/www.conf && \
    #sed -i '/^listen.allowed_clients/c;listen.allowed_clients =' /etc/php5/fpm.d/www.conf && \
    #sed -i '/^;catch_workers_output/ccatch_workers_output = yes' /etc/php5/fpm.d/www.conf && \
#sed -i '/^;env\[TEMP\] = .*/aenv[DB_PORT_3306_TCP_ADDR] = $DB_PORT_3306_TCP_ADDR' /etc/php5/fpm.d/www.conf

RUN mkdir -p /var/www/
VOLUME ["/var/www", "/etc/php5"]

RUN mkdir -p /etc-start/php5 \
	&& cp -R /etc/php5/* /etc-start/php5

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/php-fpm", "-F"]

EXPOSE 9000
