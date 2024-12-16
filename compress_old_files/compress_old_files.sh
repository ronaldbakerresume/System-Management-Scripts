#!/bin/bash
# Ronald Baker

# Number of days threshold
DAYS=7

# Name of the archive
ARCHIVE_NAME="old_files_$(date +%Y%m%d).tar.gz"

echo "Finding files older than $DAYS days..."

# Find files older than the specified number of days and compress them
find . -type f -mtime +$DAYS -print | tar -czvf "$ARCHIVE_NAME" -T -

echo "Files older than $DAYS days have been compressed into $ARCHIVE_NAME!"

