--[[
     Original Source Modified From: github.com/copycat-killer
     https://github.com/copycat-killer/awesome-copycats/blob/master/rc.lua.multicolor
--]]

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Standard awesome library
local awful     = require("awful")
local beautiful = require("beautiful")

-- Wibox handling library
local wibox = require("wibox")
local lain = require("lain")

-- Custom Local Library
local gmc = require("themes.default.gmc")

-- Custom Lain widgets
local updates = require("statusbar.widgets.updates")

-- -- --

local W = {}
clone_widget_set = W           -- object name

local I = {}
clone_icon_set = I             -- object name

-- split module, to make each file shorter,
-- all must have same package name

-- global for all splited
markup      = lain.util.markup

-- -- --

-- MEM
I.mem = wibox.widget.imagebox(beautiful.widget_mem)
W.mem = lain.widget.mem({
  settings = function()
    widget:set_markup(markup(gmc.color['deepOrange300'], mem_now.used .. "M "))
  end
})

-- -- --

-- CPU
I.cpu = wibox.widget.imagebox(beautiful.widget_cpu)
W.cpu = lain.widget.cpu({
  settings = function()
    widget:set_markup(markup(gmc.color['green300'], cpu_now.usage .. "% "))
  end
})

-- -- --

-- fs
I.fs = wibox.widget.imagebox(beautiful.widget_fs)
W.fs = lain.widget.fs({
  notification_preset = {
      position = "bottom_left"
  },
  settings  = function()
    widget:set_markup(markup(gmc.color['teal300'], fs_now["/"].percentage .. "% "))
  end
})

-- -- --

-- Volume
I.volume = wibox.widget.imagebox(beautiful.widget_vol)
W.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            volume_now.level = volume_now.level .. "M"
        end

        widget:set_markup(markup(gmc.color['yellow300'], volume_now.level .. "% "))
    end
})


-- -- --

-- MPD
I.mpd = wibox.widget.imagebox(beautiful.widget_note)
W.mpd = lain.widget.mpd({
    settings = function()
        mpd_notification_preset = {
            text = string.format("%s [%s] - %s\n%s", mpd_now.artist,
                   mpd_now.album, mpd_now.date, mpd_now.title)
        }

        if mpd_now.state == "play" then
            artist = mpd_now.artist .. " > "
            title  = mpd_now.title .. " "
            I.mpd:set_image(beautiful.widget_note_on)
        elseif mpd_now.state == "pause" then
            artist = "mpd "
            title  = "paused "
        else
            artist = ""
            title  = ""
            I.mpd:set_image(nil)
        end
        widget:set_markup(markup(gmc.color['blue300'], artist)
            .. markup(gmc.color['orange300'], title))
    end
})

-- -- --

-- Textclock
I.clock = wibox.widget.imagebox(beautiful.widget_clock)
os.setlocale(os.getenv("LANG"))
W.textclock = awful.widget.textclock(
    markup(gmc.color['blue300'], "%A %d %B ")
        .. markup(gmc.color['grey300'], ">")
        .. markup(gmc.color['orange300'], " %H:%M "))

-- -- --

-- Calendar
W.calendar = lain.widget.cal({
    attach_to = { W.textclock },
    notification_preset = {
        font = "Terminus 10",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal,
        position = "bottom_right"
    },
    week_number = "left",
    icons = "",
    followtag = true,
})


-- -- --

-- Weather
I.weather = wibox.widget.imagebox(beautiful.widget_weather)
W.weather = lain.widget.weather({
    city_id = 2871034,
    notification_preset = {
        position = "bottom_left"
    },
    settings = function()
        descr = weather_now["weather"][1]["description"]:lower()
        units = math.floor(weather_now["main"]["temp"])
        widget:set_markup(markup(gmc.color['pink300'], descr .. " @ " .. units .. "°C "))
    end
})


-- -- --

-- Net
I.netdown = wibox.widget.imagebox(beautiful.widget_netdown)
W.netdowninfo = wibox.widget.textbox()
I.netup = wibox.widget.imagebox(beautiful.widget_netup)
W.netupinfo = lain.widget.net({
    settings = function()
        local fg_color_up   = "#e54c62"
        local fg_color_down = "#87af5f"
        widget:set_markup(markup(fg_color_up, net_now.sent .. " "))
        W.netdowninfo:set_markup(markup(fg_color_down, net_now.received .. " "))
    end
})

-- -- --

-- Updates
I.updates = wibox.widget.imagebox(beautiful.widget_mail)
W.updates = updates({
    notification_preset = {
        position = "bottom_left"
    },
    settings = function()
	    widget:set_markup(markup.fontfg(theme.font, gmc.color["red300"], count .. " "))
    end
})
