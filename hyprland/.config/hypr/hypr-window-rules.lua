-- ============================================================
-- ======                 WINDOW RULES                   ======
-- ============================================================
local function floating_dialog(match, w, h)
    hl.window_rule({
        match   = match,
        float   = true,
        center  = true,
        size    = { w, h },
        opacity = "0.9 0.9",
    })
end

floating_dialog({ class = "org.pulseaudio.pavucontrol" }, 900, 600)
floating_dialog({ class = "me.proton.Pass" }, 1100, 900)
floating_dialog({ class = "flameshot" }, 800, 600)
floating_dialog({ class = "qalculate-gtk" }, 800, 600)
floating_dialog({ class = "soffice" }, 800, 600)
floating_dialog({ class = "nm-connection-editor" }, 800, 600)
floating_dialog({ title = "About Mozilla Firefox" }, 800, 600)
floating_dialog({ class = "firefox", title = "Library" }, 1100, 900)
floating_dialog({ class = "crashreporter" }, 800, 600)
floating_dialog({ class = "firefox", title = "Picture-in-Picture" }, 800, 600)
floating_dialog({ class = "qt5ct" }, 1000, 800)
floating_dialog({ class = "qt6ct" }, 1000, 800)
floating_dialog({ class = "dev.zed.Zed", title = "Zed — Settings" }, 800, 800)
floating_dialog({ class = "org.gnome.Calendar" }, 900, 700)
floating_dialog({ class = "thunar", title = "^Rename .*$" }, 800, 600)
floating_dialog({ class = "app.zen_browser.zen", title = "About Zen Browser" }, 800, 600)
floating_dialog({ class = "app.zen_browser.zen", title = "Library" }, 1000, 800)
floating_dialog({ class = "org.gnome.FileRoller" }, 900, 600)
floating_dialog({ class = "org.qbittorrent.qBittorrent", title = "Preferences" }, 1000, 800)
floating_dialog({ title = "btop" }, 1000, 800)

hl.on("hyprland.start", function()
    os.execute("hyprctl keyword layerrule 'ignore, selection'")
end)
