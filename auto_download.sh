#!/bin/bash
DOWNLOAD_URL="$1"                 
DEST_DIR="$HOME/downloads_auto"   

if [ -z "$DOWNLOAD_URL" ]; then
    echo "Usage: ./auto_download.sh <download_url>"
    exit 1
fi

mkdir -p "$DEST_DIR"

FILE_NAME=$(basename "$DOWNLOAD_URL")

if command -v wget >/dev/null 2>&1; then
    echo "Downloading with wget..."
    wget -O "$DEST_DIR/$FILE_NAME" "$DOWNLOAD_URL"
elif command -v curl >/dev/null 2>&1; then
    echo "wget not found. Using curl..."
    curl -o "$DEST_DIR/$FILE_NAME" "$DOWNLOAD_URL"
else
    echo "Error: Neither wget nor curl is installed."
    exit 1
fi

echo "Download completed! Saved to: $DEST_DIR/$FILE_NAME"
