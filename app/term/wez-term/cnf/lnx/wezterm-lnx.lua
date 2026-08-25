
local wezterm = require 'wezterm'
local act     = wezterm.action

local config = require('cnf/wezterm')

-- 
-- env : mac
-- 

config.window_background_opacity    = 0.40 -- = 0.50

config.window_background_gradient = {
  colors = { "darkblue" },
  -- colors = { "blue" },
  -- colors = { "red" },
  -- colors = { "darkred" },
}

config.use_ime = true
config.macos_forward_to_ime_modifier_mask = 'SHIFT|CTRL'

-- 
-- env : mac : inch-14
-- 

config.default_prog = {'/usr/bin/fish'}
-- config.default_prog = {'fish'}
-- config.default_prog = {'wsl'}
-- config.default_prog = {'pwsh'}

config.font_size    =  18
-- config.initial_cols = 134
-- config.initial_rows =  37

-- gui_startup({
--   ['HG-245H']  = { x = 43, y = 10, cols = 167, rows = 42 },
--   ['_default'] = { x = 25, y = 70, cols = 134, rows = 37 },
-- })

color_scheme__rnd('lnx')

return config

