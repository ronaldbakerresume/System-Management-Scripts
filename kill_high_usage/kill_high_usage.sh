#!/bin/bash

# Function to show top processes by CPU or memory usage
show_top_processes() {
    echo "Top 5 Processes by CPU Usage:"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

    echo ""
    echo "Top 5 Processes by Memory Usage:"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
}

# Display the top processes
show_top_processes

# Ask the user if they want to terminate a process
read -p "Do you want to kill any process? (y/n): " answer
if [[ "$answer" == "y" ]]; then
    read -p "Enter the PID of the process to kill: " pid
    if [[ "$pid" =~ ^[0-9]+$ ]]; then
        kill -9 "$pid"
        if [ $? -eq 0 ]; then
            echo "Process $pid has been terminated."
        else
            echo "Failed to terminate process $pid."
        fi
    else
        echo "Invalid PID entered. Exiting."
    fi
else
    echo "No processes were killed."
fi

