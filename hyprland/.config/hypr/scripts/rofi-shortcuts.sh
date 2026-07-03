#!/bin/bash

# Extract keybinding and description from hl.bind lines
awk '/hl\.bind/ && /description/ {
    match($0, /hl\.bind\(([^,]+)/, a)
    match($0, /description = "([^"]+)"/, b)
    printf "%-30s | %s\n", b[1], a[1]
}' ~/.config/hypr/hypr-shortcuts.lua | \
# Replace mainMod with SUPER and clean up output
    sed 's/mainMod/SUPER/g' | \
# Remove ... after SUPER
    sed 's/ \.* / /g' | \
# Remove quotes around keybindings
    sed 's/"//g' | \
# Make sure all align properly
    column -t -s '|' | \
# Replace mouse button names with human-readable labels
    sed 's/mouse:272/Left mouse button/g' | \
    sed 's/mouse:273/Right mouse button/g' | \
    sed 's/mouse_up/Mouse Scroll Up/g' | \
    sed 's/mouse_down/Mouse Scroll Down/g' |
# Open rofi with the formatted output
    rofi -dmenu -i -p "Hyprland Shortcuts" -theme-str 'window {width: 800px;}'
