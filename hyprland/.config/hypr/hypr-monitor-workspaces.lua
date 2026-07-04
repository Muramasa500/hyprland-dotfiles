-- ============================================================
-- ======                WORKSPACE RULES                 ======
-- ============================================================
hl.workspace_rule({ workspace = "1", monitor = "DP-1", persistent = true, default = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-1", persistent = true })
hl.workspace_rule({ workspace = "3", monitor = "DP-1", persistent = true })

hl.workspace_rule({ workspace = "4", monitor = "DP-2", persistent = true, default = true })
hl.workspace_rule({ workspace = "5", monitor = "DP-2", persistent = true })
hl.workspace_rule({ workspace = "6", monitor = "DP-2", persistent = true })

hl.workspace_rule({ workspace = "7", monitor = "HDMI-A-1", persistent = true, default = true })
hl.workspace_rule({ workspace = "8", monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = "9", monitor = "HDMI-A-1", persistent = true })



-- ============================================================
-- ======                MONITORS                        ======
-- ============================================================
hl.monitor({
    output = "DP-1",
    mode = "highres",
    position = "0x0",
    scale = 1,
})
hl.monitor({
    output = "DP-2",
    mode = "2560x1440@144",
    position = "1920x0",
    scale = 1,
})
hl.monitor({
    output = "HDMI-A-1",
    mode = "highres",
    position = "4480x0",
    scale = 0.83,
})
