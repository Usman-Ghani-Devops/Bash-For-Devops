**Project Overview**

System logs are critical for monitoring server health.
The /var/log/syslog file stores system-level events including:  
1. Service failures  
2. Kernel messages  
3. Application errors  
4. Security warnings  
In production environments, repeated errors may indicate:  
1. Failing services  
2. Misconfigurations  
3. Resource exhaustion  
4. Security issues  
This project monitors the syslog file, counts occurrences of the word "error", and triggers an alert if the error count exceeds a defined threshold.

**Objective**

1. Monitor /var/log/syslog and:  
2. Detect the keyword "error"  
3. Count total occurrences  
4. Alert if errors exceed user-defined threshold  

**Scenario**

If error count > 10 → generate alert.  
The script allows dynamic threshold input from the user.  


**Technologies Used**

Linux  
Bash scripting  
grep  
Exit codes  
Conditional logic  


**Script Code**

#!/bin/bash 

set -ueo pipefail

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
    echo "Errors are less than $threshold"  
    exit 0  
fi  


**Detailed Explanation**

**set -ueo pipefail**

This enables safer scripting:  
-u → Exit if variable is undefined  
-e → Exit if any command fails  
-o pipefail → Catch pipeline errors  
This is considered a production-level Bash practice.  

**Reading Threshold from User**

read -p "Enter the Threshold:  " threshold

Accepts user input  
Makes script dynamic instead of hardcoding value  

**Input Validation**

if [[ -z "$threshold" ]]

Checks if user entered nothing  
Prevents empty comparison errors  

**Log File Definition**

file="/var/log/syslog"

This is the main Linux system log file.

**Counting Errors**

error=$(sudo grep -ic error "$file")

Explanation:  
grep → Search for pattern  
-i → Case insensitive (Error, ERROR, error)  
-c → Count matches  
sudo → Required to access system logs  
This stores total number of error occurrences.  

**Threshold Comparison**

if [[ "$error" -gt "$threshold" ]]

-gt → Greater than comparison  
If error count exceeds threshold → Alert  

**Exit Codes**

exit 1 → Alert condition (used in monitoring systems)

exit 0 → Normal condition

Exit codes are important for automation and monitoring tools.

**How to Run**

Step 1: Make executable  
chmod +x syslog_monitor.sh
Step 2: Run script  
./syslog_monitor.sh  
Step 3: Enter threshold  
Example:  
Enter the Threshold:  10  

**Automate with Cron (Optional)**

To run every 5 minutes:  
crontab -e  
Add:  
*/5 * * * * /full/path/syslog_monitor.sh >> /var/log/syslog_monitor.log 2>&1  

**Testing the Script**

To simulate errors:  
Restart services  
Trigger failing commands   
Check log entries using:  
sudo tail -f /var/log/syslog  

**Real-World Relevance**

In production, log monitoring is essential for:  
1. Detecting failing services  
2. Early incident response  
3. Security monitoring  
4. Root cause analysis  
Enterprise tools like:  
1. Prometheus  
2. ELK Stack  
3. Splunk  
Perform similar logic at scale.  

This script demonstrates foundational monitoring logic used in DevOps and SRE environments.

**Conclusion**

This project simulates a real-world log monitoring solution using Bash scripting.  
It demonstrates core DevOps skills related to system monitoring, alerting logic, and production safety practices.  
