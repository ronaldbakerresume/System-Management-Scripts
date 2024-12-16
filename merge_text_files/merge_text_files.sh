#!/bin/bash
# Script to merge all .txt files in a directory into a single file
# Developer: Ronald Baker

SOURCE_DIR=${1?"Usage: $0 <source_directory> <output_file>"}
OUTPUT_FILE=${2?"Usage: $0 <source_directory> <output_file>"}

echo "Merging all .txt files from $SOURCE_DIR into $OUTPUT_FILE..."

# Clear the output file if it exists
> "$OUTPUT_FILE"

# Iterate through all .txt files and append their content to the output file
for file in "$SOURCE_DIR"/*.txt; do
    if [ -f "$file" ]; then
        echo "Adding content from $file to $OUTPUT_FILE..."
        echo "===== Start of $file =====" >> "$OUTPUT_FILE"
        cat "$file" >> "$OUTPUT_FILE"
        echo "===== End of $file =====" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE" # Add a blank line between files
    fi
done

echo "Merging complete. Merged content saved to $OUTPUT_FILE."

