#!/bin/bash
# Script to backup specific file types from a directory
# Developer: Ronald Baker

SOURCE_DIR=${1?"Usage: $0 <source_directory> <file_extension> <backup_directory>"}
EXTENSION=${2?"Usage: $0 <source_directory> <file_extension> <backup_directory>"}
BACKUP_DIR=${3?"Usage: $0 <source_directory> <file_extension> <backup_directory>"}

# Ensure the backup directory exists
mkdir -p "$BACKUP_DIR"

echo "Backing up all *.$EXTENSION files from $SOURCE_DIR to $BACKUP_DIR..."

# Find and copy files with the specified extension
find "$SOURCE_DIR" -type f -name "*.$EXTENSION" -exec cp {} "$BACKUP_DIR" \;

if [ $? -eq 0 ]; then
    echo "Backup complete. Files are saved in $BACKUP_DIR."
else
    echo "An error occurred during the backup."
fi

