#!/bin/bash

# catchsegv
/root/overclock.sh

MAC=blank
DIR1=/sys/class/net/eth0
DIR2=/sys/class/net/wlan0
echo Testing "$DIR1" and "$DIR2"
ip a > /root/ip.txt

if [ -d "$DIR1" ]; then
  echo found eth0
  read MAC <"$DIR1"/address

  if grep ": eth0:.*state DOWN" /root/ip.txt > /dev/null
  then
    echo "eth0 is down... checking wlan0 next..."
  fi
fi

if [ -d "$DIR2" ]; then
  echo found wlan0
  read MAC <"$DIR2"/address

  if grep ": wlan0:.*state DOWN" /root/ip.txt > /dev/null
  then
    echo "wlan0 is down... "
  fi
fi

echo mac: $MAC
ids=$(echo $MAC | tr ":" "\n")

IFS=:
set $MAC
mac1=$1
mac2=$2
mac3=$3
mac4=$4
mac5=$5
mac6=$6

NMAC=$mac4$mac5$mac6
echo miner: $NMAC

nice -n -7 /root/miner/cpuminer-xzc/cpuminer -a lyra2z -o stratum+tcp://us-east.lyra2z-hub.miningpoolhub.com:20581 -u jojapoppa.$NMAC -p x -D >> /var/log/miner.log 2>&1 &

