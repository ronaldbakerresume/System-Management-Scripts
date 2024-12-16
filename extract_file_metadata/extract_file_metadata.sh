#!/bin/bash
# Extract metadata from files in a directory (e.g., images or audio)

DIR=${1:-.} # Default to current directory
OUTPUT_FILE="file_metadata.txt"

echo "Extracting metadata for files in $DIR..."
> "$OUTPUT_FILE" # Clear the output file

for file in "$DIR"/*; do
    if [ -f "$file" ]; then
        echo "Metadata for $file:" >> "$OUTPUT_FILE"
        file "$file" >> "$OUTPUT_FILE" 2>&1
        echo "---------------------------------" >> "$OUTPUT_FILE"
    fi
done

echo "Metadata saved to $OUTPUT_FILE"

