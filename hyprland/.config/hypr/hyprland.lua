-- Settings for shortcuts
require("hypr-shortcuts")

-- Settings for window rules
require("hypr-window-rules")

-- Settings for styling
require("hypr-styling")

-- Settings for language / keyboard
require("hypr-input")

-- Load Settings for monitors and workspaces if it exists
local monitor_ok, monitor_err = pcall(require, "hypr-monitor-workspaces")
if not monitor_ok then
    print("Could not load hypr-monitor-workspaces.lua: " .. monitor_err)
end

-- Load environment variables for nvidia if it exists
-- Comment out if not using nvidia
local nvidia_ok, nvidia_err = pcall(require, "nvidia")
if not nvidia_ok then
    print("Could not load nvidia: " .. nvidia_err)
end


-- ============================================================
-- ======                  DEBUG MODE                    ======
-- ============================================================
hl.config({
    debug = {
        disable_logs = false,
        -- enable_stdout_logs = true,
    }
})

-- ============================================================
-- ======              ENVIRONMENT VARIABLES             ======
-- ============================================================
-- Hyprland integration
hl.env("GTK_IM_MODULE", "fcitx")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("SDL_VIDEODRIVER", "wayland")

-- Force GTK themes
hl.env("GTK_USE_PORTAL", "1")
-- hl.env("GTK_THEME", "current")
-- hl.env("GTK_THEME", "catppuccin-macchiato-blue-standard+default")

-- Force Qt themes
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- Helps with Nvidia/Wayland rendering
hl.env("XWAYLAND_FORCE_TRUE_COLOR", "1")
hl.env("WLR_DRM_NO_ATOMIC", "1")


-- ============================================================
-- ======                AUTOSTART                       ======
-- ============================================================
hl.on("hyprland.start", function()
    -- Kill any existing portal instances to prevent conflict
    hl.exec_cmd("killall -9 xdg-desktop-portal || true")
    -- Start only the Hyprland portal
    hl.exec_cmd("/usr/lib/xdg-desktop-portal-hyprland &")

    -- Toolkit agent
    hl.exec_cmd("systemctl --user start hyprpolkitagent &")

    hl.exec_cmd("swaync &")

    -- Waybar, task bar manager
    hl.exec_cmd("waybar &")

    -- Wallpaper
    hl.exec_cmd("hyprpaper &")

    -- Sleep mode
    hl.exec_cmd("hypridle &")

    -- Hyprsunset
    hl.exec_cmd("hyprsunset -c ~/.config/hypr/hyprsunset.conf &")

    -- Cliboard
    hl.exec_cmd("wl-paste --type text --watch cliphist store &")
    hl.exec_cmd("wl-paste --type image --watch cliphist store &")
end)




-- ============================================================
-- ======                    LAYOUT                      ======
-- ============================================================

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})
