#!/usr/bin/env bash
set -euo pipefail

HYPR_DIR="$HOME/dotfiles/hyprland/.config/hypr"
WAYBAR_DIR="$HOME/dotfiles/waybar/.config/waybar"
GTK_THEMES_DIR="$HOME/.local/share/themes"

# label | hyprland-colour | hyprland-style | waybar-colour | waybar-style | gtk-theme-folder
THEMES=(
    "Catppuccin Mocha - Rounded|catppuccin-mocha|rounded|catppuccin-mocha|rounded|Catppuccin-Mocha-Standard-Blue-Dark"
    "Catppuccin Mocha - Flat|catppuccin-mocha|flat|catppuccin-mocha|flat|Catppuccin-Mocha-Standard-Blue-Dark"
    "Catppuccin Macchiato - Rounded|catppuccin-macchiato|rounded|catppuccin-macchiato|rounded|Catppuccin-Macchiato-Standard-Blue-Dark"
    "Catppuccin Macchiato - Flat|catppuccin-macchiato|flat|catppuccin-macchiato|flat|Catppuccin-Macchiato-Standard-Blue-Dark"
)

labels=()
for entry in "${THEMES[@]}"; do
    labels+=("${entry%%|*}")
done

choice=$(printf '%s\n' "${labels[@]}" | rofi -dmenu -p "Theme")
[ -z "$choice" ] && exit 0

for entry in "${THEMES[@]}"; do
    IFS='|' read -r label h_colour h_style w_colour w_style gtk_theme <<< "$entry"
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

        # --- GTK3 ---
        ln -sf "$GTK_THEMES_DIR/${gtk_theme}" "$GTK_THEMES_DIR/current"

        exit 0
    fi
done
