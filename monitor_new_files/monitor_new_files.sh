#!/bin/bash
# Script to monitor a directory for new files
# Developer: Ronald Baker

TARGET_DIR=${1?"Usage: $0 <target_directory>"}
LOG_FILE=${2:-"new_files_log.txt"} # Default log file name

echo "Monitoring $TARGET_DIR for new files..."
echo "Log of new files will be saved to $LOG_FILE."

# Monitor the directory using inotifywait
inotifywait -m -e create "$TARGET_DIR" --format '%w%f' | while read -r new_file; do
    echo "$(date): New file detected - $new_file" | tee -a "$LOG_FILE"
done

