#!/bin/bash
# Script to extract compressed files and move their contents to a specified directory
# Developer: Ronald Baker

SOURCE_DIR=${1?"Usage: $0 <source_directory> <destination_directory>"}
DEST_DIR=${2?"Usage: $0 <source_directory> <destination_directory>"}

# Create the destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

echo "Extracting and moving files from $SOURCE_DIR to $DEST_DIR..."

# Iterate over compressed files and extract them
for file in "$SOURCE_DIR"/*; do
    if [[ "$file" == *.tar.gz ]]; then
        echo "Extracting $file..."
        tar -xzf "$file" -C "$DEST_DIR"
    elif [[ "$file" == *.zip ]]; then
        echo "Extracting $file..."
        unzip -q "$file" -d "$DEST_DIR"
    elif [[ "$file" == *.rar ]]; then
        echo "Extracting $file..."
        unrar x "$file" "$DEST_DIR"
    fi
done

echo "Extraction and file movement complete."

