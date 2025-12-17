
local wezterm = require('wezterm')
local act     = wezterm.action

local config
config = require('cnf.wezterm')


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

-- color_scheme__rnd('win')
local scheme_name_lst = scheme_my_lst.win.recommend.h
-- local scheme_name_lst = scheme_my_lst.win.recommend.m

local scheme_name = scheme_name_lst[math.random(#scheme_name_lst)]
wezterm.log_info('> ' .. scheme_name .. ' <')

-- config.color_scheme = 'AdventureTime'
config.color_scheme = scheme_name


return config


