#!/bin/bash
# Developer: Ronald Baker

# Script to organize files into folders based on their names (excluding extensions)
#
# Iterate over all files in the current directory
for file in *; do
    # Check if it's a regular file (not a directory or special file)
    if [ -f "$file" ]; then
        # Extract the file name without extension
        folder_name="${file%.*}"

        # Create the folder (if it doesn't already exist)
        mkdir -p "$folder_name"

        # Move the file into the newly created folder
        mv "$file" "$folder_name"

        # Optional: Print an update for each file processed
        echo "Moved '$file' to folder '$folder_name/'"
    fi
done

echo "All files have been organized into their respective folders!"

