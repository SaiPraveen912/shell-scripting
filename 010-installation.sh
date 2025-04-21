#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "Please run this script with root access"
    exit 1 # Manually exit if error comes
else
    echo "You are super user"
fi

dnf install mysql -y

if [ $? -ne 0 ]
then 
    echo "Installation of MySQL...FAILURE"
    exit 1
else
    echo "Installation of MySQL...SUCCESS"
fi

dnf install gitt -y

if [ $? -ne 0 ]
then 
    echo "Installation of Git...FAILURE"
    exit 1
else
    echo "Installation of Git...SUCCESS"
fi

echo "Is script proceeding?"