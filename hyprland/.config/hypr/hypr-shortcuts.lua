-- ============================================================
-- ======                 KEYBINDINGS                    ======
-- ============================================================

-- ============================================================
-- ======           PROGRAMS (VARIABLES)                 ======
-- ============================================================
local mainMod = "SUPER"
-- HACK: Need to have GTK_IM_MODULE=simple for terminal, to avoid issues with keyboard in Ghostty
local terminal = "GTK_IM_MODULE=simple ghostty"
local terminal_command = "GTK_IM_MODULE=simple ghostty -e"
local fileManager = "thunar"
local menu = "rofi -show drun -display-drun ''"
local screenLocker = "hyprlock"
local browser = "firefox"
local calculator = "qalculate-gtk"
local gui_editor = "zeditor"


-- ============================================================
-- ======                OPEN PROGRAMS                   ======
-- ============================================================
hl.bind(mainMod .. " + RETURN ", hl.dsp.exec_cmd(terminal), { description = "Open terminal" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager), { description = "Open File Manager" })
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser), { description = "Open browser" })
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(calculator), { description = "Open calculator" })
-- hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(cli_editor), { description = "Open CLI editor" })
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(gui_editor), { description = "Open GUI editor" })


-- ============================================================
-- ======                  UTILITIES                     ======
-- ============================================================
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("~/.config/hypr/scripts/rofi-shortcuts.sh"),
    { description = "Show keybindings" })
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(menu), { description = "Open Application launcher" })
hl.bind(mainMod .. " + Tab", hl.dsp.exec_cmd("rofi -show window"), { description = "Open window switcher" })
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("~/.config/waybar/rofi-cliphist.sh"),
    { description = "Open clipboard manager" })
hl.bind(mainMod .. " + ESCAPE ", hl.dsp.exec_cmd("~/.config/waybar/rofi-power-menu.sh"),
    { description = "Start Power Menu" })
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Close window" })
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(screenLocker), { description = "Lock screen" })


-- ============================================================
-- ======          HYPRLAND /  WAYBAR CONFIG             ======
-- ============================================================
-- Edit Hyprland and waybar configuration files

hl.bind(mainMod .. " + X",
    hl.dsp.exec_cmd(gui_editor ..
        " + .config/waybar/config.jsonc &&" .. gui_editor .. " + .config/waybar/style.css &&" ..
        gui_editor .. " + ~/.config/hypr/hypr-shortcuts.lua &&" .. gui_editor .. " + ~/.config/hypr/hyprland.lua &&"
        .. gui_editor ..
        " + ~/.config/hypr/hypr-styling.lua &&" .. gui_editor .. " + ~/.config/hypr/hypr-window-rules.lua &&"
        .. gui_editor ..
        " + ~/.config/hypr/hypr-monitor-workspaces.lua && " .. gui_editor .. " + ~/.config/hypr/nvidia.lua"),
    { description = "Open Hyprland & Waybar configs" })
-- Reload hyprland
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd(terminal_command .. " hyprctl reload"),
    { description = "Restart Hyprland" })
-- Reload waybar
hl.bind(mainMod .. " + ALT + R", hl.dsp.exec_cmd(terminal_command .. " killall waybar && nohup waybar &"),
    { description = "Restarts Waybar" })
hl.bind(mainMod .. " + 0", hl.dsp.exec_cmd(terminal_command .. " nohup waybar &"), { description = "Start Waybar" })


-- ============================================================
-- ======            MOVE WORKSPACES / WINDOWS           ======
-- ============================================================
-- move focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }), { description = "Move focus left" })
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }), { description = "Move focus right" })
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }), { description = "Move focus up" })
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }), { description = "Move focus down" })

-- Move / focus window to workspace fixed number
for i = 0, 9 do
    hl.bind(mainMod .. " + SHIFT + " .. tostring(i), hl.dsp.window.move({ workspace = i }),
        { description = "Move window to workspace " .. tostring(i) })
    hl.bind(mainMod .. " + " .. tostring(i), hl.dsp.focus({ workspace = i }),
        { description = "Focus window on workspace " .. tostring(i) })
end

-- Move window to previous workspace (left)
hl.bind(mainMod .. " + SHIFT + left", function()
    local currentWs = hl.get_active_monitor().active_workspace
    hl.dispatch(hl.dsp.window.move({ workspace = currentWs.id - 1 }),
        { description = "Move window to previous workspace" })
end)

-- Move window to next workspace (right)
hl.bind(mainMod .. " + SHIFT + right", function()
    local currentWs = hl.get_active_monitor().active_workspace
    hl.dispatch(hl.dsp.window.move({ workspace = currentWs.id + 1 }),
        { description = "Move window to next workspace" })
end)

-- Swap active window with neighbor using Super + SHIFT + Arrow Keys
hl.bind(mainMod .. " + ALT + left", hl.dsp.window.swap({ direction = "l" }), { description = "Swap tiled window left" })
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.swap({ direction = "r" }), { description = "Swap tiled window right" })
hl.bind(mainMod .. " + ALT + up", hl.dsp.window.swap({ direction = "u" }), { description = "Swap tiled window up" })
hl.bind(mainMod .. " + ALT + down", hl.dsp.window.swap({ direction = "d" }), { description = "Swap tiled window down" })

-- Move active window to Next Monitor (Right)
hl.bind(mainMod .. " + CTRL + Right", hl.dsp.window.move({ monitor = "+1" }),
    { description = "Move active window to next monitor" })

