#!/bin/bash
# Script to organize media files into separate folders for images, videos, and audio
# Developer: Ronald Baker

SOURCE_DIR=${1?"Usage: $0 <source_directory>"}

# Define target directories for media types
IMAGES_DIR="$SOURCE_DIR/images"
VIDEOS_DIR="$SOURCE_DIR/videos"
AUDIO_DIR="$SOURCE_DIR/audio"

# Create target directories if they don't exist
mkdir -p "$IMAGES_DIR" "$VIDEOS_DIR" "$AUDIO_DIR"

echo "Organizing media files in $SOURCE_DIR..."

# Move image files
find "$SOURCE_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.gif" \) -exec mv {} "$IMAGES_DIR" \;

# Move video files
find "$SOURCE_DIR" -type f \( -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.avi" -o -iname "*.mov" \) -exec mv {} "$VIDEOS_DIR" \;

# Move audio files
find "$SOURCE_DIR" -type f \( -iname "*.mp3" -o -iname "*.wav" -o -iname "*.flac" -o -iname "*.aac" \) -exec mv {} "$AUDIO_DIR" \;

echo "Media files have been organized into 'images/', 'videos/', and 'audio/' folders."

