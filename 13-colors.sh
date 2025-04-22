#!/bin/bash

USER=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

echo "Script started exexcuting at time stamp: $TIMESTAMP"


VALIDATE(){
    # $1 is for the exit status for dnf install mysql -y and for git
    # $2 is for printing Installing MySQL success
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
    echo "PLease run the script with super user"
    exit 1
else
    echo "You are super user"
fi


dnf install mysql -y &>> $LOGFILE
VALIDATE $? "Insatlling MySQL" 
# if [ $? -ne 0 ]
# then
#     echo "Installation of MySQL...FAILURE"
#     exit 1 # Manually exit if error comes
# else 
#     echo "Installation of MySQL...SUCCESS"
# fi

dnf install git -y &>> $LOGFILE
VALIDATE $? "Installing Git" 
# if [ $? -ne 0 ]
# then
#     echo "Installation of Git...FAILURE"
#     exit 1 # Manually exit if error comes
# else 
#     echo "Installation of Git...SUCCESS"
# fi

dnf install dockerr -y &>> LOGFILE
VALIDATE $? "Installing Docker"
