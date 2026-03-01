#!/bin/bash

set -euo pipefail
date=$(date +%d-%m-%y-%H-%M-%S)
destination="/home/user/Projects"


cp -r /var/www "$destination/backup_$date"

tar -czf "$destination/backup_$date.tar.gz" -C "$destination" "backup_$date"

rm -r "$destination/backup_$date"
