#!/bin/bash

options=" Shutdown\n Reboot\n Suspend\n Lock\n Logout"

selected=$(echo -e "$options" | wofi --dmenu --style "$HOME/.config/wofi/powermenu/power.css" --width 400 --height 320 --location center)

case "$selected" in
    *Shutdown) systemctl poweroff ;;
    *Reboot) systemctl reboot ;;
    *Suspend) systemctl suspend ;;
    *Lock) swaylock ;;
    *Logout) hyprctl dispatch exit ;;
esac

