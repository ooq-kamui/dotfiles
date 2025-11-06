
local wezterm = require 'wezterm'
local act     = wezterm.action

local config
-- config = wezterm.config_builder()
config = require('cnf\\wezterm')


-- 
-- env : win
-- 

config.window_background_gradient = {
  colors = { "#000000" },
}

config.use_ime = true


-- 
-- env : win : ofc
-- 

config.default_prog = {'wsl'}
-- config.default_prog = {'pwsh'}
-- config.default_prog = {'fish'}

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

return config

