#!/bin/bash -u
urxvt -title "Openbox keybinds - Close with Return"\
 -g "$(cat "$HOME"/.config/wayfire.ini)" \
 -e sh -c 'cat "$HOME/.config/wayfire.ini"; read -s' &
