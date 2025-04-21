#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "Please run this script with root access"
else
    echo "You are super user"
fi

dnf install mysql -y

echo "Is script proceeding?"