#!/bin/bash
set -e

threshold=85

if ! df -h | awk -v t="$threshold" '$5+0 > t {exit 1}'; then
    echo "WARNING: Disk usage exceeded ${threshold}%"
fi
