#!/bin/bash
# Script to delete all files with a specific extension in a directory
# Developer: Ronald Baker

TARGET_DIR=${1?"Usage: $0 <target_directory> <extension>"}
EXTENSION=${2?"Usage: $0 <target_directory> <extension>"}

echo "Deleting all *.$EXTENSION files in $TARGET_DIR..."

# Find and delete files with the specified extension
find "$TARGET_DIR" -type f -name "*.$EXTENSION" -exec rm -f {} \;

if [ $? -eq 0 ]; then
    echo "Deletion complete. All *.$EXTENSION files have been removed from $TARGET_DIR."
else
    echo "An error occurred while deleting files."
fi

