[![](https://images.microbadger.com/badges/image/babim/php5-fpm.svg)](https://microbadger.com/images/babim/php5-fpm "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/babim/php5-fpm.svg)](https://microbadger.com/images/babim/php5-fpm "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/babim/php5-fpm:ssh.svg)](https://microbadger.com/images/babim/php5-fpm:ssh "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/babim/php5-fpm:ssh.svg)](https://microbadger.com/images/babim/php5-fpm:ssh "Get your own version badge on microbadger.com")

[![](https://images.microbadger.com/badges/image/babim/php5-fpm:cron.svg)](https://microbadger.com/images/babim/php5-fpm:cron "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/babim/php5-fpm:cron.svg)](https://microbadger.com/images/babim/php5-fpm:cron "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/babim/php5-fpm:cron.ssh.svg)](https://microbadger.com/images/babim/php5-fpm:cron.ssh "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/babim/php5-fpm:cron.ssh.svg)](https://microbadger.com/images/babim/php5-fpm:cron.ssh "Get your own version badge on microbadger.com")

[![](https://images.microbadger.com/badges/image/babim/php5-fpm:alpine.svg)](https://microbadger.com/images/babim/php5-fpm:alpine "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/babim/php5-fpm:alpine.svg)](https://microbadger.com/images/babim/php5-fpm:alpine "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/babim/php5-fpm:alpine.ssh.svg)](https://microbadger.com/images/babim/php5-fpm:alpine.ssh "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/babim/php5-fpm:alpine.ssh.svg)](https://microbadger.com/images/babim/php5-fpm:alpine.ssh "Get your own version badge on microbadger.com")

[![](https://images.microbadger.com/badges/image/babim/php5-fpm:alpine.cron.svg)](https://microbadger.com/images/babim/php5-fpm:alpine.cron "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/babim/php5-fpm:alpine.cron.svg)](https://microbadger.com/images/babim/php5-fpm:alpine.cron "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/babim/php5-fpm:alpine.cron.ssh.svg)](https://microbadger.com/images/babim/php5-fpm:alpine.cron.ssh "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/babim/php5-fpm:alpine.cron.ssh.svg)](https://microbadger.com/images/babim/php5-fpm:alpine.cron.ssh "Get your own version badge on microbadger.com")

[![](https://images.microbadger.com/badges/image/babim/php5-fpm:centos7.svg)](https://microbadger.com/images/babim/php5-fpm:centos7 "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/version/babim/php5-fpm:centos7.svg)](https://microbadger.com/images/babim/php5-fpm:centos7 "Get your own version badge on microbadger.com")

# Usage
```
docker run --name php-fpm -p 9000:9000 -it -v /data/web:/var/www -v /data/phpconfig:/etc/php5 babim/php5-fpm
```

with environment ID:
```
auid = user id
agid = group id
auser = username
Default: agid = auid
```
