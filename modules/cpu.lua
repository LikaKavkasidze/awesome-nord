local wibox = require("wibox")

local cpu_text = {
    {
        forced_width = 18,
        forced_height = 18,
        align = "center",
        text = "",
        widget = wibox.widget.textbox
    },
    wibox.widget.textbox("---"),
    layout = wibox.layout.fixed.horizontal
}

awesome.connect_signal("ears::cpu_t", function(value)
    cpu_text[2].text = value.." °C"
end)

return cpu_text