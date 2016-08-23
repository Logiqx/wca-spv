SET MYSQL_DATABASE=DATABASE
SET MYSQL_USERNAME=USERNAME

mysql --quick --verbose --database=%MYSQL_DATABASE% --user=%MYSQL_USERNAME% --password --execute="source build_all.sql"

