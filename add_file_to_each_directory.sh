#!/bin/bash
# Script to copy a specific file to each directory within a target directory
# Developer: Ronald Baker

# Input parameters
TARGET_DIR=${1?"Usage: $0 <target_directory> <file_to_add>"}
FILE_TO_ADD=${2?"Usage: $0 <target_directory> <file_to_add>"}

# Ensure the file to add exists
if [ ! -f "$FILE_TO_ADD" ]; then
    echo "Error: File $FILE_TO_ADD does not exist."
    exit 1
fi

echo "Adding $FILE_TO_ADD to each directory within $TARGET_DIR..."

# Iterate through directories in the target directory
find "$TARGET_DIR" -type d | while read -r dir; do
    echo "Copying $FILE_TO_ADD to $dir..."
    cp "$FILE_TO_ADD" "$dir/"
done

echo "File addition complete!"

