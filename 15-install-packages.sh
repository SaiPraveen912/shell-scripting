#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "Please run this script with super user access"
    exit 1
else 
    echo "You are super user"
fi

for i in $@
do 
    echo "Package to insatll: $i"
done