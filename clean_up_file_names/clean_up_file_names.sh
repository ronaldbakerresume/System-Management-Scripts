#!/bin/bash
# Script to clean up file names by removing spaces and special characters
# Developer: Ronald Baker

TARGET_DIR=${1?"Usage: $0 <target_directory>"}

echo "Cleaning up file names in $TARGET_DIR..."

# Iterate through all files in the target directory
for file in "$TARGET_DIR"/*; do
    if [ -f "$file" ]; then
        # Generate a cleaned-up name: replace spaces with underscores and remove special characters
        clean_name=$(echo "$(basename "$file")" | tr ' ' '_' | tr -cd '[:alnum:]_.')
        
        # Rename the file if the name has changed
        if [ "$(basename "$file")" != "$clean_name" ]; then
            mv "$file" "$TARGET_DIR/$clean_name"
            echo "Renamed: $(basename "$file") -> $clean_name"
        fi
    fi
done

echo "File name cleanup complete."

