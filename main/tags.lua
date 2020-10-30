-- Standard awesome library
local awful = require("awful")

local _M = {}

-- -- --

function _M.get()
    tags = {}

    local tagpairs = {
        names = {
            "1", "2", "3", "4", "5", "6", "7", "8", "9"
        },
        layouts = {
            RC.layouts[1], RC.layouts[2], RC.layouts[3],
            RC.layouts[4], RC.layouts[5], RC.layouts[6],
            RC.layouts[7], RC.layouts[8], RC.layouts[9]
        }
    }

    awful.screen.connect_for_each_screen(function(s)
        -- Each screen has its own tag table.
        tags[s] = awful.tag(tagpairs.names, s, tagpairs.layout)
    end)

    return tags
end

-- -- --

return setmetatable(
    {},
    { __call = function(_, ...) return _M.get(...) end }
)