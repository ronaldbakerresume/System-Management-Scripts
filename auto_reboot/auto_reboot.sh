#!/bin/bash

# Resource usage thresholds
CPU_THRESHOLD=90  # Percentage
MEM_THRESHOLD=90  # Percentage

# Log file for resource monitoring
LOGFILE="$HOME/auto_reboot.log"

# Check system resource usage
check_usage() {
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
    MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

    # Log the current usage
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    echo "$TIMESTAMP - CPU: $CPU_USAGE%, Memory: $MEM_USAGE%" >> "$LOGFILE"

    # Check thresholds
    if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )) || (( $(echo "$MEM_USAGE > $MEM_THRESHOLD" | bc -l) )); then
        echo "$TIMESTAMP - ALERT: Resource usage exceeded thresholds!" >> "$LOGFILE"
        schedule_reboot
    fi
}

# Schedule a system reboot
schedule_reboot() {
    echo "Resource usage critical. Scheduling a reboot..."
    sudo shutdown -r +1 "Rebooting due to high resource usage." >> "$LOGFILE" 2>&1
}

# Monitor usage at intervals (every 5 seconds in this example)
echo "Monitoring system resources... (Press Ctrl+C to stop)"
while true; do
    check_usage
    sleep 5
done

