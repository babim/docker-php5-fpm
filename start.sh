#!/bin/bash
export TERM=xterm

sed -ri 's/^display_errors\s*=\s*Off/display_errors = On/g' /etc/php.ini && \
    sed -i 's/\;date\.timezone\ \=/date\.timezone\ \=\ Asia\/Ho_Chi_Minh/g' /etc/php.ini && \
    sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php-fpm.conf && \
    sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php.ini && \
    sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php.ini && \
    sed -i '/^listen = /clisten = 0.0.0.0:9000' /etc/php-fpm.d/www.conf && \
    sed -i '/^listen.allowed_clients/c;listen.allowed_clients =' /etc/php-fpm.d/www.conf && \
    sed -i '/^;catch_workers_output/ccatch_workers_output = yes' /etc/php-fpm.d/www.conf && \
    sed -i "s/php_admin_flag\[log_errors\] = .*/;php_admin_flag[log_errors] =/" /etc/php-fpm.d/www.conf && \
    sed -i "s/php_admin_value\[error_log\] =.*/;php_admin_value[error_log] =/" /etc/php-fpm.d/www.conf && \
    sed -i "s/php_admin_value\[error_log\] =.*/;php_admin_value[error_log] =/" /etc/php-fpm.d/www.conf && \
    echo "php_admin_value[display_errors] = 'stderr'" >> /etc/php-fpm.d/www.conf

fi

# set ID docker run
agid=${agid:-$auid}
auser=${auser:-www-data}

if [[ -z "${auid}" ]]; then
  echo "start"
elif [[ "$auid" = "0" ]] || [[ "$aguid" == "0" ]]; then
	echo "run in user root"
	export auser=root
	export APACHE_RUN_USER=$auser
	export APACHE_RUN_GROUP=$auser
	#sed -i -e "/^user = .*/cuser = $auser" /etc/php/7.0/fpm/php-fpm.conf
	#sed -i -e "/^group = .*/cgroup = $auser" /etc/php/7.0/fpm/php-fpm.conf
	#sed -i -e "/^user .*/cuser  $auser;" /etc/nginx/nginx.conf
	#sed -i -e "/^#user .*/cuser  $auser;" /etc/nginx/nginx.conf
elif id $auid >/dev/null 2>&1; then
        echo "UID exists. Please change UID"
else
if id $auser >/dev/null 2>&1; then
        echo "user exists"
	#sed -i -e "/^user = .*/cuser = $auser" /etc/php/7.0/fpm/php-fpm.conf
	#sed -i -e "/^group = .*/cgroup = $auser" /etc/php/7.0/fpm/php-fpm.conf
	#sed -i -e "/^user .*/cuser  $auser;" /etc/nginx/nginx.conf
	#sed -i -e "/^#user .*/cuser  $auser;" /etc/nginx/nginx.conf
	export APACHE_RUN_USER=$auser
	export APACHE_RUN_GROUP=$auser
	# usermod alpine
		#deluser $auser && delgroup $auser
		#addgroup -g $agid $auser && adduser -D -H -G $auser -s /bin/false -u $auid $auser
	# usermod ubuntu/debian
		usermod -u $auid $auser
		groupmod -g $agid $auser
else
        echo "user does not exist"
	export APACHE_RUN_USER=$auser
	export APACHE_RUN_GROUP=$auser
	# create user alpine
	#addgroup -g $agid $auser && adduser -D -H -G $auser -s /bin/false -u $auid $auser
	# create user ubuntu/debian
	groupadd -g $agid $auser && useradd --system --uid $auid --shell /usr/sbin/nologin -g $auser $auser
	#sed -i -e "/^user = .*/cuser = $auser" /etc/php/7.0/fpm/php-fpm.conf
	#sed -i -e "/^group = .*/cgroup = $auser" /etc/php/7.0/fpm/php-fpm.conf
	#sed -i -e "/^user .*/cuser  $auser;" /etc/nginx/nginx.conf
	#sed -i -e "/^#user .*/cuser  $auser;" /etc/nginx/nginx.conf
fi

fi

# option
if [ -f "/option.sh" ]; then /option.sh; fi

# QUIT
exec "$@"
