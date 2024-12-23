#!/bin/bash

source ./common.sh

check_root

echo "please enter db password"
read -s mysql_root_password

dnf module disable nodejs -y  &>>$LOGFILE

dnf module enable nodejs:20 -y &>>$LOGFILE

dnf install nodejs -y &>>$LOGFILE

id expense &>>$LOGFILE
if [$? -ne 0]

then
    useradd expense &>>$LOGFILE
    else
    echo -e "expense user already ccreated...$Y SKIPPING $N"
    fi

    mkdir -p /app &>>$LOGFILE
    curl -o 

    cd /app
    rm -rf /app/*
    unzip /tmp/backend.zip  &>>$LOGFILE

    npm install &>>$LOGFILE

    cp

    systemctl demon-reload &>>$LOGFILE

    systemctl start backend &>>$LOGFILE

    systemctl enable backend &>>$LOGFILE

    dnf install mysql -y &>>$LOGFILE

    mysql -h db.daws.ramadevops78s.store -urooot -p${mysql_root_password}

    systemctl restart backend &>>$LOGFILE