hl.bind(mainMod .. " + CTRL + Left", hl.dsp.window.move({ monitor = "-1" }),
    { description = "Move active window to previous monitor" })

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"), { description = "Toggle special workspace magic" })



-- ============================================================
-- ======              RESIZING WORKSPACE                ======
-- ============================================================
-- Resize active window with CTRL + Arrow Keys
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.resize({ x = 100, y = 0, relative = true }), { repeating = true },
    { description = "Increase window width with keyboard" })
hl.bind(mainMod .. " + CTRL + left", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), { repeating = true },
    { description = "Reduce window width with keyboard" })
hl.bind(mainMod .. " + CTRL + down", hl.dsp.window.resize({ x = 0, y = 100, relative = true }), { repeating = true },
    { description = "Increase window height with keyboard" })
hl.bind(mainMod .. " + CTRL + up", hl.dsp.window.resize({ x = 0, y = -100, relative = true }), { repeating = true },
    { description = "Reduce window height with keyboard" })

-- Floating window
hl.bind(mainMod .. " + SPACE", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating window" })

-- Fullscreen
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }),
    { description = "Toggle Fullscreen" })
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }),
    { description = "Toggle Maximize Window" })

-- Split windows
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"), { description = "Toggle split" })
hl.bind(mainMod .. " + G", hl.dsp.group.toggle(), { description = "Toggle window group" })
hl.bind(mainMod .. " + K", hl.dsp.layout("swapsplit"), { description = "Swapsplit" })


-- ============================================================
-- ======             MOUSE DRAG & RESIZE                ======
-- ============================================================
-- Move to next / prev workspace with mouse wheel
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Switch to next workspace" })
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { description = "Switch to previous workspace" })

-- Move / resize windows with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Move window with the mouse" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window with the mouse" })


-- ============================================================
-- ======              KEYBINDINGS LAYOUT                ======
-- ============================================================
-- TODO: changing layout with keybindings, and show current layout on waybar
-- hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd("hyprctl dispatch setlayout dwindle"))
-- hl.bind(mainMod .. " + F2", hl.dsp.exec_cmd("hyprctl dispatch setlayout master"))
-- hl.bind(mainMod .. " + F3", hl.dsp.exec_cmd("hyprctl dispatch setlayout next"))


-- ============================================================
-- ======               TAKE SCREENSHOTS                 ======
-- ============================================================
-- Capture a region (drag to select)
hl.bind(mainMod .. " + P",
    hl.dsp.exec_cmd("hyprshot -m region output -b 0 -f $(date +%Y%m%d_%H%M%S) -o ~/Pictures/Screenshots"),
    { description = "Screenshot a region (drag to select)" })
-- Capture the focused window
hl.bind(mainMod .. " + SHIFT + P",
    hl.dsp.exec_cmd("hyprshot -m window output -b 0 -f $(date +%Y%m%d_%H%M%S) -o ~/Pictures/Screenshots"),
    { description = "Screenshot the focused window" })
-- Capture the active monitor
hl.bind(mainMod .. " + CTRL + P",
    hl.dsp.exec_cmd("hyprshot -m output output -b 0 -f $(date +%Y%m%d_%H%M%S) -o ~/Pictures/Screenshots"),
    { description = "Screenshot the active monitor" })
-- Capture region, clipboard only (no file saved)
hl.bind(mainMod .. " + ALT + P",
    hl.dsp.exec_cmd(
        "hyprshot -m region --clipboard-only output -b 0 -f $(date +%Y%m%d_%H%M%S) -o ~/Pictures/Screenshots"),
    { description = "Screenshot a region (drag to select), clipboard only" })


-- Screenshot entire screen → save to file
-- hl.bind("SUPER + CTRL + P", hl.dsp.exec_cmd("hyprshot -m output -f $(date +%Y%m%d_%H%M%S) -o ~/Pictures/Screenshots"),
--     { description = "Screenshot entire screen" })

-- -- Screenshot selected region → save to file
-- hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("hyprshot -m region -f $(date +%Y%m%d_%H%M%S) -o ~/Pictures/Screenshots"),
--     { description = "Screenshot selected region" })

-- -- Screenshot active window → save to file
-- hl.bind("SUPER + ALT + P", hl.dsp.exec_cmd("hyprshot -m window -f $(date +%Y%m%d_%H%M%S) -o ~/Pictures/Screenshots"),
--     { description = "Screenshot active window" })

-- -- Screenshot selected region → copy to clipboard
-- hl.bind("CTRL + Print", hl.dsp.exec_cmd("hyprshot -m region -c"),
--     { description = "Screenshot selected region and copy to clipboard" })



-- ============================================================
-- ======          KEYBINDINGS KEYBOARD KEYS             ======
-- ============================================================
-- TODO:add more keyboard keys
-- media controls
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true, description = "Play/Pause media" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"),
    { locked = true, description = "Previous media" })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"),
    { locked = true, description = "Next media" })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, description = "Mute audio" })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, description = "Mute microphone" })

-- volume (locked + repeating)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%+"),
    { locked = true, repeating = true, description = "Raise volume" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%-"),
    { locked = true, repeating = true, description = "Lower volume" })

-- backlight (locked + repeating)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"),
    { locked = true, repeating = true, description = "Increase brightness" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"),
    { locked = true, repeating = true, description = "Decrease brightness" })
