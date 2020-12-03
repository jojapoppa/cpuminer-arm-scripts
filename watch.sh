#!/bin/bash

echo "Starting watch.sh..." >> /var/log/miner.log

MAC=blank
DIR1=/sys/class/net/wlan0
if [ -d "$DIR1" ]; then
  read MAC <"$DIR1"/address
fi
DIR2=/sys/class/net/eth0
if [ -d "$DIR2" ]; then
  read EMAC <"$DIR2"/address
fi

watch -c -n 5 "echo Temperature: ;cat /sys/devices/virtual/thermal/thermal_zone0/temp;echo "WLAN0 MAC: $MAC - ETH0: $EMAC -  IP: $(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')";tail -30 /var/log/miner.log"
