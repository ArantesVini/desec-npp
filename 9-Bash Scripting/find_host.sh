#! /bin/bash

initial_host="172.16.1"
max_processes=100

for host in $(seq 1 254); do
    target_ping="172.16.1.$host"
    url="srvkey.businesscorp.com.br"
    first_port="13"
    second_port="37"
    third_port="30000"
    fourth_port="3000"
    activate_socket="172.16.1.$host:1337"
    
    hping3 -c 1 -S -p $first_port $target_ping &
    hping3 -c 1 -S -p $second_port $target_ping &
    hping3 -c 1 -S -p $third_port $target_ping &
    hping3 -c 1 -S -p $fourth_port $target_ping &
    
    hping3 -c 1 -S --ack -p 1337 $host &
    
    if [[ $(jobs -p | wc -l) -ge $max_processes ]]; then
        wait
    fi
    
    if [ $? -eq 0 ]; then
        echo "Host $target_ping is up"
        echo "Host responded with an ACK flag"
    else
        echo "Host $target_ping is down"
    fi
done

wait