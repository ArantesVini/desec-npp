#! /bin/bash

if [ "$1" == "" ]
then
    echo "You forgot an IP address!"
    echo "Syntax: $0 192.168.1"
else 
    echo "Looking for open ports in host $1"
fi

sleep 1

if [ "$2" == "" ]
then
    echo "You forgot a port!"
    echo "Syntax: $0 192.168.1 80"
else 
    echo "Looking for services in ports $2"
fi
