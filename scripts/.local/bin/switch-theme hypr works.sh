#!/usr/bin/env bash
# ~/.local/bin/switch-theme.sh

STATE_FILE="$HOME/.config/hypr/theme/current-theme.lua"

# label | colors-file (without .lua) | style-file (without .lua)
THEMES=(
    "Catppuccin Mocha - Rounded|colour.catppuccin-mocha|style.rounded-style"
    "Catppuccin Mocha - Flat|colour.catppuccin-mocha|style.flat-style"
    "Catppuccin Macchiato - Rounded|colour.catppuccin-macchiato|style.rounded-style"
    "Catppuccin Macchiato - Flat|colour.catppuccin-macchiato|style.flat-style"
)

labels=()
for entry in "${THEMES[@]}"; do
    labels+=("${entry%%|*}")
done

choice=$(printf '%s\n' "${labels[@]}" | rofi -dmenu -p "Theme")
[ -z "$choice" ] && exit 0

for entry in "${THEMES[@]}"; do
    IFS='|' read -r label colours style <<< "$entry"
    if [ "$label" == "$choice" ]; then
        cat > "$STATE_FILE" <<EOF
return {
    colours = "$colours",
    style  = "$style",
}
EOF
        hyprctl reload
        exit 0
    fi
done
