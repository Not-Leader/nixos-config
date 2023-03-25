#!/bin/sh
MENU='fuzzel -d -p "screenshot "'
alias menu=$MENU
grimshot $(printf "copy\nsave\n" | menu ) \
         $(printf "active\nscreen\noutput\narea\nwindow\n" | menu; sleep 0.5s)
