#!/bin/bash
# Script to find and delete empty directories
# Developer: Ronald Baker

TARGET_DIR=${1?"Usage: $0 <target_directory>"}

echo "Searching for empty directories in $TARGET_DIR..."

# Find and delete empty directories
find "$TARGET_DIR" -type d -empty -exec rmdir {} \;

if [ $? -eq 0 ]; then
    echo "Empty directories successfully removed from $TARGET_DIR."
else
    echo "An error occurred while removing empty directories."
fi

