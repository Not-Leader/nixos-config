#!/bin/sh
MENU="fuzzel -dp 'screenshot '"
grimshot $(printf "copy\nsave\n" | $MENU ) $(printf "active\nscreen\noutput\narea\nwindow\n" | $MENU; sleep 0.5s)
