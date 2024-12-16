#!/bin/bash
# Script to add a prefix or suffix to all file names in a directory
# Developer: Ronald Baker

TARGET_DIR=${1?"Usage: $0 <target_directory> <prefix> <suffix>"}
PREFIX=${2:-""}  # Optional prefix (default is no prefix)
SUFFIX=${3:-""}  # Optional suffix (default is no suffix)

echo "Adding prefix '$PREFIX' and suffix '$SUFFIX' to files in $TARGET_DIR..."

# Iterate through all files in the target directory
for file in "$TARGET_DIR"/*; do
    if [ -f "$file" ]; then
        # Extract the base name and extension
        base_name=$(basename "$file")
        extension="${base_name##*.}"
        base_name="${base_name%.*}"
        
        # Generate the new file name with prefix and suffix
        new_name="$TARGET_DIR/${PREFIX}${base_name}${SUFFIX}.$extension"
        
        # Rename the file
        echo "Renaming: $file -> $new_name"
        mv "$file" "$new_name"
    fi
done

echo "File renaming with prefix and suffix complete."

