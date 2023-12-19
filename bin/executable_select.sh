#!/bin/bash

open_new_terminal() {
    local command="$1"
    alacritty -e zsh -c "$command; read -p 'Press Enter to continue...'; exec zsh" &
}


# Function to print a bordered box with centered text
print_bordered_box() {
    local text="$1"
    local width=$(tput cols)
    local height=5

    local border_char="="
    local padding_char=" "
    local text_padding=$(( (width - ${#text}) / 2 ))

    clear
    printf "%*s\n" "$width" | tr " " "$border_char"
    printf "%*s%s%*s\n" "$text_padding" "$padding_char" "$text" "$text_padding" "$padding_char"
    printf "%*s\n" "$width" | tr " " "$border_char"
}

# Function to print text in yellow
print_yellow_text() {
    echo -e "\e[1;33m$1\e[0m"
}

# Function to print text in red
print_red_text() {
    echo -e "\e[1;31m$1\e[0m"
}

# List of choices
choices=("Option 1" "Option 2" "Run btop" "Quit")

# Main loop
while true; do
    print_bordered_box "$(print_yellow_text "Choose an option:")"
    
    for ((i = 0; i < ${#choices[@]}; i++)); do
        echo " $((i+1)). ${choices[i]}"
    done
    
    read -p "$(print_yellow_text "Enter your choice: ")" choice

    case $choice in
        1) print_red_text "You chose Option 1";;
        2) print_red_text "You chose Option 2";;
        3) open_new_terminal "btop";;
        4) print_red_text "Goodbye!"; break;;
        *) print_red_text "Invalid choice";;
    esac

    read -p "Press Enter to continue..."
done

