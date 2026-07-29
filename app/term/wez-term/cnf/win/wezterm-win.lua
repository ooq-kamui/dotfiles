
local wezterm = require('wezterm')
local act     = wezterm.action

local config = require('cnf.wezterm')


-- 
-- env : win
-- 

config.window_background_opacity    = 0.20

config.window_background_gradient = {
  colors = { "#000000" },
}

config.use_ime = true



-- 
-- env : win : ofc
-- 

config.wsl_domains = {
  {
    name = 'wsl:alm-10-my-01',
    distribution = 'alm-10-my-01',
    default_cwd = '~',
  },
}

config.default_domain = 'wsl:alm-10-my-01'

config.default_prog = {'wsl'}
-- config.default_prog = {'pwsh'}
-- config.default_prog = {'fish'}

config.font_size = 13

gui_startup({
  ['_default'] = { x = 50, y = 10, cols = 183, rows = 40 },
})

color_scheme__rnd('win')

return config

