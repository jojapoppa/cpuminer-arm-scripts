#!/bin/bash

if grep "amlogic_miner" /etc/hosts > /dev/null
then

  read MAC </sys/class/net/wlan0/address
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

  NMAC=$mac1$mac2$mac3$mac4$mac5$mac6
  echo "miner: $NMAC"

  echo "127.0.0.1   localhost $NMAC" >/etc/hosts
  echo "::1         localhost $NMAC ip6-localhost ip6-loopback" >>/etc/hosts
  echo "fe00::0     ip6-localnet" >>/etc/hosts
  echo "ff00::0     ip6-mcastprefix" >>/etc/hosts
  echo "ff02::1     ip6-allnodes" >>/etc/hosts
  echo "ff02::2     ip6-allrouters" >>/etc/hosts

  echo "$NMAC" >/etc/hostname
  reboot now
fi

