**Overview**

This Bash script provides a simple auto-healing mechanism for web servers such as Nginx or Apache. In production environments, services may stop unexpectedly due to errors or system issues. This script automatically checks the status of the web server and restarts it if it is found inactive, ensuring high availability.  
This is particularly useful for: 
1. Auto-healing systems  
2. Minimal downtime environments  
3. Basic monitoring and recovery automation  

**Features**

1. Checks the current status of the nginx service.  
2. Automatically starts nginx if it is inactive.  
3. Provides console output for monitoring actions.  
4. Can be adapted to work with apache2 by replacing the service name.

**Prerequisites**

1. Linux system with systemd.  
2. nginx or apache2 installed.  
3. User with sufficient privileges to run systemctl start (may require sudo).

**Usage**

1. Save the script as auto_restart_nginx.sh.  
2. Make the script executable:
   chmod +x auto_restart_nginx.sh  
3. Run the script:  
  ./auto_restart_nginx.sh
Example output when nginx is inactive:  
inactive  
Starting nginx...  
Example output when nginx is active:  
active

**Automation (Optional)**

For continuous monitoring, you can schedule this script with cron to run at regular intervals:  
Run every 5 minutes  
*/5 * * * * /path/to/auto_restart_nginx.sh  

**Extending the Script**

To monitor Apache, replace nginx with apache2 in the systemctl commands:   
status=$(systemctl is-active apache2)  
You can add logging to record restart events.  
Integrate with alerting systems to notify administrators when restarts occur.  

**Real-World Use Case**

This script exemplifies an auto-healing system in production. By automatically restarting stopped services, it reduces downtime and ensures web applications remain available for users, minimizing manual intervention.  

**License**

This script is provided as-is for educational and operational use. Modify it according to your environment and security policies.  
