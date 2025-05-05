#!/bin/bash

# Apply dynamic PHP limits
echo "upload_max_filesize=${PHP_UPLOAD_MAX}" > /usr/local/etc/php/conf.d/99-custom.ini
echo "post_max_size=${PHP_POST_MAX}" >> /usr/local/etc/php/conf.d/99-custom.ini
echo "memory_limit=${PHP_MEMORY_LIMIT}" >> /usr/local/etc/php/conf.d/99-custom.ini
echo "max_execution_time=${PHP_MAX_EXEC_TIME}" >> /usr/local/etc/php/conf.d/99-custom.ini

# Tune Apache MPM prefork settings
sed -i "s/StartServers .*/StartServers ${PHP_FPM_PM_START_SERVERS}/" /etc/apache2/mods-available/mpm_prefork.conf
sed -i "s/MinSpareServers .*/MinSpareServers ${PHP_FPM_PM_START_SERVERS}/" /etc/apache2/mods-available/mpm_prefork.conf
sed -i "s/MaxSpareServers .*/MaxSpareServers $((${PHP_FPM_PM_START_SERVERS} * 2))/" /etc/apache2/mods-available/mpm_prefork.conf
sed -i "s/MaxRequestWorkers .*/MaxRequestWorkers ${PHP_FPM_PM_MAX_CHILDREN}/" /etc/apache2/mods-available/mpm_prefork.conf
sed -i "s/MaxConnectionsPerChild .*/MaxConnectionsPerChild 3000/" /etc/apache2/mods-available/mpm_prefork.conf

# Start Apache in foreground
exec apache2-foreground
