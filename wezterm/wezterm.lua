local wezterm = require 'wezterm'
local config = {}

config.front_end = 'WebGpu'

config.font = wezterm.font('JetBrains Mono', {
    weight = 'Bold',
    stretch = 'Normal',
    italic = false
})
config.font_size = 14.0

config.color_scheme = 'Tender (Gogh)'

config.window_decorations = "RESIZE"

return config