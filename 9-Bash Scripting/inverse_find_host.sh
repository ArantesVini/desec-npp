#! /bin/bash

max_processes=20

for host in $(seq 254 -1 1); do
    target_connection="172.16.1."$host
    nc -z -v -w 2 $target_connection 1337

    if (( $(jobs -r -p | wc -l) >= max_processes )); then
        wait -n
    fi
done

wait
