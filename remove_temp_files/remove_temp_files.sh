#!/bin/bash
# Script to find and delete temporary files in a directory
# Developer: Ronald Baker

TARGET_DIR=${1?"Usage: $0 <target_directory>"}

echo "Searching for temporary files in $TARGET_DIR and removing them..."

# Find and delete temporary files with specific extensions
find "$TARGET_DIR" -type f \( -name "*.tmp" -o -name "*.bak" -o -name "*.swp" \) -exec rm -f {} \;

if [ $? -eq 0 ]; then
    echo "Temporary files have been successfully removed from $TARGET_DIR."
else
    echo "An error occurred while deleting temporary files."
fi

