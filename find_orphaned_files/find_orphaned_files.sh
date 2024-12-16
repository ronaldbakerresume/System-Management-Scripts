#!/bin/bash
# Script to find orphaned files (e.g., files without matching metadata)
# Developer: Ronald Baker

SOURCE_DIR=${1?"Usage: $0 <source_directory> <related_extension>"}
RELATED_EXTENSION=${2?"Usage: $0 <source_directory> <related_extension>"}

echo "Finding orphaned files in $SOURCE_DIR that lack corresponding .$RELATED_EXTENSION files..."

# Iterate over all files and check for related files
for file in "$SOURCE_DIR"/*; do
    if [ -f "$file" ]; then
        # Remove extension to find base file name
        base_name="${file%.*}"
        # Check if the related file exists
        if [ ! -f "$base_name.$RELATED_EXTENSION" ]; then
            echo "Orphaned file: $file"
        fi
    fi
done

