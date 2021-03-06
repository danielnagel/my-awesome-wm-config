pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Theme hanling library
local beautiful = require("beautiful")

-- Miscellanous awesome library
local menubar = require("menubar")

-- User-defined library
local freedesktop = require("freedesktop")

RC = {} -- global namespace, on top before require any modules
RC.vars = require("main.user-variables")
modkey = RC.vars.modkey

-- Error handling
require("main.error-handling")

-- Themes
require("main.theme")

-- -- --

-- Calling all Module Libraries

-- Custom Local Library
local main = {
    layouts = require("main.layouts"),
    tags = require("main.tags"),
    menu = require("main.menu"),
    rules = require("main.rules"),
}

-- Custom Local Library: Keys and Mouse Binding
local binding = {
    globalbuttons = require("binding.globalbuttons"),
    clientbuttons = require("binding.clientbuttons"),
    globalkeys = require("binding.globalkeys"),
    bindtotags = require("binding.bindtotags"),
    clientkeys = require("binding.clientkeys"),
}

-- Layouts
RC.layouts = main.layouts()

-- Tags
RC.tags = main.tags()

-- RC.mainmenu
RC.mainmenu = freedesktop.menu.build(main.menu())
RC.launcher = awful.widget.launcher(
    { image = beautiful.awesome_icon, menu = RC.mainmenu }
)
menubar.utils.terminal = RC.vars.terminal

-- Mouse and Key bindings
RC.globalkeys = binding.globalkeys()
RC.globalkeys = binding.bindtotags(RC.globalkeys)

-- Set root
root.buttons(binding.globalbuttons())
root.keys(RC.globalkeys)

-- Rules
awful.rules.rules = main.rules(
    binding.clientkeys(),
    binding.clientbuttons()
)

-- Signals
require("main.signals")

-- Statusbar: Wibar
local statusbar = require("statusbar.statusbar")
statusbar()
