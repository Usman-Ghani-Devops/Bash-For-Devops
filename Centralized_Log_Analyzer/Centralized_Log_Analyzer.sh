# /bin/bash
set -e
shopt -s nullglob

read -r -p "Enter the Location of your Log Folder: " location
total=0
files=0
declare -A levels
declare -A messages
for file in "$location"/*.log
do
	if [[ -f "$file" ]];then
		((files++))

		while read -r line

		do
			level = $(echo "$line" | awk '{print 3}')
			((total++))

			((levels["$level"]++))
			message = $(echo "$line" | awk '{print 4}')

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
	if [[ "{$messages[err]}" -gt "$max_count" ]];
	then 
		max_count="${messages[err]}"
		top="$err"
	fi
done

echo max_count
echo top_error

