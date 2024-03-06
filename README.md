# Backup Script

## Overview

This is a bash script designed to automate the backup of important files and directories. It provides options for specifying backup destinations, scheduling backups, and handling error conditions.

## Features

- **Backup Types**: Supports full and incremental backups.
- **Customizable**: Allows users to specify the source directory, destination directory, and backup type.
- **Error Handling**: Handles errors gracefully and provides informative messages.
- **Simple Usage**: Easy-to-use command-line interface with options for specifying backup parameters.

## Prerequisites

- **Bash**: The script is written in bash and requires a bash-compatible shell environment.
- **tar**: The script uses the `tar` command for creating compressed archive files.
- **Realpath**: The script uses the `realpath` command for resolving the absolute path of the source directory.

## Usage

- Replace `/path/to/backup/directory` with the desired backup destination directory, and `/path/to/source/directory` with the directory you want to back up. Optionally, you can specify -t incremental for incremental backups.


### Options:

- `-d <destination_directory>`: Specify the backup destination directory (default: ~/backups).
- `-t <backup_type>`: Specify the type of backup (full or incremental).

### Example:

To perform a full backup of the `/home/user/documents` directory and store it in `/backup`, run:

`./backup.sh -d /backup -t full /home/user/documents`
