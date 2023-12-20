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
    #ssh rich@piehole
    bash $HOME/bin/pieMusic > /dev/null 2>&1
    echo -n "Press enter to continue ... "
    read response

    return 1
}
actionB() {
    #ssh rich@piehole
    bash $HOME/bin/pieMusic2 > /dev/null 2>&1
    echo -n "Press enter to continue ... "
    read response

    return 1
}

actionC() {
    curl wttr.in

    echo -n "Press enter to continue ... "
    read response

    return 1
}
actionD() {
    btop

    echo -n "Press enter to continue ... "
    read response

    return 1
}
actionE() {
    kdiskmark

    echo -n "Press enter to continue ... "
    read response

    return 1
}
actionF() {
    $HOME/bin/detox.sh

    echo -n "Press enter to continue ... "
    read response

    return 1
}
actionG() {
youtube-dl --list-extractors
    echo -n "Press enter to continue ... "
    read response

    return 1
}
actionH() {
youtubedl-gui
    echo -n "Press enter to continue ... "
    read response

    return 1

}
actionJ() {

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
    "1. piehole - hifi streamer via Moode Audio"
    "2. piMood  - hifi streamer via Moode Audio"
    "3. Get the local weather forcast for the next 3 days"
    "4. Display System Stats via Btop - the ultimate top!"
    "5. Benchmark Hard dirve via kdiskmark aka crystal disk info"
    "6. Remove white spaces and sepcial characters from filenames"
    "7. List sites including soundclourd to rip hi quality video and audio"
    "8. Youtube Downloader - copy the link from the above and fire away!"
    "9. DroidcamX - use your phone as wifi camera!"
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
    actionJ
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
