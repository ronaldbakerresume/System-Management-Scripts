#!/bin/bash
# Script to perform incremental backups using rsync
# Developer: Ronald Baker

SOURCE_DIR=${1?"Usage: $0 <source_directory> <backup_directory>"}
BACKUP_DIR=${2?"Usage: $0 <source_directory> <backup_directory>"}

DATE=$(date "+%Y-%m-%d_%H-%M-%S")
SNAPSHOT_DIR="$BACKUP_DIR/snapshot_$DATE"

echo "Performing incremental backup from $SOURCE_DIR to $SNAPSHOT_DIR..."

# Perform the incremental backup with rsync
rsync -a --link-dest="$BACKUP_DIR/latest" "$SOURCE_DIR"/ "$SNAPSHOT_DIR"/

if [ $? -eq 0 ]; then
    echo "Backup complete. Snapshot saved in $SNAPSHOT_DIR."
    # Update the "latest" symlink to point to the current snapshot
    ln -sfn "$SNAPSHOT_DIR" "$BACKUP_DIR/latest"
else
    echo "An error occurred during the backup."
fi

