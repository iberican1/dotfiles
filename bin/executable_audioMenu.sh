#!/bin/bash

# Ensure we are running under bash
if [ "$BASH_SOURCE" = "" ]; then
    /bin/bash "$0"
    exit 0
fi

#
# Load bash-menu script
#
# NOTE: Ensure this is done before using
#       or overriding menu functions/variables.
#
. "bash-menu.sh"


################################
## Example Menu Actions
##
## They should return 1 to indicate that the menu
## should continue, or return 0 to signify the menu
## should exit.
################################
actionA() {
    terminator -l music

    echo -n "Press enter to continue ... "
    read response
    pkill terminator

    return 1
}

actionB() {
    terminator -l music

    echo -n "Press enter to continue ... "
    read response
    pkill terminator

    return 1
}
actionC() {
    alacritty --config-file=$HOME/.config/wayfire/alacritty/alacritty2.yml --working-directory $HOME/bin  --command ssh dietpi@dietpi -t sudo -H -u mpd alsamixer -D equal > /dev/null 2>&1

    echo -n "Press enter to continue ... "
    read response

    return 1
}
actionD() {
    alacritty --config-file=$HOME/.config/wayfire/alacritty/alacritty2.yml --working-directory $HOME/bin  --command ssh dietpi@dietpi -t sudo -H -u mpd alsamixer -D equal
pi@dietpi -t sudo -H -u mpd alsamixer -D equal

    echo -n "Press enter to continue ... "
    read response

    return 1
}
actionE() {
    alacritty --config-file=$HOME/.config/wayfire/alacritty/alacritty2.yml --working-directory $HOME/bin  --command ssh dietpi@dietpi -t sudo -H -u mpd alsamixer -D equal
pi@dietpi -t sudo -H -u mpd alsamixer -D equal

    echo -n "Press enter to continue ... "
    read response

    return 1
}
actionF() {
    echo MPC Commands PlaceHolder
    echo -n "Press enter to continue ... "
    read response

    return 1
}
actionG() {
    mpdnotify
    echo -n "Press enter to continue ... "
    read response

    return 1

}
actionH() {
    mpdnotify
    echo -n "Press enter to continue ... "
    read response

    return 1
}
actionX() {
    return 0
}


################################
## Setup Example Menu
################################

## Menu Item Text
##
## It makes sense to have "Exit" as the last item,
## as pressing Esc will jump to last item (and
## pressing Esc while on last item will perform the
## associated action).
##
## NOTE: If these are not all the same width
##       the menu highlight will look wonky
menuItems=(
    "1. MPD and Cava - Dietpi"
    "2. MPD and Cava - Localhost"
    "3. Alsmixer EQ - Dietpi"
    "4. Place Holder - Dietpi"
    "5. Place Holder - Dietpi"
    "6. MPC Commands"
    "7. Mpdnofify"
    "8. Mpdnofify"
    "Q. Exit Menu"

)
## Menu Item Actions
menuActions=(
    actionA
    actionB
    actionC
    actionD
    actionE
    actionF
    actionG
    actionH
    actionX
)

## Override some menu defaults
menuTitle="Audio Super Menu"
menuFooter=" Enter=Select, Navigate via Up/Down/First number/letter"
menuTop=15
menuWidth=90
menuLeft=35
menuMargin=25
menuHighlight=$DRAW_COL_YELLOW


################################
## Run Menu
################################
menuInit
menuLoop


exit 0
