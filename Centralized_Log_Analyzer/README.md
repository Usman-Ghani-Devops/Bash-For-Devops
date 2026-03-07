**Centralized Log Analyzer (Bash)**

A lightweight Centralized Log Analysis tool written in Bash that parses multiple log files, categorizes log levels, and generates a structured report.  

This project simulates a basic alternative to log monitoring systems like the ELK Stack, helping understand how centralized logging works in real-world DevOps environments.  

**Project Overview**

In production systems, multiple servers generate thousands of log entries. Engineers need tools to analyze these logs efficiently.  

This script:  
1. Collects multiple .log files from a directory  
2. Parses each log entry  
3. Categorizes logs based on log levels  
4. Detects most frequent errors  
4. Generates a summary report  
This demonstrates the core concept of centralized log aggregation and analysis.

**Features**

1. Processes multiple log files automatically  
2. Categorizes logs by log level  
3. Counts total log entries  
4. Detects most frequent error message  
5. Generates a structured analysis report  
6. Handles missing log files safely using nullglob

**Log Format Expected**

The script expects logs in the following format:  
2026-03-01 10:30:25 Error Database connection failed  
2026-03-01 10:31:10 Info User login successful  
2026-03-01 10:32:05 Warning Disk usage high  

Format breakdown:  
Date Time LogLevel Message  

Example:  
2026-03-01 10:30:25 Error Database connection failed  
Field 1 → Date  
Field 2 → Time  
Field 3 → Log Level  
Field 4+ → Message  

**How the Script Works**

1. User provides the log folder path.  
2. Script reads all .log files inside the directory.  
3. Each line is parsed to extract:  
--> Log Level  
--> Message  
4. Log levels are counted using associative arrays.  
5. Error messages are tracked to find the most common error.  
6. A final report is generated.

**Running the Script**

**Step 1: Give execution permission**  
chmod +x log_analyzer.sh  

**Step 2: Run the script**  
./log_analyzer.sh  

**Step 3: Enter log directory**  
Enter the Location of your Log Folder: /var/logs  

**Output Example**

The script generates a file named:  
Report.txt  

Example report:  

---Log Analysis Report---  

Total Files Processed: 3  
Total Logs: 245  

Info: 120  
Warning: 60  
Error: 65  

Most Common Error  
Database connection failed (25) times  

**Real World DevOps Use Case**

This project demonstrates concepts used in centralized logging systems such as:  
1. Log aggregation  
2. Log parsing  
3. Error monitoring  
4. Operational visibility  
In large production environments, tools like:  
1. Elasticsearch  
2. Logstash  
3. Kibana  
perform similar tasks at scale.  

This script shows how these ideas can be implemented in a simple Bash-based solution.  

**Learning Outcomes**

Through this project you will understand:  
1. Log parsing in Bash  
2. Associative arrays  
3. File processing  
4. Real-world DevOps monitoring concepts  
5. Automation with shell scripting  
