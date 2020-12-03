#!/bin/bash

# only reset the hostname on our actual miners... not on the image
if [ ! -f /root/install.sh ]; then
    /root/sethostname.sh
fi

# checks for kernel faults (usually due to overheating)
if grep " stall " /var/log/kern.log > /dev/null
then
    logrotate --force /etc/logrotate.d/
    rm /var/log/kern.log
    rm /var/log.hdd/kern.log
    logger "Detected cpu st*ll! ..."
    killall cpuminer
fi
if grep "detected stalls" /var/log/kern.log > /dev/null
then
    logrotate --force /etc/logrotate.d/
    rm /var/log/kern.log
    rm /var/log.hdd/kern.log
    logger "Detected st*lls!  ..." 
    killall cpuminer
fi
if grep "Tainted:" /var/log/kern.log > /dev/null
then
    logrotate --force /etc/logrotate.d/
    rm /var/log/kern.log
    rm /var/log.hdd/kern.log
    logger "Tainted! ..." 
    killall cpuminer
fi
if grep "Reserved memory: incorrect alignment of CMA region" /var/log/kern.log > /dev/null
then
    logrotate --force /etc/logrotate.d/
    rm /var/log/kern.log
    rm /var/log.hdd/kern.log
    logger "Incorrect memory alignment!" 
    killall cpuminer
fi
if grep "kernel NULL pointer" /var/log/kern.log > /dev/null
then
    logrotate --force /etc/logrotate.d/
    rm /var/log/kern.log
    rm /var/log.hdd/kern.log
    logger "NULL pointer!" 
    reboot now
fi

if grep 'wl_is_linkdown' /var/log/kern.log > /dev/null
then
    logrotate --force /etc/logrotate.d/
    rm /var/log/kern.log
    rm /var/log.hdd/kern.log
    logger "link is down - killing wpa_supplicant"
    echo Killing wpa_supplicant now...
    killall wpa_supplicant
fi
if grep 'WLC_E_LINK' /var/log/kern.log > /dev/null
then
    logrotate --force /etc/logrotate.d/
    rm /var/log/kern.log
    rm /var/log.hdd/kern.log
    logger "WLC_E_LINK event - killing wpa_supplicant"
    echo Killing wpa_supplicant now...
    killall wpa_supplicant
fi
if grep 'WLC_E_DEAUTH' /var/log/kern.log > /dev/null
then
    logrotate --force /etc/logrotate.d/
    rm /var/log/kern.log
    rm /var/log.hdd/kern.log
    logger "WLC_E_DEAUTH event - Killing wpa_supplicant"
    echo Killing wpa_supplicant now...
    killall wpa_supplicant
fi

# check wifi connection
wget -q --spider https://duckduckgo.com
if [ $? -eq 0 ]; then
  echo "Wireless connected"
else
  iw reg set US
  nmcli device wifi connect Liberty1 password 44746544
fi

if pgrep -x "cpuminer" > /dev/null
then
    echo "Miner is Running"
else
    logger "Stopped: restart miner now" 
    ./mine.sh &
fi

