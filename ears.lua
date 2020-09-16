local awful = require("awful")
local naughty = require("naughty")

-- Periodically get battery info
awful.widget.watch("cat /sys/class/power_supply/BAT0/capacity", 10, function(widget, stdout)
    awesome.emit_signal("ears::battery", tonumber(stdout))
end)

-- Fetch processor temperature
awful.widget.watch('bash -c "sensors | grep \"temp1\" | head -n1 | cut -d\"+\" -f2 | cut -d\".\" -f1"', 5, function(widget, stdout)
    awesome.emit_signal("ears::cpu_t", tonumber(stdout))
end)