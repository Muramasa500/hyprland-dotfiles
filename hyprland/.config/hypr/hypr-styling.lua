-- ============================================================
-- ======                LOOK AND FEEL                   ======
-- ============================================================

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in          = 8,
        gaps_out         = 10,

        border_size      = 2,

        -- Catppuccin mocchiato
        -- col              = {
        --     active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
        --     inactive_border = "rgba(595959aa)",
        -- },

        -- Catppuccin mocha
        col              = {
            active_border   = { colors = { "rgba(cba6f7ff)", "rgba(a6e3a1ff)" }, angle = 45 },
            inactive_border = "rgba(45475a80)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing    = false,

        layout           = "dwindle",
    },


    -- ============================================================
    -- ======                  DECORATION                    ======
    -- ============================================================

    decoration = {
        rounding         = 12, -- Slightly rounder corners (10 -> 12)
        rounding_power   = 2,

        active_opacity   = 1.0,
        inactive_opacity = 0.92, -- Slightly more transparent when unfocused

        shadow           = {
            enabled      = true,
            range        = 12,               -- Wider shadow range (4 -> 12) for a softer glow
            render_power = 3,
            color        = "rgba(000000bb)", -- Softer black shadow
        },

        blur             = {
            enabled           = true,
            size              = 6,    -- Stronger blur (2 -> 6)
            passes            = 2,    -- More passes for smoother blur (1 -> 2)
            vibrancy          = 0.1696,
            new_optimizations = true, -- Enable newer blur optimizations
        },
    },
    animations = {
        enabled = true,
    },
})

-- ============================================================
-- ======                    ANIMATIONS                  ======
-- ============================================================

-- Define smoother, more modern curves
hl.curve("easeOutCirc", { type = "bezier", points = { { 0.0, 0.0 }, { 0.0, 1.0 } } })       -- Very smooth start/end
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1.0 } } }) -- Classic modern ease
hl.curve("easeOutQuart", { type = "bezier", points = { { 0.16, 1.0 }, { 0.3, 1.0 } } })     -- Fast start, long smooth tail
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("easeOutCirc", { type = "bezier", points = { { 0.0, 0.0 }, { 0.0, 1.0 } } })
hl.curve("easeOutCubic", { type = "bezier", points = { { 0.33, 1.0 }, { 0.66, 1.0 } } }) -- Approximation
hl.curve("easeOutQuart", { type = "bezier", points = { { 0.16, 1.0 }, { 0.3, 1.0 } } })


hl.animation({ leaf = "global", enabled = true, speed = 8.0, bezier = "easeOutCubic" })
hl.animation({ leaf = "border", enabled = true, speed = 6.0, bezier = "easeOutQuart" })
hl.animation({ leaf = "windows", enabled = true, speed = 5.0, bezier = "easeOutCubic" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.5, bezier = "easeOutCirc", style = "popin 90%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3.5, bezier = "easeOutCubic", style = "popin 90%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 5.0, bezier = "easeOutCubic" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 4.0, bezier = "easeOutCubic" })
hl.animation({ leaf = "fade", enabled = true, speed = 6.0, bezier = "easeOutCirc" })
hl.animation({ leaf = "layers", enabled = true, speed = 5.5, bezier = "easeOutCubic" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 5.0, bezier = "easeOutCirc", style = "popin 90%" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 3.5, bezier = "easeOutCubic", style = "popin 90%" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 5.0, bezier = "easeOutCubic" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 3.5, bezier = "easeOutCubic" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 4.5, bezier = "easeOutCirc", style = "slide" }) -- Changed to 'slide' for smoother workspace switching
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 4.5, bezier = "easeOutCirc", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 4.5, bezier = "easeOutCirc", style = "slide" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 8.0, bezier = "easeOutCirc" })
