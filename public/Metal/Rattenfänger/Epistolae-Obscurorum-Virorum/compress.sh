#!/bin/bash

# Target bitrate for compression
BITRATE=128

# Create a directory to store compressed files
OUTPUT_DIR="compressed_mp3s"
mkdir -p "$OUTPUT_DIR"

# Process each MP3 file in the current directory
for file in *.mp3; do
  # Skip if no MP3 files are found
  if [ ! -e "$file" ]; then
    echo "No MP3 files found in the current directory."
    exit 1
  fi

  # Extract filename without extension
  filename=$(basename "$file" .mp3)

  # Compress the file and save it in the output directory
  echo "Compressing $file..."
  lame -b "$BITRATE" "$file" "$OUTPUT_DIR/${filename}_compressed.mp3"
done

echo "Compression complete. Compressed files are in the '$OUTPUT_DIR' directory."
