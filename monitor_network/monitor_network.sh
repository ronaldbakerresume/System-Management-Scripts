#!/bin/bash
# Ronald Baker

# Host to monitor (default: google.com)
HOST=${1:-"google.com"}

# Log file for downtime records
LOGFILE="network_downtime_$(date '+%Y%m%d').log"

echo "Monitoring network connectivity to $HOST..."
echo "Downtime events will be logged to $LOGFILE."

# Infinite loop to monitor connectivity
while true; do
    # Ping the host and check the result
    if ! ping -c 1 -W 1 "$HOST" &> /dev/null; then
        TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
        echo "$TIMESTAMP - Network unreachable for $HOST" | tee -a "$LOGFILE"
    fi
    sleep 5 # Check every 5 seconds
done

