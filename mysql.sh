#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)    # $0  is fto find the script name 
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log   #/ creating a log file 
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo "please enter db password"
read -s mysql_root_password

VALIDATE(){
   if [ $1 -ne 0 ]
   then 
   echo -e "$2....$R  failure  $N"
   exit 1
   else 
   echo -e "$2 ....$G  success $N"
   fi 
}

if [ $USERID -ne 0 ]
then 
echo "please run this script as a superuser "
exit 1 
else 
echo "you are a super user "
fi


dnf install mysql-server -y &>>$LOGFILE
VALIDATE $? "installing mysql server"


systemctl enable mysqld &>>$LOGFILE
VALIDATE $? "enablling mysql"

systemctl start mysqld &>>$LOGFILE
VALIDATE $? "starting mysql server"

# below code will be useful for idempotent nature

mysql -h db.ramadevops78s.store -uroot -p${mysql_root_password} &>>$LOGFILE


if [$? -ne 0 ]
then 
mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFILE
VALIDATE $? "setting up root password"
else
echo -e "mysql root password is already setup ... $Y SKIPPING $N"
fi