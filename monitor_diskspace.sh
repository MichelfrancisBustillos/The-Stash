#!/usr/bin/env bash

disk="/dev/mapper/ubuntu--vg-ubuntu--lv"  # replace with the disk that you are monitoring

percentage=$(df -hl --total ${disk} | tail -1 | awk '{printf $5}')

threshold="80"  # Disk usage alert threshold in percentage

number=${percentage%\%*}

message="Used space on ${disk} is ${number}%"

push_url="https://status.katoteros.org/api/push/PUSHURL" # Replace with Uptime Kuma Push URL ID

if [ $number -lt $threshold ]; then
    service_status="up"
else
    service_status="down"
fi

curl \
    --get \
    --data-urlencode "status=${service_status}" \
    --data-urlencode "msg=${message}" \
    --data-urlencode "ping=${number}" \
    --silent \
    ${push_url} \
    > /dev/null
