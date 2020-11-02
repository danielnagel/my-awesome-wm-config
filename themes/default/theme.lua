local awful = require("awful")
awful.util = require("awful.util")

theme_path = awful.util.getdir("config") .. "/themes/default/"

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- default variables

theme = {}

dofile(theme_path .. "elements.lua")
dofile(theme_path .. "titlebar.lua")
dofile(theme_path .. "layouts.lua")
dofile(theme_path .. "widget.lua")

theme.awesome_icon       = theme_path .. "icons/logo20_arch_blue.png"
theme.awesome_subicon    = theme_path .. "icons/logo20_arch_blue.png"

return theme


