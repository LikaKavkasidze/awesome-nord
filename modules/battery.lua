local wibox = require("wibox")
local helpers = require("../helpers")

local battery_scale = { "", "", "", "", "", "", "", "", "", "" }

local battery_image = wibox.widget {
    forced_width = 18,
    forced_height = 18,
    align = "center",
    text = "",
    widget = wibox.widget.textbox
}

local battery_text = wibox.widget {
    widget = wibox.widget.textbox
}

local battery_bar = {
    battery_image,
    battery_text,
    layout = wibox.layout.fixed.horizontal
}

awesome.connect_signal("ears::battery", function(value)
    local icon = helpers.icon_scale(battery_scale, 100, value)

    battery_image.text = icon.." "
    battery_text.text = value.."% "
end)

return battery_bar
