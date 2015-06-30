#!/bin/bash

sed -i "s/^\$_DVWA\[ 'db_user' \] = 'root'/\$_DVWA[ 'db_user' ] = 'admin'/g" /app/config/config.inc.php && \
echo "sed -i \"s/p@ssw0rd/\$PASS/g\" /app/config/config.inc.php" >> /create_mysql_admin_user.sh && \
echo 'session.save_path = "/tmp"' >> /etc/php5/apache2/php.ini
