**Network Troubleshooting Toolkit**

A simple yet powerful Bash-based troubleshooting toolkit designed to quickly diagnose common network issues such as connectivity failures, closed ports, and DNS resolution problems.  
This script simulates a real-world DevOps / System Administrator troubleshooting scenario where a server becomes unreachable and needs immediate diagnosis.  

**Problem Statement**

**Scenario**
A server becomes unreachable.  
We need a quick diagnostic tool that can:  
1. Verify network connectivity  
2. Check if a specific port is listening  
3. Validate DNS resolution  
4. Log issues if any test fails

**Real-World Use Case**

This toolkit helps identify whether the issue is:  
1. Network connectivity failure  
2. Service not running (port closed)  
3. DNS resolution problem  
4. Complete server outage

**Features**

1. Connectivity check using ping  
2. Port status verification using ss  
3. DNS resolution testing using nslookup  
4. Failure detection mechanism  
5. Lightweight and fast execution

**How It Works**

The script performs three sequential checks:  

**Connectivity Check**  
Uses:  
ping -c 3 <host>  
If the host responds --> Reachable  
If not --> Connectivity failure  

**Port Listening Check**  
Uses:  
ss -tulnp4 | grep :<port>  
Verifies whether the specified port is in LISTEN state.  
If LISTEN --> Service is running  
If not --> Port is closed or service is down  

**DNS Resolution Check**  
Uses:  
nslookp <domain>  
If successful --> DNS working  
If failed --> DNS issue  

**Make Script Executable**  
chmod +x network_toolkit.sh  
**Run the Script**   
./network_toolkit.sh  
**Provide Inputs**  
Hostname or IP  
Port number  
Domain name  

**Example Output**

Enter the Host name or ip: google.com  
Reacheable  

Enter the Port Number: 22  
Port is listening  

Enter the domain to check DNS resolution: example.com 
DNS: example.com resolves successfully  

**Skills Demonstrated**

1. Linux Networking Commands  
2. Process and Port Inspection  
3. Bash Conditional Logic  
4. Error Handling  
5. Real-world troubleshooting thinking  

**Why This Project Matters**

In DevOps and System Administration roles, troubleshooting server downtime is one of the most critical skills.  
This project demonstrates:  
1. Practical understanding of networking  
2. Automation mindset  
3. Real-world problem-solving ability  
4. Interview-ready scenario experience  

