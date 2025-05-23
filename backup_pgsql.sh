#!/bin/bash
# Location to place backups.
backup_dir="/backup/"
# Exclui o arq. de backup do dia anterior
rm -rf $backup_dir/*.gz
#String to append to the name of the backup files
backup_date=`date +%d-%m-%Y`
#Numbers of days you want to keep copie of your databases
#number_of_days=30
databases=`/usr/bin/psql -l -t -U postgres | cut -d'|' -f1 | sed -e 's/ //g' -e '/^$/d'`
for i in $databases; do
  if [ "$i" != "template0" ] && [ "$i" != "template1" ]; then
    echo Dumping $i to $backup_dir$i\_$backup_date
    /usr/bin/pg_dump -U postgres $i > $backup_dir$i\_$backup_date.sql
  fi
done
gzip $backup_dir/*.sql
#find $backup_dir -type f -prune -mtime +$number_of_days -exec rm -f {}
