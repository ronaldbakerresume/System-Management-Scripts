#!/bin/bash
# Script to split a large folder into smaller subdirectories
# Developer: Ronald Baker

SOURCE_DIR=${1?"Usage: $0 <source_directory> <files_per_folder>"}
FILES_PER_FOLDER=${2?"Usage: $0 <source_directory> <files_per_folder>"}

echo "Splitting $SOURCE_DIR into smaller subdirectories with $FILES_PER_FOLDER files each..."

# Initialize counters
folder_count=1
file_count=0

# Create the first subdirectory
current_folder="$SOURCE_DIR/split_folder_$folder_count"
mkdir -p "$current_folder"

# Iterate through files and move them to subdirectories
for file in "$SOURCE_DIR"/*; do
    if [ -f "$file" ]; then
        mv "$file" "$current_folder"
        ((file_count++))

        # Create a new folder after reaching the file limit
        if [ "$file_count" -ge "$FILES_PER_FOLDER" ]; then
            ((folder_count++))
            current_folder="$SOURCE_DIR/split_folder_$folder_count"
            mkdir -p "$current_folder"
            file_count=0
        fi
    fi
done

echo "Folder splitting complete. Created $folder_count subdirectories."

