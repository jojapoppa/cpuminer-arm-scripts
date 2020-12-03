#!/bin/sh

# jojapoppa

cpufreq-set --cpu 0 -f 1520MHz
cpufreq-set --cpu 1 -f 1520MHz
cpufreq-set --cpu 2 -f 1520MHz
cpufreq-set --cpu 3 -f 1520MHz

cpufreq-set --cpu 0 -g hotplug 
cpufreq-set --cpu 1 -g hotplug 
cpufreq-set --cpu 2 -g hotplug 
cpufreq-set --cpu 3 -g hotplug 
cpufreq-set --cpu 4 -g hotplug 
cpufreq-set --cpu 5 -g hotplug 
cpufreq-set --cpu 6 -g hotplug 
cpufreq-set --cpu 7 -g hotplug 

#cpufreq-set --cpu 0 -f 1520MHz
#cpufreq-set --cpu 1 -f 1520MHz
#cpufreq-set --cpu 2 -f 1520MHz
#cpufreq-set --cpu 3 -f 1520MHz

echo
cpufreq-info --cpu 0 -d
cpufreq-info -o
cpufreq-info -g
cpufreq-info -a
echo "next"
cpufreq-info --cpu 0 -f -m
cpufreq-info --cpu 0 -w -m
echo "next"
cpufreq-info --cpu 0 -s
echo "next"
cpufreq-info --cpu 0 -l
cpufreq-info --cpu 1 -l
cpufreq-info --cpu 2 -l
cpufreq-info --cpu 3 -l
cpufreq-info --cpu 4 -l
cpufreq-info --cpu 5 -l
cpufreq-info --cpu 6 -l
cpufreq-info --cpu 7 -l

