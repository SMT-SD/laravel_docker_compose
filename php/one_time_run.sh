# Opening laravel commands
cd /var/www/html
composer install 
php artisan key:gen
php artisan migrate
php artisan optimize:clear


# The next commands will comment line 5 of the entrypoint script 
# because this script will run ones
LINE_NUMBER=2
SCRIPT_FILE="/php/entrypoint.sh"

# Comment out the specified line using sed
sed -i "${LINE_NUMBER}s/^/#/" "$SCRIPT_FILE"