#!/bin/bash
# Script to generate a detailed report of all files and subdirectories
# Developer: Ronald Baker

TARGET_DIR=${1?"Usage: $0 <target_directory>"}
OUTPUT_FILE=${2:-"directory_report.txt"} # Default output file name

echo "Generating report for $TARGET_DIR..."
echo "Report saved to $OUTPUT_FILE"

# Write the report header
echo "Directory Report for $TARGET_DIR" > "$OUTPUT_FILE"
echo "Generated on: $(date)" >> "$OUTPUT_FILE"
echo "-------------------------------------" >> "$OUTPUT_FILE"

# Iterate through files and directories
find "$TARGET_DIR" -print | while read -r item; do
    if [ -d "$item" ]; then
        echo "Directory: $item" >> "$OUTPUT_FILE"
    elif [ -f "$item" ]; then
        size=$(stat -c%s "$item")
        mod_time=$(stat -c%y "$item")
        echo "File: $item | Size: $size bytes | Last Modified: $mod_time" >> "$OUTPUT_FILE"
    fi
done

echo "Directory report generation complete!"

