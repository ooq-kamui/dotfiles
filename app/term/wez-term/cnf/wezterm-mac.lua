
local wezterm = require 'wezterm'
local act     = wezterm.action

local config = require('cnf/wezterm')


-- 
-- env : mac
-- 

-- config.window_background_opacity    = 0.50
config.window_background_opacity    = 0.40

config.window_background_gradient = {
  -- colors = { "blue" },
  colors = { "darkblue" },
  -- colors = { "red" },
  -- colors = { "darkred" },
}

config.use_ime = true
config.macos_forward_to_ime_modifier_mask = 'SHIFT|CTRL'


-- 
-- env : mac : inch-14
-- 

-- config.default_prog = {'wsl'}
-- config.default_prog = {'pwsh'}
-- config.default_prog = {'fish'}

config.font_size = 18

-- For example, changing the initial geometry for new windows:
config.initial_cols = 89
config.initial_rows = 37

wezterm.on('gui-startup', function()
  wezterm.mux.spawn_window({
    position = {
      x = 1000,
      y =    0,
      origin = 'ActiveScreen',
    },
  })
end)

color_scheme__rnd('mac')

return config

