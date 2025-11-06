
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

local function is_tbl_in(tbl, val)
    for _, value in ipairs(tbl) do
        if value == val then
            return true
        end
    end
    return false
end

function color_scheme__rnd()

  local scheme_excld_list = {
    'Icy Dark (base16)',
  }

  local scheme_name_list = {}
  for scheme_name, scheme in pairs(wezterm.color.get_builtin_schemes()) do
    -- excld
    if is_tbl_in(scheme_excld_list, scheme_name) then
      -- skip
      wezterm.log_info('skip: ' .. scheme_name)
    else
      table.insert(scheme_name_list, scheme_name)
    end
  end

  wezterm.on('window-config-reloaded', function(window, pane)
    if not window:get_config_overrides() then
      local scheme_name = scheme_name_list[math.random(#scheme_name_list)]
      wezterm.log_info(scheme_name .. '<')
      window:set_config_overrides {
        color_scheme = scheme_name,
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

