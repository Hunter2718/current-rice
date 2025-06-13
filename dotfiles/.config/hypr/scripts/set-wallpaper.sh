#!/bin/bash

# Kill rogue instances
pkill -f swww-daemon

# Wait for cleanup
sleep 0.5

# Start clean instance
swww-daemon &

# Give it a moment to be ready
sleep 0.5

# Set the wallpaper
for MON in $(hyprctl monitors | grep "Monitor" | cut -d' ' -f2); do
    swww img --transition-type any --transition-duration 0.7 --outputs "$MON" ~/Pictures/wallpapers/tempChat.jpeg
done

