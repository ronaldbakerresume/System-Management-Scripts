#!/bin/bash
# Ronald Baker

# Organize files by their extensions
for file in *; do
    if [ -f "$file" ]; then
        # Extract file extension
        extension="${file##*.}"

        # Create a directory for the extension if it doesn't exist
        mkdir -p "$extension"

        # Move the file into the respective folder
        mv "$file" "$extension/"
        echo "Moved $file to $extension/"
    fi
done

echo "Files have been organized by their extensions!"
