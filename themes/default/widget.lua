local icondir = ""

-- Font Awesome

-- Script for changing color of every icon: for file in ./*; do convert $file -fuzz 50% -fill white -opaque black "${file//.png}-white.png" ; done

icondir = theme_path .. "icons/widget/"

theme.widget_example      = icondir .. "cat.png"
theme.widget_wifi         = icondir .. "wifi.png"
theme.widget_temp         = icondir .. "thermometer-half.png"
theme.widget_uptime       = icondir .. "charging-station.png"
theme.widget_cpu          = icondir .. "microchip-white.png"
theme.widget_fs           = icondir .. "hdd-white.png"
theme.widget_mem          = icondir .. "memory-white.png"
theme.widget_note         = icondir .. "volume-mute-white.png"
theme.widget_note_on      = icondir .. "music-white.png"
theme.widget_batt         = icondir .. "battery-full.png"
theme.widget_clock        = icondir .. "clock-white.png"
theme.widget_vol          = icondir .. "volume-up-white.png"
theme.widget_weather      = icondir .. "cloud-white.png"
theme.widget_netdown      = icondir .. "download-white.png"
theme.widget_netup        = icondir .. "upload-white.png"
theme.widget_mail         = icondir .. "shield-alt-white.png"

theme.monitor_disk        = icondir .. "hdd.png"
theme.monitor_vol         = icondir .. "volume-up.png"
theme.monitor_vol_low     = icondir .. "volume-down.png"
theme.monitor_vol_no      = icondir .. "volume-off.png"
theme.monitor_vol_mute    = icondir .. "volume-mute.png"

theme.monitor_ac          = icondir .. "charging-station.png"
theme.monitor_bat         = icondir .. "battery-three-quarters.png"
theme.monitor_bat_low     = icondir .. "battery-quarters.png"
theme.monitor_bat_no      = icondir .. "battery-empty.png"
