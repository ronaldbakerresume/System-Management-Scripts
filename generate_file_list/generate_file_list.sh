#!/bin/bash
# Ronald Baker

# Generate a detailed list of files in a directory, including metadata

DIR=${1:-.} # Default to current directory
OUTPUT_FILE="file_list_with_metadata.txt"

echo "Generating file list for directory: $DIR"
echo "File List with Metadata:" > "$OUTPUT_FILE"
echo "------------------------------------------" >> "$OUTPUT_FILE"

# Iterate through files and capture metadata
find "$DIR" -type f | while read -r file; do
    echo "File: $file" >> "$OUTPUT_FILE"
    echo "Size: $(stat -c%s "$file") bytes" >> "$OUTPUT_FILE"
    echo "Owner: $(stat -c%U "$file")" >> "$OUTPUT_FILE"
    echo "Permissions: $(stat -c%A "$file")" >> "$OUTPUT_FILE"
    echo "Last Modified: $(stat -c%y "$file")" >> "$OUTPUT_FILE"
    echo "------------------------------------------" >> "$OUTPUT_FILE"
done

echo "File list saved to $OUTPUT_FILE"

