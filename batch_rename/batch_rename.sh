#!/bin/bash
# Ronald Baker

# Add a prefix to all files in the current directory
PREFIX="myfile_"

# Loop through all files in the directory
for file in *; do
    if [ -f "$file" ]; then
        # Rename the file by adding the prefix
        mv "$file" "${PREFIX}${file}"
        echo "Renamed $file to ${PREFIX}${file}"
    fi
done

echo "Batch renaming complete!"
