#!/bin/bash
# Script to sort files by size into subdirectories (small, medium, large)
# Developer: Ronald Baker

TARGET_DIR=${1?"Usage: $0 <target_directory>"}

# Define size thresholds (in kilobytes)
SMALL_THRESHOLD=100   # Files <= 100 KB
MEDIUM_THRESHOLD=1000 # Files > 100 KB and <= 1000 KB

# Create directories for sorted files
SMALL_DIR="$TARGET_DIR/small_files"
MEDIUM_DIR="$TARGET_DIR/medium_files"
LARGE_DIR="$TARGET_DIR/large_files"

mkdir -p "$SMALL_DIR" "$MEDIUM_DIR" "$LARGE_DIR"

echo "Sorting files in $TARGET_DIR by size..."

# Iterate through all files in the target directory
for file in "$TARGET_DIR"/*; do
    if [ -f "$file" ]; then
        # Get file size in kilobytes
        size_kb=$(du -k "$file" | cut -f1)

        # Sort files based on size
        if [ "$size_kb" -le "$SMALL_THRESHOLD" ]; then
            mv "$file" "$SMALL_DIR/"
            echo "Moved $file to $SMALL_DIR/"
        elif [ "$size_kb" -le "$MEDIUM_THRESHOLD" ]; then
            mv "$file" "$MEDIUM_DIR/"
            echo "Moved $file to $MEDIUM_DIR/"
        else
            mv "$file" "$LARGE_DIR/"
            echo "Moved $file to $LARGE_DIR/"
        fi
    fi
done

echo "File sorting by size complete."

