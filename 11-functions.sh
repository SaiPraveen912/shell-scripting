#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    echo "Exit status: $1"
    echo "What are you doing: $2"
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access"
    exit 1 # manually exit if error comes
else
    echo "You are super user"
fi

dnf install mysql -y
# $? is exit status of above command --> dnf install mysql -y
VALIDATE $? "Installing MySQL" # $? is first variable "Installing mysql" is second variable

dnf install git -y
VALIDATE $? "Installing Git"