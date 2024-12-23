#!/bin/bash

source ./common.sh

check_root

echo "please enter db password"
read -s mysql_root_password

dnf install mysql-server -y &>>$LOGFILE
systemctl enable mysqld &>>$LOGFILE
systemctl start mysqld &>>$LOGFILE

# below code will be useful for idempotent nature

mysql -h db.ramadevops78s.store -uroot -p${mysql_root_password} -e 'showdatabases;' &>>$LOGFILE
if [ $? -ne 0 ]
then 
mysql_secure_installation --set-root-pass ${mysql_root_password} &>>$LOGFILE
else
echo -e "mysql root password is already setup ... $Y SKIPPING $N"
fi