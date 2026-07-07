<h1 align="center"> Muramasa's Hyprland Dotfiles </h1>

<p align="center">
I've always enjoyed the Catppuccin Macchiato color palette, and really wanted to use it for my desktop environment. This is my personal configuration for Arch Linux running Hyprland tiling window compositor. These configurations cover the complete desktop experience — from window management, terminal, to status bars, notification systems, and file manager.  </p>

<p align="center"> My personal configuration files for <b>Arch Linux</b> with <b>Hyprland</b> compositor, featuring <b>Catppuccin Macchiato</b> theming. </p>

<p align="center">
	<img alt="OS" src="https://img.shields.io/badge/OS-Linux-FCC624?style=for-the-badge&logo=linux&logoColor=white"/>
	<img alt="WM" src="https://img.shields.io/badge/Hyprland-Dotfiles-00E0FF?style=for-the-badge&logo=hyprland&logoColor=white"/>
	<img alt="Stars" src="https://img.shields.io/github/stars/Muramasa500/hyprland-dotfiles?style=for-the-badge">
	<img alt="Last Commit" src="https://img.shields.io/github/last-commit/Muramasa500/hyprland-dotfiles?style=for-the-badge">
	<img alt="License" src="https://img.shields.io/github/license/Muramasa500/hyprland-dotfiles?style=for-the-badge">
	<img alt="Top Language" src="https://img.shields.io/github/languages/top/Muramasa500/hyprland-dotfiles?style=for-the-badge">
</p>


<p align="center">
  <img src="screenshots/desktop1.png" alt="Muramasa's Dotfiles" width="100%">
  <img src="screenshots/desktop2.png" alt="Muramasa's Dotfiles" width="100%">
</p>

## Tech Stack

<p align="center">
<img alt="Compositor" src="https://img.shields.io/badge/Compositor-Hyprland-58E1FF?style=for-the-badge&logo=hyprland&logoColor=white">
<img alt="Bar" src="https://img.shields.io/badge/Bar-Waybar-131C2A?style=for-the-badge">
<img alt="Theme" src="https://img.shields.io/badge/Theme-Catppuccin%20Macchiato-8aadf4?style=for-the-badge&logo=catppuccin&logoColor=white">
<img alt="Terminal" src="https://img.shields.io/badge/Terminal-Ghostty-3551F3?style=for-the-badge&logo=ghostty&logoColor=white">
<img alt="Shell" src="https://img.shields.io/badge/Shell-zsh-F15A24?style=for-the-badge&logo=zsh&logoColor=white">
<img alt="Launcher" src="https://img.shields.io/badge/Launcher-rofi-E9E5CA?style=for-the-badge">
<img alt="Editor" src="https://img.shields.io/badge/Editor-Zed-084CCF?style=for-the-badge&logo=zedindustries&logoColor=white">
<img alt="File Manager" src="https://img.shields.io/badge/File_Manager-Thunar-288B97?style=for-the-badge">
</p>
This repository contains my complete desktop environment configuration including:



<details>
<summary><b>📋 Detailed Overview</b></summary>

| Component | Description |
|-----------|-------------|
| **Hyprland** | Tiling Wayland compositor with animations |
| **Waybar** | Status bar with custom modules (weather, clock, system stats) |
| **Rofi** | Application launcher, clip history, power menu, SUPER+TAB dmenu replacement |
| **Ghostty** | Modern GPU-accelerated terminal emulator |
| **Zsh** | Shell with Starship prompt |
| **Zed** | Modern editor, made in Rust |
| **Thunar** | File manager |
| **Catppuccin** | Unified color theme across GTK, Qt, and terminals |

</details>


## Themes & Assets

This configuration uses the following third-party assets:

