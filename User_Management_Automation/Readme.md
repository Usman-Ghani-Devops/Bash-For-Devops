**Project Overview**

In growing companies, onboarding multiple developers manually can be time-consuming and error-prone.  
This Bash script automates the onboarding process for new developers by:  
1. Creating user accounts  
2. Setting initial passwords  
3. Adding users to a specified group  
4. Creating a shared project directory  
5. Applying proper ownership and permissions  
6. This simulates a real-world DevOps task performed during team expansion.  

**Objective**

Automate the process of onboarding developers in a Linux environment while ensuring:  
1. Proper user creation  
2. Secure password setup  
3. Group-based access control  
4. Secure shared directory permissions  

**Scenario**

A company hires 10 new developers.  
The system administrator needs to:  
Create user accounts  
Assign default passwords  
Add users to a development group  
Create a shared project directory  
Configure correct permissions for collaboration  
This script automates the entire workflow.  

**Technologies Used**

1. Linux  
2. Bash scripting  
3. useradd  
4. chpasswd  
5. groupadd  
6. gpasswd  
7. chmod  
8. chown  
9. Exit codes & input validation  

**Script Code**

#!/bin/bash  

read -p "Enter the Group: " group  

if getent group "$group" &> /dev/null ; then  
    echo "Group Already exists"  
    exit 1  
else  
    sudo groupadd "$group"  
fi  

for (( i=1;i<=10;i++ ))do  
    read -p "Enter the $i username:  " user  
    if  id "$user" &> /dev/null ; then  
        echo "User already exists"  
    else  
        sudo useradd -m -s /bin/bash "$user"  
        echo "$user:$user" | sudo chpasswd  
        sudo passwd -e "$user"  
    fi  
    sudo gpasswd -a "$user" "$group"  
done  

read -p "Enter the Directory name: " Project  

if [[ ! -d "$Project" ]]; then  
    sudo mkdir -p "$Project"  
fi  

sudo chown :"$group" "$Project"  
sudo chmod 2770 "$Project"  

echo "Directory Project is ready for the $group group"  

**Script Explanation (Step-by-Step)**  

**Group Creation** 

getent group "$group"

Checks if the group already exists.  
Prevents duplicate group creation.  
If not found → creates group using groupadd  
 
**User Creation Loop**

for (( i=1;i<=10;i++ ))  
Loops to create multiple users.  
Can be adjusted to 10 for real scenario.  
Inside loop:  
Check if user exists  
id "$user"  
Prevents duplicate user creation.  
Create user  
sudo useradd -m -s /bin/bash "$user"  
-m → Creates home directory  
-s /bin/bash → Sets default shell  
Set password  
echo "$user:$user" | sudo chpasswd  
Sets default password same as username.  
Force password change  
sudo passwd -e "$user"  
Forces user to change password at first login.  

**Add User to Group**

sudo gpasswd -a "$user" "$group"  
Adds user to specified group.  
Enables group-based access control.  

**Project Directory Creation**

sudo mkdir -p "$Project" 
Creates shared directory if not exists.  

**Ownership Configuration**

sudo chown :"$group" "$Project"  
Sets group ownership of directory.  
Owner remains root (optional improvement possible).  

**Permission Setup**

sudo chmod 2770 "$Project"  
Breakdown of 2770:  
2 → SetGID bit  
7 → Owner full access (rwx)  
7 → Group full access (rwx)  
0 → Others no access  

Why SetGID?  
SetGID ensures:  
Any new file created inside directory automatically inherits the group.  
This is a professional Linux permission practice for shared development environments.  

**How to Run**

Step 1: Make executable  
chmod +x user_setup.sh  
Step 2: Execute  
./user_setup.sh  
Step 3: Provide input  
Enter group name  
Enter usernames  
Enter project directory name  

**Security Considerations**

Script requires sudo privileges.  
Default passwords should be changed immediately.  
Consider generating random passwords for production environments.  

**Real-World Relevance**

This script simulates real onboarding automation used in:  
DevOps teams  
System administration  
Infrastructure management  
Startup environment  
Server provisioning workflows  
Large organizations automate similar processes using:  
Ansible  
Terraform  
LDAP / Active Directory  
CI/CD pipelines   

**Skills Demonstrated**

1. Linux user management
2. Group administration
3. Permission management
4. SetGID usage
5. Automation scripting
6. Input validation
7. Production onboarding simulation

**Conclusion**

This project demonstrates practical DevOps and Linux system administration skills by automating user onboarding and shared project environment setup. It reflects real-world operational tasks performed in growing technical teams.
