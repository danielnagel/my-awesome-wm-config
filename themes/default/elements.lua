local gmc = require("themes.default.gmc")

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- -- --

-- Fonts

theme.font          = "Hack Nerd Font Mono 9" -- yay -S nerd-fonts-hack
theme.taglist_font  = "Hack Nerd Font Bold 9"

-- Colors background

theme.bg_normal     = gmc.color['grey900']     .. "cc"
theme.bg_focus      = gmc.color['blue500']    .. "cc"
theme.bg_urgent     = gmc.color['orange900'] .. "cc"
theme.bg_minimize   = gmc.color['orange500']   .. "cc"
theme.bg_systray    = gmc.color['grey100']   .. "cc"

-- Colors foreground

theme.fg_normal     = gmc.color['white']
theme.fg_focus      = gmc.color['white']
theme.fg_urgent     = gmc.color['white']
theme.fg_minimize   = gmc.color['white']

-- Client Gaps

theme.useless_gap   = dpi(4)

-- Client Borders

theme.border_width  = dpi(1)
theme.border_normal = gmc.color['grey500']   .. "cc"
theme.border_focus  = gmc.color['blue500']    .. "cc"
theme.border_marked = gmc.color['orange500'] .. "cc"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:

-- Taglist

theme.taglist_bg_focus = gmc.color['blue500'] .. "cc"
theme.taglist_fg_focus = gmc.color['white']

-- Tasklist

theme.tasklist_bg_normal = gmc.color['grey900']    .. "88"
theme.tasklist_bg_focus  = gmc.color['blue500']   .. "88"
theme.tasklist_fg_focus  = gmc.color['white']

-- Titlebar

theme.titlebar_bg_normal = gmc.color['grey900']   .. "cc"
theme.titlebar_bg_focus  = gmc.color['grey900']   .. "cc"
theme.titlebar_fg_focus  = gmc.color['white']   .. "cc"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, gmc.color['white']
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, gmc.color['blue500']
)

-- Display the taglist squares

-- override
-- theme.taglist_squares_sel      = theme_path .. "taglist/clone/square_sel.png"
-- theme.taglist_squares_unsel    = theme_path .. "taglist/clone/square_unsel.png"

-- Menu

theme.menu_height = 20      -- dpi(15)
theme.menu_width  = 180     -- dpi(100)
theme.menu_context_height = 20
theme.menu_bg_normal = gmc.color['grey900']  .. "cc"
theme.menu_bg_focus  = gmc.color['blue500'] .. "cc"
theme.menu_fg_focus  = gmc.color['white']
theme.menu_border_color = gmc.color['blue500'] .. "cc"
theme.menu_border_width = 1
