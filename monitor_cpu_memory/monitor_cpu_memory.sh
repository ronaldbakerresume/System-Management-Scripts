#!/bin/bash
# Ronald Baker


# Thresholds for alerts
CPU_THRESHOLD=80 # Percentage
MEM_THRESHOLD=80 # Percentage

# Log file
LOGFILE="cpu_memory_usage.log"

echo "Monitoring CPU and Memory usage... (Press Ctrl+C to stop)"
echo "Log file: $LOGFILE"

# Infinite loop to monitor system usage
while true; do
    # Get CPU and memory usage
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
    MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    
    # Log the current usage
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    echo "$TIMESTAMP - CPU: $CPU_USAGE%, Memory: $MEM_USAGE%" >> "$LOGFILE"
    
    # Check thresholds and alert if exceeded
    if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
        echo "ALERT: CPU usage exceeded $CPU_THRESHOLD% at $TIMESTAMP!" >> "$LOGFILE"
    fi
    
    if (( $(echo "$MEM_USAGE > $MEM_THRESHOLD" | bc -l) )); then
        echo "ALERT: Memory usage exceeded $MEM_THRESHOLD% at $TIMESTAMP!" >> "$LOGFILE"
    fi

    # Wait for a second before checking again
    sleep 1
done

