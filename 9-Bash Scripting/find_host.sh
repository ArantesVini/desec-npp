#! /bin/bash

for i in {1..254}; do
  ip="172.16.1.$i"
  ping -c 1 -W 1 $ip > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "Host $ip is up, checking port 1337"
    nc -zv -w 5 $ip 1337 > /dev/null 2>&1
    if [ $? -eq 0 ]; then
      echo "Port 1337 is open on $ip"
    fi
  fi
done
