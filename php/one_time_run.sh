# Opening laravel commands
composer install 
php artisan key:gen
php artisan migrate
php artisan optimize:clear


# The next commands will comment line 5 of the entrypoint script 
# because this script will run for one time
LINE_NUMBER=2
SCRIPT_FILE="/var/www/html/docker/php_dev/entrypoint.sh"

# Comment out the specified line using sed
sed -i "${LINE_NUMBER}s/^/#/" "$SCRIPT_FILE"