#!/bin/bash
if [ -z "`/etc/php5`" ] 
then
	cp -R /etc-start/php5 /etc/php5
fi

service ssh start
/usr/sbin/php5-fpm -F
