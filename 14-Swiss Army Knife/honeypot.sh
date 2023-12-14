#! /bin/bash


echo -e "\e[31m ===================================="
echo -e " =  Honeypot Builder                      ="
echo -e " ====================================\e[0m"

if [ "$EUID" -ne 0 ]
then echo -e "\e[91mPlease run as root!\e[0m"
    exit
fi

port=21
banner="220 ProFTPD 1.3.5 Server (Debian)"

echo $banner > banner.txt
touch honeypot.log

chmod 777 honeypot.log
chmod 777 banner.txt

echo -e "\e[33mStarting honeypot on port $port\e[0m"
echo -e "\e[33mBanner: $banner\e[0m"
echo -e "\e[33mIP is $(hostname -I)\e[0m"

while true; do
    nc -vnlp "$port" < banner.txt 2>&1 | grep -v "listening on \[any\] $port" >> honeypot.log
    echo "$(date)" >> honeypot.log
done
