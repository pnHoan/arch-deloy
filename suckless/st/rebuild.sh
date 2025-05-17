#!/bin/bash

# Backup and rebuild st terminal config script

# Define directories and files
ST_DIR="$HOME/.config/suckless/st"  # Default st directory, adjust if yours is different
CONFIG_FILE="$ST_DIR/config.h"
BACKUP_DIR="$ST_DIR/backup"
DATE=$(date +%Y%m%d_%H%M%S)

# Check if st directory exists
if [ ! -d "$ST_DIR" ]; then
    echo "Error: st directory not found at $ST_DIR"
    echo "Please adjust ST_DIR in the script to your st installation path"
    exit 1
fi

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Check if config.h exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: config.h not found in $ST_DIR"
    exit 1
fi

# Backup current config
echo "Backing up current config.h..."
cp "$CONFIG_FILE" "$BACKUP_DIR/config.h.$DATE"
if [ $? -eq 0 ]; then
    echo "Backup created: $BACKUP_DIR/config.h.$DATE"
else
    echo "Error: Backup failed"
    exit 1
fi

# Remove write protection and delete original config.h
echo "Removing original config.h..."
chmod u+w "$CONFIG_FILE"  # Remove write protection if present
rm -f "$CONFIG_FILE"      # Remove the file without confirmation
if [ $? -eq 0 ]; then
    echo "Original config.h removed successfully"
else
    echo "Error: Failed to remove original config.h"
    exit 1
fi

# Rebuild st
echo "Rebuilding st terminal..."
cd "$ST_DIR" || exit 1

# Clean previous build
sudo make clean
if [ $? -ne 0 ]; then
    echo "Error: Make clean failed"
    exit 1
fi

# Build and install
sudo make install
if [ $? -eq 0 ]; then
    echo "st terminal successfully rebuilt and installed"
else
    echo "Error: Build failed"
    echo "Check your config.h for errors and ensure dependencies are installed"
    echo "You may need: base-devel, libx11, libxft"
    exit 1
fi

echo "Done! Previous config backed up and new build installed."
