#!/usr/bin/env bash

folder="$HOME/Notes"

# Prompt for "New" or existing note
choice=$(printf "New\n%s" "$(ls -tp "$folder" | grep -v /)" | fuzzel --dmenu --width 40 --prompt "Note:") || exit 0

case "$choice" in
  New)
    # Prompt for name using fuzzel again
    name=$(fuzzel --dmenu --width 40 --prompt "Name:" < /dev/null)
    [[ -z "$name" ]] && name="$(date +%F_%H-%M-%S)"
    kitty nvim "$folder/${name}.md" &
    ;;
  *.md)
    kitty nvim "$folder/$choice" &
    ;;
  *)
    exit 0
    ;;
esac

