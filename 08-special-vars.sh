#!/bin/bash

echo "All variables: $@"
echo "Number of variables passed: $#"
echo "Script name: $0"
echo "Current working directory: $PWD"
echo "Home directory of current user: $HOME"
echo "Which user is running script: $USER"
echo "Host name: $HOSTNAME"
echo "Process ID of current shell script: $$"
sleep 60 & # & is used to send the command to background
echo "Process ID of last background command: $!"
echo "Ecit status of previous command: $?"