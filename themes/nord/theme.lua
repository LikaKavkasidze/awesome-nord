----------------------------
--   Nord awesome theme   --
----------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = os.getenv("HOME") .. "/.config/awesome/themes/"

local theme = {}

theme.color_nord0   = "#2e3440"
theme.color_nord1   = "#3b4252"
theme.color_nord2   = "#434c5e"
theme.color_nord3   = "#4c566a"
theme.color_nord4   = "#d8dee9"
theme.color_nord5   = "#e5e9f0"
theme.color_nord6   = "#eceff4"
theme.color_nord7   = "#8fbcbb"
theme.color_nord8   = "#88c0d0"
theme.color_nord9   = "#81a1c1"
theme.color_nord10  = "#5e81ac"
theme.color_nord11  = "#bf616a"
theme.color_nord12  = "#d08770"
theme.color_nord13  = "#ebcb8b"
theme.color_nord14  = "#a3be8c"
theme.color_nord15  = "#b48ead"

theme.font          = "Liberation Sans 8"
theme.icon_font     = "FiraMono Nerd Font 10"

theme.bg_normal     = theme.color_nord0
theme.bg_focus      = theme.color_nord2
theme.bg_urgent     = theme.color_nord11
theme.bg_minimize   = theme.bg_normal
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = theme.color_nord4
theme.fg_focus      = theme.color_nord6
theme.fg_urgent     = theme.fg_focus
theme.fg_minimize   = theme.fg_focus

theme.useless_gap   = dpi(0)
-- We are in 2020, no one uses borders anymore.
theme.border_width  = dpi(0)
theme.border_normal = "#ffffff"
theme.border_focus  = "#ffffff"
theme.border_marked = "#ffffff"

theme.taglist_font          = theme.icon_font
theme.taglist_fg_empty      = theme.color_nord3
theme.taglist_fg_focus      = theme.color_nord5
theme.taglist_fg_occupied   = theme.taglist_fg_focus

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. "nord/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."nord/titlebar/close_normal.svg"
theme.titlebar_close_button_focus  = themes_path.."nord/titlebar/close_normal.svg"

theme.titlebar_minimize_button_normal = themes_path.."nord/titlebar/minimize_normal.svg"
theme.titlebar_minimize_button_focus  = themes_path.."nord/titlebar/minimize_normal.svg"

theme.titlebar_maximized_button_normal_inactive = themes_path.."nord/titlebar/maximized_normal.svg"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."nord/titlebar/maximized_normal.svg"
theme.titlebar_maximized_button_normal_active = themes_path.."nord/titlebar/maximized_normal.svg"
theme.titlebar_maximized_button_focus_active  = themes_path.."nord/titlebar/maximized_normal.svg"

theme.wallpaper = os.getenv("HOME") .. "/Images/Wallpapers/Nordic1.jpg"

-- You can use your own layout icons like this:
theme.layout_floating  = themes_path.."nord/layouts/floatingw.png"
theme.layout_tile = themes_path.."nord/layouts/tilew.png"
theme.layout_tilebottom = themes_path.."nord/layouts/tilebottomw.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
