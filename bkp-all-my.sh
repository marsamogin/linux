#!/bin/bash -xv
#
# Backup total do MYSQL
#

rm -rf /backup/mysql-all/*.gz
cd /backup/mysql-all

/usr/bin/mysqldump --all-databases --events > mysql_all_`date +%d%m%y`.sql

gzip *.sql
