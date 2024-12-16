#!/bin/bash
# Ronald Baker

# Directory to back up (edit this path as needed)
SOURCE_DIR="$HOME/my_project"

# Backup destination
BACKUP_DIR="$HOME/backups"

# Timestamp for the backup
TIMESTAMP=$(date "+%Y%m%d_%H%M%S")

# Backup file name
BACKUP_FILE="$BACKUP_DIR/backup_$(basename "$SOURCE_DIR")_$TIMESTAMP.tar.gz"

# Ensure the backup directory exists
mkdir -p "$BACKUP_DIR"

# Create the backup
echo "Backing up $SOURCE_DIR to $BACKUP_FILE..."
tar -czvf "$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

# Confirm success
if [ $? -eq 0 ]; then
    echo "Backup successful!"
else
    echo "Backup failed!"
fi

