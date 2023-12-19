#!/bin/bash
clear
def='\e[1m'
bg='\e[97m\e[41m'
printf "$bg%*s$def\n" $COLUMNS
printf "$bg%-${COLUMNS}s$def\n" "    B A L L Z o u t"
printf "$bg%*s$def\n\n" $COLUMNS
