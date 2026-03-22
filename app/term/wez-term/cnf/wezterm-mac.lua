
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

-- config.default_prog = {'wsl'}
-- config.default_prog = {'pwsh'}
-- config.default_prog = {'fish'}

config.font_size    =  18
-- config.initial_cols = 134
-- config.initial_rows =  37

wezterm.on('gui-startup', function()

  local scrn = wezterm.gui.screens().active
  wezterm.log_info('scrn name: ' .. scrn.name)

  local x, y, cols, rows

  if scrn.name == 'HG-245H' then
    x, y = 43, 10
    cols, rows = 167, 42

  else -- dflt 'Built-in Retina Display'
    x, y = 25, 70
    cols, rows = 134, 37
  end

  local tab, pane, win = wezterm.mux.spawn_window({
    position = {x = x, y = y, origin = 'ActiveScreen'},
    width = cols, height = rows,
  })
  pane:split({ direction = 'Right', size = 0.7 })
end)

color_scheme__rnd('mac')

return config

