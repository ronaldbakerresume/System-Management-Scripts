#!/bin/bash
# Script to compress old backups and delete original files
# Developer: Ronald Baker

BACKUP_DIR=${1:-"backups"}  # Directory containing backup files
DAYS=${2:-30}              # Files older than this many days will be compressed
COMPRESSED_DIR="compressed_backups"

# Create directory for compressed backups if it doesn't exist
mkdir -p "$COMPRESSED_DIR"

echo "Compressing backup files in $BACKUP_DIR older than $DAYS days..."

# Find and compress old backup files
find "$BACKUP_DIR" -type f -mtime +$DAYS | while read -r file; do
    compressed_file="$COMPRESSED_DIR/$(basename "$file").gz"
    echo "Compressing $file to $compressed_file..."
    gzip -c "$file" > "$compressed_file"
    if [ $? -eq 0 ]; then
        echo "Compression successful. Deleting original file: $file"
        rm -f "$file"
    else
        echo "Failed to compress $file"
    fi
done

echo "Compression and cleanup complete. Compressed files are in $COMPRESSED_DIR."

