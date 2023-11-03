#!/bin/sh
bash /var/www//html/docker/php_dev/one_time_run.sh 
echo "Running supervisor"
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf

echo "Serving php"
cd /var/www/html
php artisan serve --host=0.0.0.0 --port=8000
