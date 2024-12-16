#!/bin/bash
# Script to convert all file names in a directory to lowercase
# Developer: Ronald Baker

TARGET_DIR=${1?"Usage: $0 <target_directory>"}

echo "Converting file names in $TARGET_DIR to lowercase..."

# Iterate through all files in the target directory
for file in "$TARGET_DIR"/*; do
    if [ -f "$file" ]; then
        # Generate the lowercase name
        lowercase_name=$(echo "$file" | tr '[:upper:]' '[:lower:]')
        
        # Rename the file if the name has changed
        if [ "$file" != "$lowercase_name" ]; then
            mv "$file" "$lowercase_name"
            echo "Renamed: $file -> $lowercase_name"
        fi
    fi
done

echo "File name conversion to lowercase complete."

