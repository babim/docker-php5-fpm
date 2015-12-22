FROM babim/debianbase

MAINTAINER "Duc Anh Babim" <ducanh.babim@yahoo.com>

RUN apt-get update && apt-get install -y \
	    php5-fpm php5-cli php5-pgsql php5-mysql php5-gd php5-json php5-sqlite php5-ldap php5-imap php5-tidy php5-xmlrpc php5-mcrypt php5-memcache php5-intl

RUN apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove -y && \
    rm -rf /build && \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /etc/dpkg/dpkg.cfg.d/02apt-speedup

ENV PHP_FPM_USER=www-data
ENV LC_ALL C.UTF-8
ENV TZ Asia/Ho_Chi_Minh

COPY pool.d/ /etc/php5/fpm/pool.d/
CMD ["/usr/sbin/php5-fpm"]

EXPOSE 9000
