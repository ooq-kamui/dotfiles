
local wezterm = require 'wezterm'
local act     = wezterm.action

local config
-- config = wezterm.config_builder()
config = require('cnf\\wezterm')

-- -- 
-- -- cmn
-- -- 
-- 
-- config.automatically_reload_config = false
-- -- config.automatically_reload_config = true
-- 
-- -- or, changing the font size and color scheme.
-- config.color_scheme = 'AdventureTime'
-- 
-- config.window_decorations = "RESIZE"
-- config.hide_tab_bar_if_only_one_tab = false
-- -- config.tab_max_width = 16 -- ??
-- 
-- config.window_background_opacity    = 0.20
-- -- config.window_background_opacity    = 1.00
-- config.macos_window_background_blur = 3
-- 
-- config.window_frame = {
--   inactive_titlebar_bg = "none",
--   active_titlebar_bg   = "none",
-- }
-- 
-- config.default_cursor_style = "SteadyBlock"
-- config.colors = {
--   cursor_fg     = "White",
--   cursor_bg     = "#59c2c6",
--   cursor_border = "#59c2c6",
-- }
-- 
-- config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
-- 
-- -- mouse
-- 
-- config.mouse_bindings = {
--   {
--     event = { Up = { streak = 1, button = 'Left' } },
--     mods = 'NONE',
--     action = act.CopyTo 'ClipboardAndPrimarySelection',
--   },
--   {
--     event = { Down = { streak = 1, button = 'Right' } },
--     mods = 'NONE',
--     action = act.PasteFrom 'Clipboard',
--   },
-- }


function color_scheme__rnd()

  -- local wezterm = require 'wezterm'

  -- The set of schemes that we like and want to put in our rotation
  local schemes = {}
  for name, scheme in pairs(wezterm.color.get_builtin_schemes()) do

    -- excld -- todo

    table.insert(schemes, name)
  end

  wezterm.on('window-config-reloaded', function(window, pane)
    -- If there are no overrides, this is our first time seeing
    -- this window, so we can pick a random scheme.
    if not window:get_config_overrides() then
      -- Pick a random scheme name
      local scheme = schemes[math.random(#schemes)]
      wezterm.log_info(scheme)
      window:set_config_overrides {
        color_scheme = scheme,
      }
    end
  end)

  return {}
end
color_scheme__rnd()


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

