#!/bin/bash
if [ -z "`ls /etc/php5`" ] 
then
	cp -R /etc-start/php5/* /etc/php5
fi

# set password root is root
SSHPASS1=${SSHPASS:-root}
echo "root:$SSHPASS1" | chpasswd
service ssh start
/usr/sbin/php5-fpm -F
