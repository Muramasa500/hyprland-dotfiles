#!/bin/bash
set -euo pipefail  # Exit on error, undefined var, or pipeline failures
# Installation script

echo "🚀 Installing Muramasa's Hyprland Dotfiles..."

# 1. Install Stow if missing (Arch)
if ! command -v stow &> /dev/null; then
    echo "📦 Installing GNU Stow..."
    sudo pacman -S --noconfirm stow
fi

# 2. Create backup of existing configs
echo "⚠️ Warning: This will overwrite existing configs in ~/.config"
read -p "Proceed? (y/n): " confirm
[[ $confirm == "y" ]] || exit 1

# 3. Symlink directories using Stow
echo "📁 Creating symlinks with GNU Stow..."

# Verify all source directories exist before stowing
for dir in btop fastfetch gtk-3.0 hyprland kitty qt6ct rofi starship waybar weather-app zed zsh; do
    if [[ ! -d "$dir" ]]; then
        echo "❌ Missing required directory: $dir"
        exit 1
    fi
done

# Navigate to script directory
cd "$(dirname "$0")" || { echo "❌ Could not cd to script directory"; exit 1; }

# Run stow with verbose output and error handling
stow --verbose=2 btop fastfetch gtk-3.0 hyprland kitty qt6ct rofi starship waybar weather-app zed zsh || {
    echo "❌ Stow failed - check for conflicting files in ~/.config"
    echo "💡 Try: stow --restore [package]"
    exit 1
}

cd "$(dirname "$0")" || { echo "❌ Could not cd to script directory"; exit 1; }

stow btop fastfetch gtk-3.0 hyprland kitty qt6ct rofi starship waybar weather-app zed zsh || {
    echo "❌ Stow failed - check for conflicting files in ~/.config"
    echo "💡 Try manually resolving conflicts or using '--verbose' flag"
    exit 1
}

# 4. Install dependencies
echo "📦 Installing dependencies..."
echo "This may take a few minutes..."

# Define packages
PACKAGES=(
    "hyprland"
    "xdg-desktop-portal-hyprland"
    "hyprpolkitagent"
    "hyprlock"
    "hypridle"
    "hyprpaper"
    "hyprsunset"
    "waybar"
    "rofi"
    "ghostty"
    "swaync"
    "zsh"
    "starship"
    "jq"
    "curl"
    "gnome-keyring"
    "libsecret"
    "gvfs-mtp"
    "glib-networking"
    "gthumb"
    "networkmanager"
    "network-manager-applet"
    "playerctl"
    "pavucontrol"
    "wireplumber"
    "cliphist"
    "wl-clipboard"
    "xclip"
    "fastfetch"
    "slurp"
    "eza"
    "dust"
    "fd"
    "bat"
    "ripgrep"
    "procs"
    "fzf"
    "zoxide"
    "direnv"
    "btop"
    "zsh-autosuggestions"
    "zsh-history-substring-search"
    "zsh-syntax-highlighting"
    "thunar"
    "thunar-archive-plugin"
    "thunar-media-tags-plugin"
    "thunar-vcs-plugin"
    "thunar-volman"
    "sudo-rs"
    "neovim"
    "qalculate-gtk"
    "brightnessctl"
    "hyprshot"
    "zed"
    "ttf-jetbrains-mono-nerd"
    "noto-fonts"
    "papirus-icon-theme"
    "gstreamer"
)

# Install only missing packages
missing=()
for pkg in "${PACKAGES[@]}"; do
    if ! pacman -Q "$pkg" &> /dev/null; then
        missing+=("$pkg")
    fi
done

if [ ${#missing[@]} -eq 0 ]; then
    echo "✅ All dependencies are already installed."
else
    echo "🔧 Installing missing packages: ${missing[*]}"
    sudo pacman -S --noconfirm "${missing[@]}"
fi

echo "✅ Dependencies installed!"


echo "Install themes from github"
mkdir -p ~/.local/share/themes

THEMES_DIR="$HOME/.local/share/themes"
TMP_DIR="$(mktemp -d)"

echo "Installing papirus-folders from github"
git clone https://github.com/PapirusDevelopmentTeam/papirus-folders.git "$TMP_DIR/papirus-folders"
cd $TMP_DIR/papirus-folders/papirus-folders
./install.sh -d "$THEMES_DIR" -l

echo "Installing Gruvbox-GTK-Theme from github"
git clone https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme.git "$TMP_DIR/Gruvbox"
cd $TMP_DIR/Gruvbox/Gruvbox-GTK-Theme/themes
./install.sh -d "$THEMES_DIR" -l

echo "Installing Tokyonight-GTK-Theme from github"
git clone https://github.com/Fausto-Korpsvart/Tokyonight-GTK-Theme.git "$TMP_DIR/Tokyonight"
cd $TMP_DIR/Tokyonight/Tokyonight-GTK-Theme/themes
./install.sh -d "$THEMES_DIR" -l

echo "Installing Catppuccin-GTK-Theme from github"
git clone https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme.git "$TMP_DIR/Catppuccin"
cd $TMP_DIR/Catppuccin/Catppuccin-GTK-Theme/themes
./install.sh -d "$THEMES_DIR" -l

echo "Installing btop-catppuccin from github"
git clone https://github.com/catppuccin/btop.git "$TMP_DIR/btop"
cd btop/themes
cp * "$THEMES_DIR"

echo "📥 Get rofi-power-menu from github"
sudo curl -o /usr/local/bin/rofi-power-menu https://raw.githubusercontent.com/jluttine/rofi-power-menu/master/rofi-power-menu
sudo chmod +x /usr/local/bin/rofi-power-menu
echo "✅ Package installed!"


# 5. Install complete
echo ""
echo "📋 Post-install steps (check README.md for details):"
echo "  1. Create ~/.config/weather-app/geolocation with your coordinates"
echo "  2. Configure monitors in ~/.config/hypr/hypr-monitor-workspaces.lua"
echo "  3. Configure nvidia or AMD environmental variables if needed"
echo "✅ Installation complete! Reboot or start Hyprland."
