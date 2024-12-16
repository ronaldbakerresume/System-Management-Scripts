#!/bin/bash
# Script to replace spaces in file names with underscores
# Developer: Ronald Baker

TARGET_DIR=${1?"Usage: $0 <target_directory>"}

echo "Replacing spaces in file names with underscores in $TARGET_DIR..."

# Iterate through all files in the target directory
for file in "$TARGET_DIR"/*; do
    if [ -f "$file" ]; then
        # Replace spaces with underscores in the file name
        new_name=$(echo "$file" | sed 's/ /_/g')
        
        # Rename the file if the name has changed
        if [ "$file" != "$new_name" ]; then
            mv "$file" "$new_name"
            echo "Renamed: $file -> $new_name"
        fi
    fi
done

echo "File name modification complete. Spaces have been replaced with underscores."

