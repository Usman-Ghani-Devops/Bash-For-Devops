#!/bin/bash

read -p "Enter the Host name or ip:  " server

ping -c 3 "$server" &> /dev/null

if [[ $? -eq 0 ]];then
	echo "Reacheable"
else
	echo "fail"
fi

# Now checking Port

read -p "Enter the Port Number" port

check=$(ss -tulnp4 | grep :"$port" | awk '{print $2}')

if [[ $check == "LISTEN" ]];then
	echo "Port is listening"
else
	echo "Port is not listening"
fi

read -p "Enter the domain to check DNS resolution: " domain

nslookup "$domain" &> /dev/null
if [[ $? -eq 0 ]]; then
    echo "DNS: $domain resolves successfully"
else
    echo "DNS: $domain resolution failed"
fi

