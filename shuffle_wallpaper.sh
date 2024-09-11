#!/bin/bash

# Source: https://www.reddit.com/r/linux4noobs/comments/18gszjq/how_do_i_make_swww_use_a_random_or_cycle_through/

# Set the path to the wallpapers directory
wallpapersDir="$HOME/Pictures/wallpapers"

# Get a list of all image files in the wallpapers directory
wallpapers=("$wallpapersDir"/*)

# Start an infinite loop
while true; do
    # Check if the wallpapers array is empty
    if [ ${#wallpapers[@]} -eq 0 ]; then
        # If the array is empty, refill it with the image files
        wallpapers=("$wallpapersDir"/*)
    fi

    # Select a random wallpaper from the array
    wallpaperIndex=$(( RANDOM % ${#wallpapers[@]} ))
    selectedWallpaper="${wallpapers[$wallpaperIndex]}"

    # Update the wallpaper using the swww img command
    swaybg -o \* -i "$selectedWallpaper" -m fill

    # Remove the selected wallpaper from the array
    unset "wallpapers[$wallpaperIndex]"

    # Delay for 2 hours before selecting the next wallpaper
    sleep 2h
done
