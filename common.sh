#!/bin/bash

set -e

handle_error(){
    echo "error occured at line number: $1 , error command : $2"
}


trap 'handle_error ${LINEND} "$BASH_COMMAND"' ERR  ## SYNTAX OF ERRORS IN SHELSCRIPT

 
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)    # $0  is fto find the script name 
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log   #/ creating a log file 
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"



VALIDATE(){
   if [ $1 -ne 0 ]
   then 
   echo -e "$2....$R  failure  $N"
   exit 1
   else 
   echo -e "$2 ....$G  success $N"
   fi 
}

check_root(){ 
if [ $USERID -ne 0 ]
then 
echo "please run this script as a superuser "
exit 1 
else 
echo "you are a super user "
fi
}