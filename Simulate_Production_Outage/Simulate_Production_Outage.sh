#!/bin/bash

set -e
echo "Checking whether the nginx  is start or not..."

if ! systemctl is-active --quiet nginx ;
then 
echo "nginx is down. Starting now..."
systemctl start nginx
else
echo "nginx is already running"
fi

echo "Now checking port.."

if ! ss -tulnp | grep -q ':80' ;
then 
	echo "Not Listen. Now Listening..."
	systemctl restart nginx 

	if ! ss -tulnp | grep -q ':80' ;
	then 
		echo "Nginx is running but port 80 still isn't listening. Check your config"
	else
		echo "Listen"
	fi

else
	echo "Already Listen"
fi

echo "Now Checking Firewall..."


if sudo ufw status | grep -q "Status: inactive"; then
    echo "Firewall is currently DISABLED. Enabling now..."
    sudo ufw --force enable
fi

if  sudo ufw status | grep -q "80/tcp.*ALLOW" ;
then 
	echo "Firewall is Ok"
else
	echo "Enabling the firewall"
	sudo ufw allow 80/tcp
fi

echo "Checking Disk Space..."

DISK_USAGE=$(df / | grep | awk '{ print $5 }' | sed 's/%//g')

if [[ "$DISK_USAGE" -gt 90 ]];
then 
	echo "WARNING: Disk space is critically low at ${DISK_USAGE}%!"
	echo "Removing..."
	sudo rm -rf /var/log/*.log
else
       	echo "Disk space is OK: ${DISK_USAGE}% used."
fi

echo "Checking nginx permissions..."

if [[ ! -r /etc/nginx/nginx.conf ]]; then
    echo "Permission problem detected!"
    sudo chmod 644 /etc/nginx/nginx.conf
    sudo systemctl restart nginx
else
    echo "Permissions OK"
fi


echo "Production check completed."
