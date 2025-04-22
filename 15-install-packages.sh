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
        echo "$2...FAILURE"
        exit 1
    else
        echo "$2...SUCCESS"
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
    dnf list installed $i &>>$LOGFILE
    if [ $? -eq 0 ]
    then
        echo -e "$i already installed...$Y SKIPPING $N"
    else
        echo "$i not installed...Need to install"
    fi
done