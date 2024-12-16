#!/bin/bash
# Script to synchronize two directories using rsync
# Developer: Ronald Baker

SOURCE_DIR=${1?"Usage: $0 <source_directory> <destination_directory>"}
DEST_DIR=${2?"Usage: $0 <source_directory> <destination_directory>"}

echo "Synchronizing $SOURCE_DIR to $DEST_DIR..."

# Perform synchronization
rsync -av --delete "$SOURCE_DIR"/ "$DEST_DIR"/

if [ $? -eq 0 ]; then
    echo "Synchronization complete."
else
    echo "An error occurred during synchronization."
fi

