#!/bin/bash

# while-menu-dialog: a menu driven system information program

DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0

display_result() {
  dialog --title "$1" \
    --no-collapse \
    --msgbox "$result" 0 0
}

while true; do
  exec 3>&1
  selection=$(dialog \
    --backtitle "System Information" \
    --title "Menu" \
    --clear \
    --cancel-label "Exit" \
    --menu "Please select:" $HEIGHT $WIDTH 4 \
    "1" "PieHole - USB DAC Streamer" \
    "2" "PiMood - i2C DAC Streamer" \
    "3" "Latest weather Report" \
    "4" "Display Home Space Utilization" \
    "5" "Display Home Space Utilization" \
    "6" "Display Home Space Utilization" \
    2>&1 1>&3)
  exit_status=$?
  exec 3>&-
  case $exit_status in
    $DIALOG_CANCEL)
      clear
      echo "Program terminated."
      exit
      ;;
    $DIALOG_ESC)
      clear
      echo "Program aborted." >&2
      exit 1
      ;;
  esac
  case $selection in
    1 )
        result=$(bash $HOME/bin/pieMusic > /dev/null 2>&1)

      display_result "PieHole"
      ;;
    2 )
        result=$(curl wttr.in > /dev/null 2>&1)

      display_result "Local Weather"
      ;;
    3 )
        result=$(bash $HOME/bin/pieMusic > /dev/null 2>&1)

      display_result "PieHole"
      ;;
    4 )
        result=$(bash $HOME/bin/pieMusic > /dev/null 2>&1)

      display_result "PieHole"
      ;;
    5 )
      result=$(df -h)
      display_result "Disk Space"
      ;;
  esac
done
