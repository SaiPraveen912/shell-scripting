#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 9 ]
then
    echo "Given number $NUMBER greater than 9"
else
    echo "Given number $NUMBER less than 9"
fi
