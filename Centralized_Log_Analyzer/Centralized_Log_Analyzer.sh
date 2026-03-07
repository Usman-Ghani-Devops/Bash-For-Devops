#!/bin/bash
set -e
shopt -s nullglob

read -r -p "Enter the Location of your Log Folder: " location
total_logs=0
files=0
declare -A levels
declare -A messages
for file in "$location"/*.log
do
	if [[ -f "$file" ]];then
		((files++))

		while read -r line

		do
			level=$(echo "$line" | awk '{print $3}')
			((total_logs++))

			((levels["$level"]++))
			message=$(echo "$line" | cut -d' ' -f4-)

			if [[ "$level" == "Error" ]];then
				((messages["$message"]++))
			fi


		done < "$file"
	fi
done

top_error=""
max_count=0

for err in "${!messages[@]}"
do
	if [[ "${messages[$err]}" -gt "$max_count" ]];
	then 
		max_count="${messages[$err]}"
		top_error="$err"
	fi
done
{

echo "---Log Analysis Report---"

echo "Total Files Processed: $files"

echo "Total Logs: $total_logs"


for err in "${!levels[@]}"
do
	echo " $err: ${levels[$err]}"
done
echo "Most Common Error"
echo "$top_error ($max_count) times"

} > Report.txt

echo "Report Generated"
