#!/bin/bash

USERID=$(id -u)


if [ $USERID -ne 0 ]
then
    echo "Please run script using super user credentials"
    exit 1 # manually exit if not super user
else
    echo "You are super user"
fi

echo "All packages: $@"