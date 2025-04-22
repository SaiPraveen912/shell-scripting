#!/bin/bash

USER=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

if [ $USER -ne 0 ]
then
    echo "Please run this script with super user access"
    exit 1 # Manually exit if error comes
else 
    echo "You are super user"
fi

for i in $@
do 
    echo "Package to insatll: $i"
    dnf list installed $i &>> $LOGFILE
done