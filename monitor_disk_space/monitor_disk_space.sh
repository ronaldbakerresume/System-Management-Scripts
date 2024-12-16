#!/bin/bash
# Ronald Baker

# Threshold for free disk space (in percentage)
THRESHOLD=20

# Log file for alerts
ALERT_LOG="disk_space_alerts_$(date '+%Y%m%d').log"

# Function to check disk space
check_disk_space() {
    echo "Checking disk space on all mounted filesystems..."
    df -h | awk 'NR>1 {print $5, $6}' | while read output; do
        # Extract percentage and mount point
        usage=$(echo $output | awk '{print $1}' | sed 's/%//')
        mount_point=$(echo $output | awk '{print $2}')

        # Check if usage exceeds the threshold
        if [ "$usage" -gt "$THRESHOLD" ]; then
            echo "$(date): ALERT! Low disk space on $mount_point ($usage% used)" | tee -a "$ALERT_LOG"
            # Uncomment the following line to send an email notification
            # echo "Low disk space on $mount_point ($usage% used)" | mail -s "Disk Space Alert" admin@example.com
        fi
    done
}

# Run the check
check_disk_space