- **Catppuccin Theme Suite** - [github.com/catppuccin](https://github.com/catppuccin)
  - GTK themes (`gtk-Catppuccin`)
  - Qt5ct theme (`qt5t-Catppuccin`)
  - Rofi theme (`rofi-catppuccin`)
  - Zed theme (`zed-catppuccin`)
  - Ghostty theme (`Ghostyy-catppuccin`)

- **rofi-power-menu** - [github.com/jluttine/rofi-power-menu](https://github.com/jluttine/rofi-power-menu)

## Directory Structure

```bash
~/dotfiles/
├── btop             # btop config
├── fastfetch        # Fastfetch config
├── ghostty/         # Ghostty terminal config
├── hyprland/        # Hyprland config (hyprland.lua)
├── kitty/           # Kitty terminal config
├── qt6ct/           # qt6 config / themes
├── rofi/            # Rofi config
├── screenshots/     # Screenshots
├── scripts/         # Custom scripts
├── starship/        # Starship prompt config
├── waybar/          # Waybar config, style.css, scripts
├── weather-app/     # Custom weather script + config
├── zed/             # Zed config / themes
└── zsh/             # .zshrc shell config
```

## Installation

### Option 1: Using install.sh (Recommended)

Run the following commands to install the dotfiles using the `install.sh` script:

```bash
git clone git@github.com:Muramasa500/hyprland-dotfiles.git ~/dotfiles
cd ~/dotfiles/
chmod +x install.sh
./install.sh
```

### Option 2: Using GNU Stow

```bash
git clone git@github.com:Muramasa500/hyprland-dotfiles.git ~/dotfiles
sudo curl -o /usr/local/bin/rofi-power-menu https://raw.githubusercontent.com/jluttine/rofi-power-menu/master/rofi-power-menu
sudo chmod +x /usr/local/bin/rofi-power-menu
sudo pacman -S stow
cd ~/dotfiles
stow btop fastfetch ghostty hyprland kitty qt6ct rofi starship waybar weather-app zedn zsh
```


### Option 3: Manual Setup
```bash
git clone git@github.com:Muramasa500/hyprland-dotfiles.git ~/Downloads
sudo curl -o /usr/local/bin/rofi-power-menu https://raw.githubusercontent.com/jluttine/rofi-power-menu/master/rofi-power-menu
sudo chmod +x /usr/local/bin/rofi-power-menu
cp -r btop/.config/* ~/.config/
cp -r fastfetch/.config/* ~/.config/
cp -r gtk-3.0/.config/* ~/.config/
 ... repeat for other folders
```

## Dependencies

Install required packages (automatically installed if you use `install.sh`):

```bash
sudo pacman -S \
  hyprland xdg-desktop-portal-hyprland hyprpolkitagent hyprlock \
  hypridle hyprpaper hyprsunset cliphist wl-clipboard xclip \
  waybar rofi ghostty swaync gnome-keyring libsecret \
  zsh starship jq curl playerctl pavucontrol wireplumber \
  gvfs-mtp glib-networking gthumb \
  networkmanager network-manager-applet \
  thunar thunar-archive-plugin thunar-media-tags-plugin \
  thunar-vcs-plugin thunar-volman neovim \
  zsh-autosuggestions zsh-history-substring-search \
  zsh-syntax-highlighting slurp eza dust fd bat \
  ripgrep procs fzf zoxide btop direnv zed \
  qalculate-gtk brightnessctl fastfetch sudo-rs  \
  hyprshot ttf-jetbrains-mono-nerd noto-fonts papirus-icon-theme \
  gstreamer
  ```

## Post-install Configuration

After cloning, you must:
1. Configure weather app in `~/.config/weather-app/`: 
   - cp geolocation.example geolocation
   - Add your location to `geolocation`
2. Configure monitors in `~/.config/hypr/hypr-monitor-workspaces.lua`:
   - Run `hyprctl monitors` to find your output names
3. Configure nvidia or AMD GPU environmental variables if needed
   - Comment out `require("nvidia")` in `~/.config/hypr/hyprland.lua`, if not using nvidia

#### If you want to configure language:
4. Configure language in `~/.config/waybar/language.jsonc`:
5. Configure keyboard layout in `~/.config/hypr/hypr-input.lua`:


## Key Features

- Weather Display: Open-Meteo API integration with 3-day forecast
- Clipboard Manager: Cliphist integration for history
- Power Menu: Shutdown, reboot, suspend, hibernate, logout
- Application launcher: Start an application from a menu
- A window switcher: Start a ALT-TAB style window switcher
- Language Switcher: Select keyboard layout



## Keyboard Shortcuts

| Keybinding | Action |
|------------|--------|
| `Super + A` | Open rofi application launcher|
| `Super + H` | Show Shortcuts / keybindings|
| `Super + Tab` | Open Rofi window switcher |
| `Super + ENTER` | Open ghostty terminal |
| `Super + B` | Open firefox browser |
| `Super + Z` | Open Zed editor |
| `Super + Q` | Close focused window | 
| `Super + Arrow` | Move focus to a new window |
| `Super + Shift + Arrow` | Move focused window to new workspace |
| `Super + 1 ... 9` | Move to workspace  1 .. 9 |
| `Super + F` | Full screen |

*(Check `~/.config/hypr/hypr-shortcuts.lua` for full list)*


## Credits

#### Hyprland Ecosystem Tools
- [Hyprland](https://github.com/hyprwm/Hyprland) - Wayland compositor
- [HyprIdle](https://github.com/hyprwm/hypridle) - Session idle management
- [HyprLock](https://github.com/hyprwm/hyprlock) - Screen locking
- [HyprPaper](https://github.com/hyprwm/hyprpaper) - Wallpaper management
- [HyprPolkitAgent](https://github.com/hyprwm/hyprpolkitagent) - Polkit authentication agent
- [HyprSunset](https://github.com/hyprwm/hyprsunset) - Blue light filter
- [XDG Desktop Portal Hyprland](https://github.com/hyprwm/xdg-desktop-portal-hyprland) - Integration layer
- [Hyprshot](https://github.com/Gustash/hyprshot) - Screenshot utility

#### Core Applications
- [Waybar](https://github.com/Alexays/Waybar) - Status bar
- [Rofi](https://github.com/davatorium/rofi) - Application launcher
- [Ghostty](https://github.com/ghostty-org/ghostty) - GPU-accelerated terminal
- [Zed](https://github.com/zed-industries/zed) - Rust-based text editor

#### Themes
- [Catppuccin](https://github.com/catppuccin) - Color themes
- [JetBrains Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts) - Icon/font patching

#### Utilities
- [Cliphist](https://github.com/sentriz/cliphist) - Clipboard history manager
- [SwayNC](https://github.com/ErikReider/SwayNotificationCenter) - Notification daemon
- [Btop](https://github.com/aristocratos/btop) - Resource monitor
- [Fastfetch](https://github.com/fastfetch-cli/fastfetch) - System information display
- [Starship](https://github.com/starship/starship) - Cross-shell prompt
- [Jluttine/Rofi-Power-Menu](https://github.com/jluttine/rofi-power-menu) - Power menu script
- [Slurp](https://github.com/emersion/slurp) - Selection tool for screenshots


---
