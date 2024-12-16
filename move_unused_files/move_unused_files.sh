#!/bin/bash
# Script to move files not accessed in the last X days to an archive directory
# Developer: Ronald Baker

SOURCE_DIR=${1?"Usage: $0 <source_directory> <days> <archive_directory>"}
DAYS=${2?"Usage: $0 <source_directory> <days> <archive_directory>"}
ARCHIVE_DIR=${3?"Usage: $0 <source_directory> <days> <archive_directory>"}

# Create the archive directory if it doesn't exist
mkdir -p "$ARCHIVE_DIR"

echo "Moving files not accessed in the last $DAYS days from $SOURCE_DIR to $ARCHIVE_DIR..."

# Find and move files
find "$SOURCE_DIR" -type f -atime +$DAYS -exec mv {} "$ARCHIVE_DIR" \;

if [ $? -eq 0 ]; then
    echo "Files successfully moved to $ARCHIVE_DIR."
else
    echo "An error occurred while moving files."
fi

