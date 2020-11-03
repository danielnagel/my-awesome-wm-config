--[[

      * (c) 2020,      Daniel Nagel

--]]

local helpers     = require("lain.helpers")
local focused	  = require("awful.screen").focused
local wibox       = require("wibox")
local naughty	  = require("naughty")
local type	  = type
local popen	  = io.popen
local format	  = string.format
local tconcat	  = table.concat

-- checkudpates
-- lain.widget.uc

local function factory(args)
    local uc	    = { widget = wibox.widget.textbox() }
    local args	    = args or {}
    local timeout   = args.timeout or 600
    local showpopup = args.showpopup or "on"
    local settings  = args.settings or function() end

    uc.followtag = args.followtag or false
    uc.notification_preset = args.notification_preset

    if not uc.notification_preset then
	uc.notification_preset = {
	    font = "Monospace 10",
	    fg = "#FFFFFF",
	    bg = "#000000"
	}
    end

    function uc.hide()
	if not uc.notification then return end
	naughty.destroy(uc.notification)
	uc.notification = nil
    end

    function uc.show(second, scr)
	uc.hide(); uc.update()
	uc.notification_preset.screen = uc.followtag and focused() or scr or 1
	uc.notification = naughty.notify {
	    preset = uc.notification_preset,
	    timeout = type(seconds) == "number" and seconds or 5
	}
    end

    function uc.update()
	local notifytable = { [1] = format("%s\n", "available updates:") }
        local f, err = popen("checkupdates")
        updatecount = 0

	if not err then
	    local line = f:read()
	    while line ~= nil do
		updatecount = updatecount + 1
		notifytable[#notifytable+1] = format("\n%s", line)
		line = f:read()
	    end
	end

	f:close()

	count = updatecount

        widget = uc.widget
        settings()

	uc.notification_preset.text = tconcat(notifytable)
    end

    if showpopup == "on" then
	uc.widget:connect_signal("mouse::enter", function () uc.show(0) end)
	uc.widget:connect_signal("mouse::leave", function () uc.hide() end)
    end

    helpers.newtimer("uc", timeout, uc.update)

    return uc
end

return factory
