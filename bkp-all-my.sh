#!/bin/bash
#
# Backup total do MYSQL
#

rm -rf /backup/databases/mysql_all*.gz
cd /backup/databases

/usr/bin/mysqldump -u marcio_bkp -pI8hErcT2ww39kA3lBq01 --all-databases --events > mysql_all_`date +%d%m%y`.sql

gzip *.sql
