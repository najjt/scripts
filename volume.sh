#!/bin/sh

CURRENT_VOL=
MUTED=

case $1 in
    +)
        amixer set Master on
        amixer set Master 10%+
        CURRENT_VOL="$(amixer sget Master | grep -Eo '[0-9]{1,3}%' | head -n 1)"
    ;;
    -)
        amixer set Master on
        amixer set Master 10%-
        CURRENT_VOL="$(amixer sget Master | grep -Eo '[0-9]{1,3}%' | head -n 1)"
    ;;
    0)
        amixer sset Master toggle
        MUTED="$(amixer sget Master | grep -Eo '(\[on\]|\[off\])?' | head -n 1)"
    ;;
    *) exit;;

esac

notify-send -t 1000 "Volume: $CURRENT_VOL $MUTED"
