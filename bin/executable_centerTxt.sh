#!/bin/bash

# Read in the text file
text=$(cat "$1")

# Get the terminal width
termwidth=$(tput cols)

# Loop through each line in the text
while IFS= read -r line; do
    # Calculate the padding on each side of the line
    padding=$(( ($termwidth - ${#line}) / 2 ))

    # Output the padding and the line
    printf "%*s%s%*s\n" $padding '' "$line" $padding ''
done <<< "$text"

