#! /bin/bash

echo "Type an IP address: "
read ip_address
ping -c1 $ip_address
echo "Ping finished."