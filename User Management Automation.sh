#!/bin/bash
<< Problem 

Scenario:
A company hires 10 new developers. Create a bash script that:

Creates users

Sets password

Adds them to a group

Creates project directory

Sets permissions

Problem

read -p "Enter the Group: " group

if getent group "$group" &> /dev/null ; 
then
	echo "Group ALready exsists"
	exit 1
else
	sudo groupadd "$group"
fi

for (( i=1;i<=2;i++ ))do
	read -p "Enter the $i usrname:  " user
	if  id "$user" &> /dev/null ; then
		echo "User already exsists addding"
	else
		sudo useradd -m -s /bin/bash  $user
		echo "$user:$user" | sudo chpasswd
		sudo passwd -e "$user"
	fi
	sudo gpasswd -a  "$user" "$group"
done

read -p "Enter the Directory name: " Project
if [[ ! -d "$Project" ]];then
	sudo mkdir -p "$Project"
fi

sudo chown :$group "$Project"
sudo chmod 2770 "$Project"

echo -n "Directory Project is reqdy for the $group group" 