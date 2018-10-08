SET MYSQL_DATABASE=wca
SET MYSQL_USERNAME=root

mysql --verbose --database=%MYSQL_DATABASE% --user=%MYSQL_USERNAME% --password --execute="source build_all.sql"

