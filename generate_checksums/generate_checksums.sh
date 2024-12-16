#!/bin/bash
# Ronald Baker

# Generate checksums for all files in a directory

DIR=${1:-.} # Default to current directory
OUTPUT_FILE="checksums.txt"

echo "Generating checksums for files in $DIR..."
find "$DIR" -type f -exec md5sum {} \; > "$OUTPUT_FILE"
echo "Checksums saved to $OUTPUT_FILE"

