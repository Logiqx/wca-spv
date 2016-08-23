MYSQL_DATABASE=DATABASE
MYSQL_USERNAME=USERNAME

mysql --verbose --database=$MYSQL_DATABASE --user=$MYSQL_USERNAME --password --execute="source build_all.sql"

