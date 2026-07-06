#!/usr/bin/env bash
set -euo pipefail

HYPR_DIR="$HOME/dotfiles/hyprland/.config/hypr"
WAYBAR_DIR="$HOME/dotfiles/waybar/.config/waybar"
GTK_THEMES_DIR="$HOME/.local/share/themes"
QT6_DIR="$HOME/.config/qt6ct"

# label | hyprland-colour | hyprland-style | waybar-colour | waybar-style | gtk-theme-folder / qt6-theme-folder
THEMES=(
    "Catppuccin Mocha - Rounded|catppuccin-mocha|rounded|catppuccin-mocha|rounded|catppuccin-mocha-blue-standard+default|catppuccin-mocha-blue.conf"
    "Catppuccin Mocha - Flat|catppuccin-mocha|flat|catppuccin-mocha|flat|catppuccin-mocha-blue-standard+default|catppuccin-mocha-blue.conf"
    "Catppuccin Macchiato - Rounded|catppuccin-macchiato|rounded|catppuccin-macchiato|rounded|catppuccin-macchiato-blue-standard+default|catppuccin-macchiato-blue.conf"
    "Catppuccin Macchiato - Flat|catppuccin-macchiato|flat|catppuccin-macchiato|flat|catppuccin-macchiato-blue-standard+default|catppuccin-macchiato-blue.conf"
    "Nord - Rounded|nord|rounded|nord|rounded|???|???"
    "Nord - Flat|nord|flat|nord|flat|???|???"
    "Tokyo Night - Rounded|tokyo-night|rounded|tokyo-night|rounded|Tokyonight-Dark|???"
    "Tokyo Night - Flat|tokyo-night|flat|tokyo-night|flat|Tokyonight-Dark|???"
    "Gruvbox - Dark - Rounded|gruvbox|rounded|gruvbox|rounded|Gruvbox-Dark|gruvbox-dark.conf"
    "Gruvbox - Dark - Flat|gruvbox|flat|gruvbox|flat|Gruvbox-Dark|gruvbox-dark.conf"
    # "Gruvbox - Light - Rounded|gruvbox|rounded|gruvbox|rounded|Gruvbox-Light|gruvbox-light.conf"
    # "Gruvbox - Light - Flat|gruvbox|flat|gruvbox|flat|Gruvbox-Light|gruvbox-light.conf"
)

labels=()
for entry in "${THEMES[@]}"; do
    labels+=("${entry%%|*}")
done

choice=$(printf '%s\n' "${labels[@]}" | rofi -dmenu -p "Theme")
[ -z "$choice" ] && exit 0

for entry in "${THEMES[@]}"; do
    IFS='|' read -r label h_colour h_style w_colour w_style gtk_theme qt6_theme <<< "$entry"
    if [ "$label" == "$choice" ]; then

        # --- Hyprland ---
        ln -sfn "$HYPR_DIR/colors/${h_colour}.lua" "$HYPR_DIR/current/color.lua"
        ln -sfn "$HYPR_DIR/styles/${h_style}.lua" "$HYPR_DIR/current/style.lua"
        hyprctl reload

        # --- Waybar ---
        ln -sfn "$WAYBAR_DIR/colors/${w_colour}.css" "$WAYBAR_DIR/current/color.css"
        ln -sfn "$WAYBAR_DIR/styles/${w_style}.css" "$WAYBAR_DIR/current/style.css"
        ln -sfn "$WAYBAR_DIR/styles/${w_style}.jsonc" "$WAYBAR_DIR/current/style.jsonc"
        killall waybar
        waybar & disown

        # --- GTK3 ---
        ln -sfn "$GTK_THEMES_DIR/${gtk_theme}" "$GTK_THEMES_DIR/current"

        # --- Qt6 ---
        ln -sfn "$QT6_DIR/colors/${qt6_theme}" "$QT6_DIR/current/current.conf"

        exit 0
    fi
done
