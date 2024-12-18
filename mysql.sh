#!/bin/bash


sourse ./common.sh

check_root()

echo "please enter db password"
read -s mysql_root_password

dnf install mysql-server -y &>>$LOGFILE
VALIDATE $? "installing mysql server"


systemctl enable mysqld &>>$LOGFILE
VALIDATE $? "enablling mysql"

systemctl start mysqld &>>$LOGFILE
VALIDATE $? "starting mysql server"

# below code will be useful for idempotent nature

mysql -h db.ramadevops78s.store -uroot -p${mysql_root_password} &>>$LOGFILE


if [ $? -ne 0 ]
then 
mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFILE
VALIDATE $? "setting up root password"
else
echo -e "mysql root password is already setup ... $Y SKIPPING $N"
fi