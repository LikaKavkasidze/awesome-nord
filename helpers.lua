local awful = require("awful")
local naughty = require("naughty")

local helpers = {}

-- Volume control using ALSA
-- Pass a value between -100 and +100
-- Positive values increase the volume, negative values decreases it.
-- If zero is given, then mute is toggled
helpers.volume_control = function(step)
    local cmd

    -- Match if we're using headphones
    awful.spawn.with_line_callback([[bash -c 'cat "/proc/asound/card1/codec#0"  \
        | grep -A4 "Headphone Playback Switch"  \
        | grep "Amp-Out vals:  \[0x00 0x00\]"   \
        > /dev/null; echo $?']], {
        stdout = function(line)
            local device

            if line == "0" then
                device = "Headphone"
            else
                device = "Speaker"
            end

            if step == 0 then
                cmd = "amixer -q sset "..device.." toggle_muted"
            else
                amixer_value = step > 0 and tostring(step).."%+" or tostring(-step).."%-"
                cmd = "amixer -q sset "..device.." unmuted && amixer -q sset "..device.." "..amixer_value
            end
        
            awful.spawn.with_shell(cmd)
        end,
        stderr = function(line)
            naughty.notify { text = "ERR: "..line }
        end,
    })
end

luminosity_storage = ""

-- Brightness control with X.org tools (xbacklight)
-- Pass a value between -100 and +100
-- Positive values increase the brightness, negative values decreases it.
-- If zero is given, then screen darkening is toggled
helpers.brightness_control = function(step)
    local cmd

    if step == 0 then
        awful.spawn.with_line_callback("xbacklight -get", {
            stdout = function(line)
                if line == "0" then
                    cmd = "xbacklight -set "..luminosity_storage
                else
                    luminosity_storage = line
                    cmd = "xbacklight -set 0"
                end
            end,
            stderr = function(line)
                naughty.notify { text = "ERR: "..line }
            end,
        })
    else
        xback_value = step > 0 and "inc "..tostring(step) or "dec "..tostring(-step)
        cmd = "xbacklight -"..xback_value
    end

    awful.spawn.with_shell(cmd)
end

return helpers
