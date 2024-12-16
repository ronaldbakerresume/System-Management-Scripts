#!/bin/bash
# Script to rename files based on their modification date
# Developer: Ronald Baker

TARGET_DIR=${1?"Usage: $0 <target_directory>"}

echo "Renaming files in $TARGET_DIR based on their modification date..."

# Iterate through all files in the target directory
for file in "$TARGET_DIR"/*; do
    if [ -f "$file" ]; then
        # Get the modification date in YYYY-MM-DD format
        mod_date=$(date -r "$file" "+%Y-%m-%d")
        # Get the base name and extension
        base_name=$(basename "$file")
        extension="${base_name##*.}"
        # Generate the new name
        new_name="$TARGET_DIR/$mod_date.$extension"
        
        # Rename the file
        echo "Renaming: $file -> $new_name"
        mv "$file" "$new_name"
    fi
done

echo "File renaming based on modification date complete."

