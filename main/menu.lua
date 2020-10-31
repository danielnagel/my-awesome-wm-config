-- Theme handling library
local beautiful = require("beautiful") -- for awesome.icon

local M = {} -- menu
local _M = {} -- module

-- -- --

-- This is used later as the default terminal and editor to run.
local terminal = RC.vars.terminal

-- Variable definitions
-- This is used later as the default terminal and editor to run.
local editor = os.getenv("EDITOR") or "vim"
local editor_cmd = terminal .. " -e " .. editor

-- -- --

M.awesome = {
    { "manual", terminal .. " -e man awesome" },
    { "edit config", editor_cmd .. " " .. awesome.conffile },
    { "Terminal", terminal },
    { "Shutdown/Logout", "oblogout" },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end }
}

-- -- --

function _M.get()

    -- Main Menu
    local menu_items = {
      before = {
        { "awesome", M.awesome, beautiful.awesome_icon }
      },
      after = {
        { "open terminal", terminal }
      },
    }
  
    return menu_items
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
  