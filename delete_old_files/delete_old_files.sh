#!/bin/bash
# Script to delete files older than a specified number of days
# Developer: Ronald Baker

TARGET_DIR=${1?"Usage: $0 <target_directory> <days>"}
DAYS=${2?"Usage: $0 <target_directory> <days>"}

echo "Deleting files older than $DAYS days in $TARGET_DIR..."

# Find and delete files older than the specified number of days
find "$TARGET_DIR" -type f -mtime +$DAYS -exec rm -f {} \;

if [ $? -eq 0 ]; then
    echo "Deletion complete. All files older than $DAYS days have been removed."
else
    echo "An error occurred during the deletion process."
fi

