#!/bin/bash

# Function to list files in a directory
list_files() {
    echo "Listing files in the directory:"
    ls -p | grep -v /  # Exclude directories from the listing
}

# Function to run detox on files to remove white spaces
run_detox() {
    echo "Running detox to remove white spaces from files..."
    detox *
}

# Function to list files after detox
list_files_after_detox() {
    echo "Listing files after running detox:"
    ls -p | grep -v /
}

# Main script

# Check if detox is installed
if ! command -v detox &> /dev/null; then
    echo "Detox is not installed. Please install it before running this script."
    exit 1
fi

# Prompt user for the directory path
read -p "Enter the directory path to clean up: " dir_path

# Navigate to the specified directory
cd "$dir_path" || exit 1

# List files before detox
list_files

# Prompt user to confirm running detox
read -p "Do you want to remove white spaces from files? (y/n): " choice

if [[ $choice == "y" || $choice == "Y" ]]; then
    run_detox
    list_files_after_detox
    echo "Detox completed."
else
    echo "Detox cancelled."
fi

