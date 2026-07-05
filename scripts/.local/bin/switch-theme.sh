#!/usr/bin/env bash
# ~/.local/bin/switch-theme.sh

STATE_FILE="$HOME/.config/hypr/theme/current-theme.lua"

# label | colors-file (without .lua) | style-file (without .lua)
THEMES=(
    "Catppuccin Mocha - Rounded|catppuccin-mocha|rounded-style"
    "Catppuccin Mocha - Flat|catppuccin-mocha|flat-style"
    "Catppuccin Macchiato - Rounded|catppuccin-macchiato|rounded-style"
    "Catppuccin Macchiato - Flat|catppuccin-macchiato|flat-style"
)

labels=()
for entry in "${THEMES[@]}"; do
    labels+=("${entry%%|*}")
done

choice=$(printf '%s\n' "${labels[@]}" | rofi -dmenu -p "Theme")
[ -z "$choice" ] && exit 0

for entry in "${THEMES[@]}"; do
    IFS='|' read -r label colors style <<< "$entry"
    if [ "$label" == "$choice" ]; then
        cat > "$STATE_FILE" <<EOF
return {
    colors = "$colors",
    style  = "$style",
}
EOF
        hyprctl reload
        exit 0
    fi
done
