#!/bin/bash
# Script to archive files older than a specified number of days
# Developer: Ronald Baker

SOURCE_DIR=${1?"Usage: $0 <source_directory> <days_old> <archive_name>"}
DAYS_OLD=${2?"Usage: $0 <source_directory> <days_old> <archive_name>"}
ARCHIVE_NAME=${3?"Usage: $0 <source_directory> <days_old> <archive_name>"}

echo "Archiving files older than $DAYS_OLD days from $SOURCE_DIR into $ARCHIVE_NAME..."

# Find and archive old files
find "$SOURCE_DIR" -type f -mtime +$DAYS_OLD -print | tar -czf "$ARCHIVE_NAME" -T -

if [ $? -eq 0 ]; then
    echo "Archiving complete. Archive saved as $ARCHIVE_NAME."
else
    echo "An error occurred during the archiving process."
fi

