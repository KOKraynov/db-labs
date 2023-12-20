CREATE DATABASE potatos;

use potatos;

mysqlimport --ignore-lines=1 \
            --fields-terminated-by=, \
            --local -u root \
            -p Database \
             TableName.csv