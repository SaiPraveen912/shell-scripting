#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run the script with root user"
    exit 1
else
    echo "You are super user"
fi

for i in $@
do
    echo "All packages: $i"
done