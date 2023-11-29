#! /bin/bash

initial_host="172.16.1"

max_processes=20

for host in $(seq 1 254); do
    target_ping="172.16.1."$host
    url="srvkey.businesscorp.com.br"
    first_port="13"
    second_port="37"
    third_port="30000"
    fourth_port="3000"
    activate_port="1337"
    
    hping3 -c 1 -S -p $first_port $target_ping -q 2>/dev/null &
    hping3 -c 1 -S -p $second_port $target_ping -q 2>/dev/null &
    hping3 -c 1 -S -p $third_port $target_ping -q 2>/dev/null &
    hping3 -c 1 -S -p $fourth_port $target_ping -q 2>/dev/null &
    hping3 -c 1 -S -p $activate_port $target_ping -q 2>/dev/null &
    
    if (( $(jobs -r -p | wc -l) >= max_processes )); then
        wait -n
    fi
done

wait
