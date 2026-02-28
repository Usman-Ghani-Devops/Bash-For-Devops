**Project Overview**

Disk space exhaustion is one of the most common causes of production outages.
When disk usage reaches critical levels:
Applications fail to write logs.
Databases may crash.
Services may stop unexpectedly.
System performance degrades.
Server may become completely unresponsive.
This project provides a lightweight Bash-based disk monitoring solution that checks disk usage and generates a warning when usage exceeds a defined threshold.

**Objective**

To monitor system disk usage and trigger an alert if usage exceeds a configured percentage limit.

**Scenario**

In a production Linux server:
If disk usage > 80%, send warning.
This script automates that monitoring check.

**Technologies Used**

Linux.
Bash Scripting.
df command.
awk.
Cron (for automation).


**Script Code**

#!/bin/bash
set -e

threshold=85

if ! df -h | awk -v t="$threshold" '$5+0 > t {exit 1}'; then
    echo "WARNING: Disk usage exceeded ${threshold}%"
fi

**Script Explanation (Step-by-Step)**

**set -e**
Stops script immediately if any command fails.
Prevents silent failures.
Good production practice.

**threshold=85**
Defines disk usage limit.
Can be modified based on requirement (e.g., 80%, 90%).

**df -h**
Displays disk usage in human-readable format:
Filesystem      Size  Used Avail Use% Mountedon
/dev/sda1        40G   32G   8G   80% /

**awk -v t="$threshold" '$5+0 > t {exit 1}'**
$5 → Represents Use% column
+0 → Converts percentage string into numeric value
-v t="$threshold" → Pass shell variable into awk
exit 1 → If usage exceeds threshold, return failure

**! (Logical NOT Operator)**
The ! reverses the result
If awk exits with error → condition becomes TRUE
Warning message print

**How to Run**

Step 1: Make executable
  chmod +x disk_monitor.sh
Step 2: Execute
  ./disk_monitor.sh
Automation with Cron
To run every 5 minutes:
sudo crontab -e

Add: 
*/5 * * * * /full/path/disk_monitor.sh >> /var/log/disk_monitor.log 2>&1
Explanation
*/5 → Every 5 minutes
>> → Append output to log file
2>&1 → Capture errors also

**Testing the Script**

You can test by:
Temporarily lowering threshold to 10%
Filling disk space using test files
Monitoring output logs

**Real World Relevance**

Large tech companies like:
Amazon
Google
Netflix

Use advanced monitoring systems (CloudWatch, Prometheus, etc.), but the core logic still relies on:
Checking disk usage
Comparing against thresholds
Triggering alerts
This project demonstrates foundational DevOps monitoring skills.
