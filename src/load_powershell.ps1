# Type Get-ExecutionPolicy to know that policy you've
# So, type Set-ExecutionPolicy RemoteSigned to enable execution scripts

import-module simplysql
get-module simplysql

# If you not have module execute the next commands
# find-module SimplySQL
# install-module SimplySQL

Open-MySqlConnection -server "localhost" -database "gestion_proyectos" -Credential (get-credential)
Invoke-SqlQuery "source C:\path\to\db_gestion_proyectos_creates.sql"

$Empleados = import-csv .\Empleados.csv


mysqlimport --ignore-lines=1 \
--fields-terminated-by=, \
--local --user=$user_name \
--password=$user_password gestion_proyectos \
$HOME/Documents/Programming/Sql/Gestion-de-Proyectos/src/csv/Empleados.csv \