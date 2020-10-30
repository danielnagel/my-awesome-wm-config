local home = os.getenv("HOME")

local _M = {
    -- default terminal
    terminal = "termite",
    -- default editor
    editor = "code",
    -- default browser
    browser = "firefox",
    -- Default modkey
    modkey = "Mod4",
    -- wallpaper
    wallpaper = home .. "/pictures/painted-mountains.jpg",
}

return _M