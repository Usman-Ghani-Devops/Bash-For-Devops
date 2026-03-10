#!/bin/bash

echo "----- Server Health Dashboard -----"

echo "CPU Usage"

top -bn1 | grep 'Cpu(s)' | awk '{print "Used CPU: "$2 + $4 "%" }'

echo ""

echo "Memory Usage"

free -h 

echo ""

echo "Disk Usage"

df -h 

echo ""

echo "Top 5 Process"

ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

echo ""

echo "Active Network Connections"

ss -tunap | head

echo ""

echo "----- Report End ----"


