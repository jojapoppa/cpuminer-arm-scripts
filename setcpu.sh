#!/bin/sh

# setcpu, a set cpu script written for custom Android Roms by clvv <x@wei23.net>
# Usage:    setcpu [MINFREQ MAXFREQ GOVERNOR]
#           setcpu -h, --help      #print this message
#           setcpu -s, --status    #print CPU status
# If no parameter is specified, an interactive setup guide will start.
# NOTE: This script MUST be run as root in order to make configuration change!
# Tips: run 'watch -n1 setcpu -s' to watch CPU status, refresh every second.
# Happy overclocking! :)
# Script written by clvv <x@wei23.net>

if [ $# -eq 0 ]; then
    freqs=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies)
    echo "NOTE: This script MUST be run as root in order to make configuration change!"
    echo -n "Current CPU min_freq: "; cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
    echo -n "Current CPU max_freq: "; cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    echo -n "Current CPU governor: "; cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    echo -n "Current CPU frequency: "; cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
    echo "Available CPU frequencies: $freqs"
    echo -n "Please enter a desired CPU min_freq: "
    read min
    if [ $min ]; then
        if [ $(echo $freqs | grep -q -E " $min |^$min | $min$"; echo $?) -eq 0 ]; then
            echo $min > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq && echo "Done"
        else
            echo "Please enter a valid value of CPU min_freq!" 1>&2
        fi
    fi
    unset min
    echo -n "Please enter a desired CPU max_freq: "
    read max
    if [ $max ]; then
        if [ $(echo $freqs | grep -q -E " $max |^$max | $max$"; echo $?) -eq 0 ]; then
            echo $max > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq && echo "Done"
        else
            echo "Please enter a valid value of CPU max_freq!" 1>&2
        fi
    fi
    unset max
    unset freqs
    gvnrs=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors)
    echo "Available CPU governors: $gvnrs"
    echo -n "Please enter a desired type of CPU governor: "
    read gvnr
    if [ $gvnr ]; then
        if [ $(echo $gvnrs | grep -q -E " $gvnr |^$gvnr | $gvnr$"; echo $?) -eq 0 ]; then
            echo $gvnr > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor && echo "Done"
        else
            echo "Please enter a valid type of CPU governor!" 1>&2
        fi
    fi
    unset gvnr
    unset gvnrs
elif [[ "$1" = '-h' -o "$1" = '--help' ]]; then
    echo "Usage:    setcpu [MINFREQ MAXFREQ GOVERNOR]"
    echo "          setcpu -h, --help      #print this message"
    echo "          setcpu -s, --status    #print CPU status"
    echo "If no parameter is specified, an interactive setup guide will start."
    echo "NOTE: This script MUST be run as root in order to make configuration change!"
    echo "Tips: run 'watch -n1 setcpu -s' to watch CPU status, refresh every second."
    echo -n "Your available CPU frequencies are:"
    cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
    echo "Happy overclocking! :)"
    echo "Script written by clvv <x@wei23.net>"
elif [[ "$1" = '-s' -o "$1" = '--status' ]]; then
    echo -n "Available CPU frequencies:"; cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
    echo -n "Current CPU min_freq: "; cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
    echo -n "Current CPU max_freq: "; cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    echo -n "Current CPU governor: "; cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_gocho -n "Current CPU frequency: "; cat /sys/devices/system/cpu/cpu0/cq/scaling_cur_freq
else
    freqs=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies)
    if [ $1 ]; then
        if [ $(echo $freqs | grep -q -E " $1 |^$1 |cho $?) -eq 0 ]; then
            echo $1 > /sys/devices/system/cpu0/cpufreq/scaling_min_freq
        else
            echo "Please use a valid value off] min_freq!" 1>&2/c977i[fi
    fi
    if [ $2 ]; then
        if [ $(echo $freqs | grep -q -E " $2 |^$2 | $2$"; echo $?) -eq 0 ]; then
            echo $2 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
        else
            echo "Please use a valid value of CPU max_freq!" 1>&2
        fi
    fi
    unset freqs
    if [ $3 ]; then
        if [ $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors | grep -q -E " $3 |^$3 | $3$"; echo $?) -eq 0 ]; then
            echU status, refrvices/system/cpu/cpu0/cpufreq/scaling_governor
   t written by c        echo "Please use a valid type of CPU governor!" 1>&2
        fi
    fi
fi
