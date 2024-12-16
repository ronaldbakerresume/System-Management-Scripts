#!/bin/bash
# Script to find and delete duplicate files in a directory
# Developer: Ronald Baker

TARGET_DIR=${1?"Usage: $0 <target_directory>"}
TEMP_FILE=$(mktemp) # Temporary file for storing checksums

echo "Scanning $TARGET_DIR for duplicate files..."

# Generate checksums for all files and store them in the temporary file
find "$TARGET_DIR" -type f -exec md5sum {} \; > "$TEMP_FILE"

# Identify duplicate checksums
DUPLICATES=$(awk '{print $1}' "$TEMP_FILE" | sort | uniq -d)

# Delete duplicate files
for checksum in $DUPLICATES; do
    FILES=($(grep "$checksum" "$TEMP_FILE" | awk '{print $2}'))
    echo "Duplicate files detected: ${FILES[@]}"
    for ((i = 1; i < ${#FILES[@]}; i++)); do
        echo "Deleting duplicate file: ${FILES[i]}"
        rm -f "${FILES[i]}"
    done
done

# Clean up
rm -f "$TEMP_FILE"

echo "Duplicate file removal complete."

