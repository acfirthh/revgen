#!/usr/bin/env bash

# Define the script name and target location
SCRIPT_NAME="revgen"
TARGET_DIR="/usr/local/bin"

# Check if Python3 is installed
if ! command -v python3 &> /dev/null; then
    printf "\n[!] Error: Python3 is not installed.\n    Install Python3 using your favourite package manager and then run the installation script again.\n"
    exit 1
fi

# Check if the script is being run as root
if [[ $EUID -ne 0 ]]; then
    printf "[info] This script is NOT being run as root.\n\n"
else
    printf "[info] This script IS being run as root.\n\n"
fi


# Check if the script exists in the current directory
if [[ ! -f ./$SCRIPT_NAME ]]; then
    printf "\n[!] Error: $SCRIPT_NAME not found in the current directory.\n"
    exit 1
fi

# Check if the target already has a file with the same name
if [[ -f $TARGET_DIR/$SCRIPT_NAME ]]; then
    echo
    # If a file with the same name exists in the target directory, ask if the user wants to overwrite it
    read -p "$TARGET_DIR/$SCRIPT_NAME already exists. Overwrite? (y/n): " overwrite
    if [[ ! "$overwrite" =~ ^[yY]$ ]]; then
        printf "\n[!] Installation stopped.\n"
        exit 0
    fi
fi

# Move the script to the target directory
mv ./$SCRIPT_NAME $TARGET_DIR

# Check if the move was successful
if [[ $? -ne 0 ]]; then
    printf "\n[!] Error: Failed to move $SCRIPT_NAME to $TARGET_DIR. Make sure you have the necessary permissions.\n    Consider running the script using 'sudo'.\n"
    exit 1
fi

# Make the script executable
chmod +x $TARGET_DIR/$SCRIPT_NAME

# Check if chmod was successful
if [[ $? -ne 0 ]]; then
    printf "\n[!] Error: Failed to make $SCRIPT_NAME executable.\n"
    exit 1
fi

echo "$SCRIPT_NAME has been successfully installed to $TARGET_DIR."
