#! /bin/bash

set -ueo pipefail
<< Problem 

Monitor /var/log/syslog and:

Detect "error"

Count occurrences

Alert if errors > 10

Problem

read -p "Enter the Threshold:  " threshold

if [[ -z "$threshold" ]];
then
    echo "Empty"
    exit 1
fi

file="/var/log/syslog"
error=$(sudo grep -ic error "$file")

if [[ "$error" -gt "$threshold" ]];
then    
    echo "Errors are Greater than $threshold"
    exit 1
else
    echo "Error are less than $threshold"
    exit 0
fi

