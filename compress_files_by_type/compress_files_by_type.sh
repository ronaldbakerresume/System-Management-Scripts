#!/bin/bash
# Script to compress files of a specific type into an archive
# Developer: Ronald Baker

SOURCE_DIR=${1?"Usage: $0 <source_directory> <file_extension> <archive_name>"}
EXTENSION=${2?"Usage: $0 <source_directory> <file_extension> <archive_name>"}
ARCHIVE_NAME=${3?"Usage: $0 <source_directory> <file_extension> <archive_name>"}

echo "Compressing all *.$EXTENSION files in $SOURCE_DIR into $ARCHIVE_NAME..."

# Find and compress files with the specified extension
find "$SOURCE_DIR" -type f -name "*.$EXTENSION" -print | tar -czf "$ARCHIVE_NAME" -T -

if [ $? -eq 0 ]; then
    echo "Compression complete. Archive saved as $ARCHIVE_NAME."
else
    echo "An error occurred during compression."
fi

