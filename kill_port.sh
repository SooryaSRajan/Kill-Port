#!/bin/bash

#Check if option exists
if [ -z "$1" ];
then
    echo "port number has to be provided"
    exit 1
else
    if [[ -n ${1//[0-9]/} ]]; then
        echo "port number has to be numbers"
        exit 1
    fi
    #We have a number now, we can go ahead and kill the process
    PID=$(lsof -t -i :$1)
    if [ -z "$PID" ]
    then
        echo "process with port $1 not found"
        exit 1
    fi

    echo "killing process with pid $PID"
    kill -9 $PID
fi