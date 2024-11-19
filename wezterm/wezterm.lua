local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font('JetBrains Mono', {
    weight = 'Bold',
    stretch = 'Normal',
    italic = false
})
config.font_size = 14.0

return config