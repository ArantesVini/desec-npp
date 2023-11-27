#! /bin/bash


echo -e "\e[31m ===================================="
echo -e " =  Parsing HTML with Bash Script   ="
echo -e " ====================================\e[0m"


if [ -z "$1" ]; then
    echo -e "\e[91mYou must specify a domain!\e[0m"
    echo -e "Syntax: $0 \e[93mgoogle.com\e[0m"
else
    echo -e "\e[33mSearching for subdomains on $1\e[0m"
    wget -q -nv $1;
    cat index.html | grep href | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v '<li' | grep -v ":" | sort -u > start_list.txt;
    rm index.html;
    for url in $(cat start_list.txt); do
    host $url; done | grep "has address";a 2>/dev/null | sort -u;
    rm start_list.txt;
fi

echo -e "\e[36mDo you want to do another search? (y/n)\e[0m"
read answer
if [ "$answer" = "y" ]; then
    echo -e "\e[36mSpecify another domain:\e[0m"
    read domain
    bash $0 $domain
else
    echo -e "\e[92mGoodbye, fellow hacker!\e[0m"
fi
