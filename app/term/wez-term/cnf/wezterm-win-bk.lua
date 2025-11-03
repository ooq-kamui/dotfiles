
-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.


-- env : win ofc

config.default_prog = {'wsl'}
-- config.default_prog = {'pwsh'}

config.font_size = 13

-- For example, changing the initial geometry for new windows:
config.initial_cols = 183
config.initial_rows =  40

wezterm.on('gui-startup', function()
  wezterm.mux.spawn_window({
    position = {
      x = 50,
      y = 10,
      origin = 'ActiveScreen',
    },
  })
end)

-- cmn

config.automatically_reload_config = false
-- config.automatically_reload_config = true

-- or, changing the font size and color scheme.
config.color_scheme = 'AdventureTime'

config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = false

config.window_background_opacity    = 0.10
config.macos_window_background_blur = 3

config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg   = "none",
}

config.default_cursor_style = "SteadyBlock"
config.colors = {
  cursor_fg     = "White",
  cursor_bg     = "#59c2c6",
  cursor_border = "#59c2c6",
}

config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }


-- win

config.window_background_gradient = {
  colors = { "#000000" },
}

config.use_ime = true


return config

