#!/bin/bash

route=$(find / -type f -iname "db_gestion_proyectos_creates.sql" 2> /dev/null)

read -p "User: " user_name
read -p "Password: " user_password

mysql --user=$user_name \
--password=$user_password \
-e "source "$route";"


for table in $(mysql --user=$user_name --password=$user_password -e "use gestion_proyectos; show tables;" | grep -E "[A-Z][a-z]+$")
do
    mysql --user=$user_name --password=$user_password -e "use gestion_proyectos; describe"" "$table";"
done

# mysqlimport --ignore-lines=1 \
# --fields-terminated-by=, \
# --local -u gorz \
# -p gestion_proyectos \
# $HOME/Documents/Programming/Sql/Gestion-de-Proyectos/csv/Proyectos.csv