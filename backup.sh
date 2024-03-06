#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: $0 [options] source_directory"
    echo "Options:"
    echo "  -d <destination_directory>: Specify the backup destination directory (default: ~/backups)"
    echo "  -t <backup_type>: Specify the type of backup (e.g., full, incremental)"
    exit 1
}

# Default backup destination directory
DESTINATION_DIR="$HOME/backups"

# Default backup type
BACKUP_TYPE="full"

# Parse command-line options
while getopts ":d:t:" opt; do
    case $opt in
        d)
            DESTINATION_DIR="$OPTARG"
            ;;
        t)
            BACKUP_TYPE="$OPTARG"
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            usage
            ;;
    esac
done
shift $((OPTIND - 1))

# Validate source directory
if [ -z "$1" ] || [ ! -d "$1" ]; then
    echo "Error: Source directory not specified or does not exist" >&2
    usage
fi

# Get the absolute path of the source directory
SOURCE_DIR=$(realpath "$1")

# Create the backup directory if it doesn't exist
if [ ! -d "$DESTINATION_DIR" ]; then
    mkdir -p "$DESTINATION_DIR"
fi

# Construct the backup file name
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$DESTINATION_DIR/backup_$DATE.tar.gz"

# Perform the backup based on the specified type
if [ "$BACKUP_TYPE" == "full" ]; then
    tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"
elif [ "$BACKUP_TYPE" == "incremental" ]; then
    echo "Incremental backups not implemented yet"
    exit 1
else
    echo "Error: Invalid backup type specified" >&2
    usage
fi

# Check if the backup operation was successful
if [ $? -eq 0 ]; then
    echo "Backup completed successfully: $BACKUP_FILE"
else
    echo "Error: Backup failed" >&2
    exit 1
fi

