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
    ssh rich@piehole

    echo -n "Press enter to continue ... "
    read response

    return 1
}

actionB() {
    curl wttr.in

    echo -n "Press enter to continue ... "
    read response

    return 1
}
actionC() {
    btop

    echo -n "Press enter to continue ... "
    read response

    return 1
}
actionD() {
    kdiskmark

    echo -n "Press enter to continue ... "
    read response

    return 1
}
actionE() {
    /home/rich/bin/detox.sh

    echo -n "Press enter to continue ... "
    read response

    return 1
}
actionF() {
youtube-dl --list-extractors
    echo -n "Press enter to continue ... "
    read response

    return 1
}
actionG() {
youtubedl-gui
    echo -n "Press enter to continue ... "
    read response

    return 1

}
actionH() {

    google-chrome-stable http://192.168.2.35:4747/
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
    "1. Log in to piehole - hifi streamer via Moode Audio"
    "2. Get the local weather forcast for the next 3 days"
    "3. Display System Stats via Btop - the ultimate top!"
    "4. Benchmark Hard dirve via kdiskmark aka crystal disk info"
    "5. Remove white spaces and sepcial characters from filenames"
    "6. List sites including soundclourd to rip hi quality video and audio"
    "7. Youtube Downloader - copy the link from the above and fire away!"
    "8. DroidcamX - use your phone as wifi camera!"
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
menuTitle=" Richards Ultimate Super Menu"
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
