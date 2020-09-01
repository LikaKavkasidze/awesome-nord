local awful = require("awful")

-- Periodically get battery info
awful.widget.watch("cat /sys/class/power_supply/BAT0/capacity", 10, function(widget, stdout)
    awesome.emit_signal("ears::battery", tonumber(stdout))
end)
