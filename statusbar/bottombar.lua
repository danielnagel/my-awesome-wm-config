-- Standard awesome library
local awful     = require("awful")
local beautiful = require("beautiful")

-- Wibox handling library
local wibox = require("wibox")
local lain  = require("lain")

-- Custom Local Library
require("statusbar.lain")
local gmc = require("themes.default.gmc")

-- -- --

local WB = wibox_package

function WB.initdeco ()
    -- Spacer
    WB.spacer = wibox.widget.textbox(" ")
    WB.spacerline = wibox.widget.textbox(" | ")
end

-- -- --

function WB.add_widgets_monitor_left (line, s)
  local cws = clone_widget_set
  local cis = clone_icon_set

  return {
    layout = wibox.layout.fixed.horizontal,

    WB.spacer,

    -- net
    cis.netdown, cws.netdowninfo,
    cis.netup, cws.netupinfo,

    -- mem
    WB.spacerline,
    cis.mem, cws.mem,

    -- cpu
    WB.spacerline,
    cis.cpu, cws.cpu,

    -- fs
    WB.spacerline,
    cis.fs, cws.fs,

    -- updates
    WB.spacerline,
    cws.updates,
    
    --  wheather
    WB.spacerline,
    cis.weather, cws.weather,

    -- volume
    WB.spacerline,
    cis.volume, cws.volume,

    -- mpd
    WB.spacerline,
    cis.mpd, cws.mpd,

    -- at last
    WB.spacer,
  }
end

-- -- --

function WB.add_widgets_monitor_right (line, s)
  local cws = clone_widget_set
  local cis = clone_icon_set

  return {
    layout = wibox.layout.fixed.horizontal,

    --  time
    cis.clock,   cws.textclock,

    -- at last
    WB.spacer
  }
end

-- -- --

function WB.generate_wibox_bottom (s)
  -- layout: l_left, l_mid, tasklist

  -- Create the wibox
  s.wibox_two = awful.wibar({ position = "bottom", screen = s })

  -- Add widgets to the wibox
  s.wibox_two:setup {
    layout = wibox.layout.align.horizontal,
    WB.add_widgets_monitor_left (s),
    WB.spacer,
    WB.add_widgets_monitor_right (s),
  }
end
