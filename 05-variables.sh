#!/bin/bash

echo "Please enter username::"

# read USERNAME #here USERNAME is variable
read -s USERNAME # -s --> don't display what we enter

echo "Please enter password::"

# read PASSWORD #here PASSWORD is another variable
read -s PASSWORD # -s --> don't display what we enter

echo "Username is: $USERNAME, Password is: $PASSWORD"