#!/bin/bash

USER=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2...$R FAILURE $N"
        exit 1
    else
        echo -e "$2...$G SUCCESS $N"
    fi
}

if [ $USER -ne 0 ]
then
    echo "Please run this script with super user access"
    exit 1 # Manually exit if error comes
else 
    echo "You are super user"
fi

for i in $@ # $@ all variables passed in command line like --> mysql, git etc packages
do 
    echo "Package to insatll: $i"
    dnf list installed $i &>> $LOGFILE
    if [ $? -eq 0 ]
    then
        echo -e "$i already installed...$Y SKIPPING $N"
    else
        dnf install $i -y &>> $LOGFILE
        VALIDATE $? "Installation of $i"
    fi
done