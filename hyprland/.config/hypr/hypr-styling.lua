-- ============================================================
-- ======                   SET THEME                    ======
-- ============================================================
local colours = require("current.color")
local style   = require("current.style")


-- ============================================================
-- ======                LOOK AND FEEL                   ======
-- ============================================================

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in          = style.gaps_in,
        gaps_out         = style.gaps_out,

        border_size      = style.border_size,

        col              = {
            active_border   = {
                colors = { "rgba(" .. colours.border1 .. "ee)", "rgba(" .. colours.border2 .. "ee)" },
                angle  = 45,
            },
            inactive_border = "rgba(" .. colours.surface1 .. "aa)",
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
        -- rounding         = 12,
        -- rounding_power = 2,

        rounding         = style.rounding_style,
        rounding_power   = style.rounding_power_style,

        active_opacity   = 1.0,
        inactive_opacity = 0.92, -- Slightly more transparent when unfocused

        shadow           = {
            enabled      = true,
            range        = style.shadow_range,
            render_power = style.shadow_render_power,
            color        = colours.shadow,
        },

        blur             = {
            enabled           = true,
            size              = style.blur_size,
            passes            = style.blur_passes,
            vibrancy          = 0.1696,
            new_optimizations = true,
        },
    },
    animations = {
        enabled = true,
    },
})

-- ============================================================
-- ======                    ANIMATIONS                  ======
-- ============================================================

hl.curve("easeOutCirc", { type = "bezier", points = { { 0.0, 0.0 }, { 0.0, 1.0 } } })       -- Very smooth start/end
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1.0 } } }) -- Classic modern ease
hl.curve("easeOutQuart", { type = "bezier", points = { { 0.16, 1.0 }, { 0.3, 1.0 } } })     -- Fast start, long smooth tail
hl.curve("easeOutCubic", { type = "bezier", points = { { 0.33, 1.0 }, { 0.66, 1.0 } } })    -- Approximation
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })

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
