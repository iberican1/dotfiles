#!/bin/bash

items=("Item 1" "Item 2" "Item 3")

while item=$(zenity --title="$title" --text="$prompt" --list \
               --column="Options" "${items[@]}")
do
    case "$item" in
        "${items[0]}") echo "Selected $item, item #1";;
        "${items[1]}") echo "Selected $item, item #2";;
        "${items[2]}") echo "Selected $item, item #3";;
        *) echo "Ooops! Invalid option.";;
    esac
done
