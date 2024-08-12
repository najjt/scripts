#!/bin/sh

CURRENT_BR=

case $1 in
    +)
        brightnessctl s 10%+
        CURRENT_BR=$(brightnessctl i | grep -Eo '[0-9]{1,3}%')
    ;;
    -)
        brightnessctl s 10%-
        CURRENT_BR=$(brightnessctl i | grep -Eo '[0-9]{1,3}%')
    ;;
    *) exit;;

esac

notify-send -t 1000 " Brightness: $CURRENT_BR"
