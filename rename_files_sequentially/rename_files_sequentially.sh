#!/bin/bash
# Script to rename all files in a directory to sequential numbers
# Developer: Ronald Baker

TARGET_DIR=${1?"Usage: $0 <target_directory>"}
PREFIX=${2:-"file"}  # Optional prefix for the renamed files
START_INDEX=${3:-1}  # Starting number for the sequence

echo "Renaming files in $TARGET_DIR to sequential numbers with prefix '$PREFIX'..."

# Initialize the counter
counter=$START_INDEX

# Iterate through all files in the target directory
for file in "$TARGET_DIR"/*; do
    if [ -f "$file" ]; then
        # Get the file extension
        extension="${file##*.}"
        
        # Generate the new file name
        new_name="$TARGET_DIR/${PREFIX}_${counter}.$extension"
        
        # Rename the file
        echo "Renaming: $file -> $new_name"
        mv "$file" "$new_name"
        
        # Increment the counter
        ((counter++))
    fi
done

echo "File renaming to sequential numbers complete."

