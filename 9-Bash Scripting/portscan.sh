#! /bin/bash

if [ "$1" == "" ]; then
    echo "You forgot an IP address!"
    echo "Syntax: $0 192.168.1 80"
else
    port=${2:-80}
    for ip in `seq 1 254`; do
        hping3 -S -p $port -c 1 $1.$ip 2> /dev/null | grep "flags=SA" | cut -d " " -f 2;
    done
fi
