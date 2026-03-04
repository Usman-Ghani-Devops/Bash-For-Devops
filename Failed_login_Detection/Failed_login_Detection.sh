#!/bin/bash

path='/var/log/auth.log'

sudo grep "Failed Password" "$path" | awk '{print $(NF-3)}' | sort | nuniq -c | while read count ip
do 
	if [[ count > 5 ]];then
		echo "Blocking "$ip" Attemptd "$count"
		sudo iptables -A INPUT -s '$ip" -j DROP
	fi
done
