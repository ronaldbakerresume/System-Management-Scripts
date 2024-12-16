#!/bin/bash
# Script to create a daily backup folder and copy files into it
# Developer: Ronald Baker

SOURCE_DIR=${1?"Usage: $0 <source_directory>"}
BACKUP_ROOT=${2:-"$HOME/daily_backups"}  # Default backup root directory
DATE=$(date "+%Y-%m-%d")                # Current date
BACKUP_DIR="$BACKUP_ROOT/$DATE"

# Create the backup folder for today's date
mkdir -p "$BACKUP_DIR"

echo "Backing up files from $SOURCE_DIR to $BACKUP_DIR..."

# Copy files to the daily backup folder
cp -r "$SOURCE_DIR"/* "$BACKUP_DIR"/

if [ $? -eq 0 ]; then
    echo "Backup complete. Files are saved in $BACKUP_DIR."
else
    echo "An error occurred during the backup."
fi

