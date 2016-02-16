#!/bin/bash
if [ -z "`ls /etc/php5`" ] 
then
	cp -R /etc-start/php5 /etc/php5
fi

/usr/sbin/php5-fpm -F
