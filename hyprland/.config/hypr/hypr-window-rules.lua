-- ============================================================
-- ======                 WINDOW RULES                   ======
-- ============================================================
hl.window_rule({
    match = { class = "org.pulseaudio.pavucontrol" },
    float = true,
    center = true,
    size = { 900, 600 },
    opacity = "0.9 0.9",
})

hl.window_rule({
    match = { class = "me.proton.Pass" },
    float = true,
    center = true,
    size = { 1100, 900 },
    opacity = "0.9 0.9",
})

hl.window_rule({
    match = { class = "flameshot" },
    float = true,
    center = true,
    size = { 800, 600 },
    opacity = "0.9 0.9",
})

hl.window_rule({
    match = { class = "qalculate-gtk" },
    float = true,
    center = true,
    size = { 800, 600 },
    opacity = "0.9 0.9",
})

hl.window_rule({
    match = { class = "soffice" },
    float = true,
    center = true,
    size = { 800, 600 },
    opacity = "0.9 0.9",
})

hl.window_rule({
    match = { class = "nm-connection-editor" },
    float = true,
    center = true,
    size = { 800, 600 },
    opacity = "0.9 0.9",
})

hl.window_rule({
    match = { title = "About Mozilla Firefox" },
    float = true,
    center = true,
    size = { 800, 600 },
    opacity = "0.9 0.9",
})

hl.window_rule({
    match = { class = "firefox", title = "Library" },
    float = true,
    center = true,
    size = { 1100, 900 },
    opacity = "0.9 0.9",
})

hl.window_rule({
    match = { class = "crashreporter" },
    float = true,
    center = true,
    size = { 800, 600 },
    opacity = "0.9 0.9",
})

hl.window_rule({
    match = { class = "firefox", title = "Picture-in-Picture" },
    float = true,
    center = true,
    size = { 800, 600 },
    opacity = "0.9 0.9",
})

hl.window_rule({
    match = { class = "qt5ct" },
    float = true,
    center = true,
    size = { 1000, 800 },
    opacity = "0.9 0.9",
})

hl.window_rule({
    match = { class = "qt6ct" },
    float = true,
    center = true,
    size = { 1000, 800 },
    opacity = "0.9 0.9",
})

hl.window_rule({
    match = { class = "dev.zed.Zed", title = "Zed — Settings" },
    float = true,
    center = true,
    size = { 800, 800 },
    opacity = "0.9 0.9",
})

hl.window_rule({
    match = { class = "org.gnome.Calendar" },
    float = true,
    center = true,
    size = { 800, 600 },
    opacity = "0.9 0.9",
})


hl.window_rule({
    match = { class = "thunar", title = "^Rename .*$" },
    float = true,
    center = true,
    size = { 800, 600 },
    opacity = "0.9 0.9",
})


hl.window_rule({
    match = { class = "app.zen_browser.zen", title = "About Zen Browser" },
    float = true,
    center = true,
    size = { 800, 600 },
    opacity = "0.9 0.9",
})

hl.window_rule({
    match = { class = "app.zen_browser.zen", title = "Library" },
    float = true,
    center = true,
    size = { 1000, 800 },
    opacity = "0.9 0.9",
})

hl.window_rule({
    match = { class = "org.gnome.FileRoller" },
    float = true,
    center = true,
    size = { 900, 600 },
    opacity = "0.9 0.9",
})



-- TODO: btop and htop as floating windows
-- hl.window_rule({
--     match = {
--         class = "com.mitchellh.ghostty", title = "btop"
--     },
--     float = true,
--     center = true,
--     size = { 800, 600 },
--     opacity = "0.9 0.9",
-- })


-- hl.window_rule({
--     match = {
--         class = "com.mitchellh.ghostty", title = "htop"
--     },
--     float = true,
--     center = true,
--     size = { 800, 600 },
--     opacity = "0.9 0.9",
-- })

hl.window_rule({
    match = { title = "btop" },
    float = true,
    center = true,
    size = { 1000, 800 },
    opacity = "0.9 0.9",
})


hl.on("hyprland.start", function()
    os.execute("hyprctl keyword layerrule 'ignore, selection'")
end)
