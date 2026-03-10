# Server Health Dashboard Script

A simple **Bash-based Server Health Dashboard** that displays important system metrics.  
This script helps system administrators and DevOps engineers quickly check the health of a Linux server.  


## Features

* Displays **CPU Usage**  
* Shows **Memory Usage**  
* Displays **Disk Usage**  
* Lists **Top 5 CPU-consuming Processes**  
* Shows **Active Network Connections**  


## Technologies Used

* Bash Scripting  
* Linux System Commands  

Commands used in the script:  
 
* `top`  
* `free`  
* `df`   
* `ps`  
* `ss`  
* `awk`  
* `grep`  

## Script Overview

The script collects system information and prints a simple **server health report**.  

Metrics included:  

* CPU usage percentage  
* Memory usage statistics  
* Disk usage information  
* Top 5 processes consuming CPU  
* Active network connections  

## Script Code

```bash  
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
```

---

## How to Run

1. Clone the repository

```
git clone https://github.com/yourusername/server-health-dashboard.git
```

2. Navigate to the project directory

```
cd server-health-dashboard
```

3. Give execute permission

```
chmod +x health.sh
```

4. Run the script

```
./health.sh
```

---

## Example Output

```
----- Server Health Dashboard -----

CPU Usage
Used CPU: 12.4%

Memory Usage
              total        used        free  
Mem:           7.6G        3.1G        2.4G

Disk Usage  
Filesystem      Size  Used Avail Use% Mounted on  
/dev/sda1        50G   20G   27G  43%  

Top 5 Process  
PID  PPID CMD        %MEM %CPU 

Active Network Connections 
Netid State Recv-Q Send-Q Local Address:Port  

----- Report End ----
```

---

## Use Cases

* Quick server monitoring  
* DevOps practice projects  
* Learning Linux system commands  
* Basic server troubleshooting  

## License

This project is open-source and available under the **MIT License**.
