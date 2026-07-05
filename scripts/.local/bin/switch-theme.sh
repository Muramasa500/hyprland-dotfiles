#!/usr/bin/env bash
# ~/.local/bin/switch-theme.sh
set -euo pipefail

HYPR_DIR="$HOME/.config/hypr"
WAYBAR_DIR="$HOME/.config/waybar/"

# label | hyprland-colour | hyprland-style | waybar-colour | waybar-style
THEMES=(
    "Catppuccin Mocha - Rounded|catppuccin-mocha|rounded|catppuccin-mocha|rounded"
    "Catppuccin Mocha - Flat|catppuccin-mocha|flat|catppuccin-mocha|flat"
    "Catppuccin Macchiato - Rounded|catppuccin-macchiato|rounded|catppuccin-macchiato|rounded"
    "Catppuccin Macchiato - Flat|catppuccin-macchiato|flat|catppuccin-macchiato|flat"
)

labels=()
for entry in "${THEMES[@]}"; do
    labels+=("${entry%%|*}")
done

choice=$(printf '%s\n' "${labels[@]}" | rofi -dmenu -p "Theme")
[ -z "$choice" ] && exit 0

for entry in "${THEMES[@]}"; do
    IFS='|' read -r label h_colour h_style w_colour w_style <<< "$entry"
    if [ "$label" == "$choice" ]; then

        # --- Hyprland ---
        ln -sf "$HYPR_DIR/colours/${h_colour}.lua" "$HYPR_DIR/current/colour.lua"
        ln -sf "$HYPR_DIR/styles/${h_style}.lua" "$HYPR_DIR/current/style.lua"
        hyprctl reload

        # --- Waybar ---
        ln -sf "$WAYBAR_DIR/colours/${w_colour}.css" "$WAYBAR_DIR/current/colour.css"
        ln -sf "$WAYBAR_DIR/styles/${w_style}.css" "$WAYBAR_DIR/current/style.css"
        ln -sf "$WAYBAR_DIR/styles/${w_style}.jsonc" "$WAYBAR_DIR/current/style.jsonc"

        killall waybar
        waybar & disown

        exit 0
    fi
done
