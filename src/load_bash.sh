#!/bin/bash

route=$(find / -type f -iname "db_gestion_proyectos_creates.sql" 2> /dev/null)

read -p "User: " user_name
read -p "Password: " user_password

mysql --user=$user_name --password=$user_password -e "source "$route";"

mysqlimport --ignore-lines=1 \
--fields-terminated-by=, \
--local --user=$user_name \
--password=$user_password gestion_proyectos \
$HOME/Documents/Programming/Sql/Gestion-de-Proyectos/src/csv/Empleados.csv \
$HOME/Documents/Programming/Sql/Gestion-de-Proyectos/src/csv/Jefes.csv \
$HOME/Documents/Programming/Sql/Gestion-de-Proyectos/src/csv/Informaticos.csv \
$HOME/Documents/Programming/Sql/Gestion-de-Proyectos/src/csv/Analistas.csv \
$HOME/Documents/Programming/Sql/Gestion-de-Proyectos/src/csv/Programadores.csv \
$HOME/Documents/Programming/Sql/Gestion-de-Proyectos/src/csv/Proyectos.csv \
$HOME/Documents/Programming/Sql/Gestion-de-Proyectos/src/csv/Asignados.csv \
$HOME/Documents/Programming/Sql/Gestion-de-Proyectos/src/csv/Gastos.csv

for table in $(mysql --user=$user_name --password=$user_password -e "use gestion_proyectos; show tables;" | grep -E "[A-Z][a-z]+$")
do
    echo ""
    echo "#########################################################################################################################"
    echo "# "$table
    echo "#########################################################################################################################"
    echo ""
    mysql --user=$user_name --password=$user_password -e "use gestion_proyectos; describe"" "$table";"
done

