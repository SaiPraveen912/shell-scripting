#!/bin/bash

USER=$(id -u)

VALIDATE(){
    # $1 is for the exit status for dnf install mysql -y and for git
    # $2 is for printing Installing MySQL success
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
    echo "PLease run the script with super user"
else
    echo "You are super user"
fi


dnf install mysql -y
VALIDATE $? "Insatlling MySQL" 
# if [ $? -ne 0 ]
# then
#     echo "Installation of MySQL...FAILURE"
#     exit 1 # Manually exit if error comes
# else 
#     echo "Installation of MySQL...SUCCESS"
# fi

dnf install git -y
VALIDATE $? "Installing Git"
# if [ $? -ne 0 ]
# then
#     echo "Installation of Git...FAILURE"
#     exit 1 # Manually exit if error comes
# else 
#     echo "Installation of Git...SUCCESS"
# fi

echo "Is script proceeding?"

