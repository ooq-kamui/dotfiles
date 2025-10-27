
-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 100
config.initial_rows =  37

-- wezterm.on('gui-startup', function()
--   wezterm.mux.spawn_window({
--     position = {
--       x = 50,
--       y = 10,
--       origin = 'ActiveScreen',
--     },
--   })
-- end)

-- or, changing the font size and color scheme.
config.font_size = 18
config.color_scheme = 'AdventureTime'


-- config.default_prog = {'fish'}
-- config.default_prog = {'wsl'}
-- config.default_prog = {'pwsh'}


config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = false

config.window_background_opacity = 0.10
config.macos_window_background_blur = 3

config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}
config.window_background_gradient = {
  colors = { "#000000" },
}

config.use_ime = true


-- Finally, return the configuration to wezterm:
return config

