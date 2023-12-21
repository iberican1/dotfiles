#!/bin/bash

# Check if alacritty is installed
if ! command -v alacritty &> /dev/null; then
    echo "Error: Alacritty is not installed. Please install it first."
    exit 1
fi

# Check if a file path is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <path_to_text_file>"
    exit 1
fi

# Check if the provided file exists
if [ ! -f "$1" ]; then
    echo "Error: File not found: $1"
    exit 1
fi

# Open Alacritty with the text file
alacritty --config-file $HOME/.config/wayfire/alacritty/alacritty2.yml -e less "$1"
