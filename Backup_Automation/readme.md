**Project Overview**
This script automates daily backups of the /var/www directory on Linux servers. It is designed for real-world server environments, ensuring web server files are safely backed up, compressed, and stored with timestamps for easy recovery.  

**Features**

1. Automated timestamped backups – each backup has a unique timestamp.  
2. Compressed archives – reduces storage usage with .tar.gz files.  
3. Error-safe execution – script exits on errors using set -euo pipefail.  
4. Easy automation – integrates with cron for scheduled backups.  
5. Scalable – can be extended to remote backups or multiple directories. 

**Requirements**

1. Linux server with Bash  
2. tar and cp utilities installed    
3. Read permissions for /var/www and write permissions for backup destination  
4. Optional: cron for scheduling  

**Installation**

Copy the script to your preferred directory:  
cp backup_www.sh /home/user/Projects/   

Make it executable:
chmod +x /home/user/Projects/backup_www.sh 

**Usage**

Run Manually  
./backup_www.sh  


**Automate with Cron**

Open crontab:  
sudo crontab -e  
Add the following to run daily at 2 AM:  
0 2 * * * /home/user/Projects/backup_www.sh  

**Script Code**

#!/bin/bash  

set -euo pipefail  
date=$(date +%d-%m-%y-%H-%M-%S)  
destination="/home/user/Projects"  

# Copy /var/www to timestamped folder
cp -r /var/www "$destination/backup_$date"  

# Compress the backup folder  
tar -czf "$destination/backup_$date.tar.gz" -C "$destination" "backup_$date"  

# Remove the uncompressed backup folder  
rm -r "$destination/backup_$date"  

**Notes**

Ensure the backup destination has enough disk space to store compressed backups.  
Regularly transfer backups to external storage or a remote server for disaster recovery.  
You can customize the backup path and schedule as per your server setup.  
