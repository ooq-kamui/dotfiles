
local wezterm = require 'wezterm'
local act     = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()


-- 
-- cmn
-- 

config.automatically_reload_config = false
-- config.automatically_reload_config = true

config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = false
-- config.tab_max_width = 16 -- ??

config.window_background_opacity    = 0.20
-- config.window_background_opacity    = 1.00
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


-- config.color_scheme = 'AdventureTime'

local function is_tbl_in(tbl, val)
  for _, value in ipairs(tbl) do
    if value == val then
      return true
    end
  end
  return false
end

local function color_scheme__rnd()

  local scheme_excld_list = {
    'Icy Dark (base16)'              ,
    'Zenburn (Gogh)'                 ,
    'Mono (terminal.sexy)'           ,
    'nighty (Gogh)'                  ,
    'Neutron'                        ,
    'Ef-Tritanopia-Light'            ,
    'FrontendDelight (Gogh)'         ,
    'Atelier Savanna (base16)'       ,
    'Gruvbox Light'                  ,
    'Unsifted Wheat (terminal.sexy)' ,
    'Google Light (base16)'          ,
    'Mona Lisa (Gogh)'               ,
    'Monokai (light) (terminal.sexy)',
    'AyuLight (Gogh)'                ,
    'OneHalfLight'                   ,
    'Hybrid'                         ,
    'Raycast_Light'                  ,
    'Harmonic16 Light (base16)'      ,
    'CLRS'                           ,
    'Homebrew (Gogh)'                ,
    'Helios (base16)'                ,
    'Monokai Vivid'                  ,
    'Sagelight (base16)'             ,
    'TokyoNightLight (Gogh)'         ,
    'Spiderman'                      ,
    'Tokyo Night Day'                ,
    'Atelier Plateau Light (base16)' ,
    'Lost Woods (terminal.sexy)'     ,
    'LunariaLight (Gogh)'            ,
    'Canvased Pastel (terminal.sexy)',
  }
  local scheme_recommend_list = {
    'Oxocarbon Dark (Gogh)'          ,
    'Purple People Eater (Gogh)'     ,
    'Builtin Pastel Dark'            ,
    'Windows High Contrast (base16)' ,
    'Espresso Libre'                 ,
    'IdleToes (Gogh)'                ,
    'Ef-Trio-Dark'                   ,
    'Dracula (Gogh)'                 ,
    'niji'                           ,
    'PaperColorDark (Gogh)'          ,
    'iTerm2 Smoooooth'               ,
  }

  local scheme_name_list = {}
  for scheme_name, scheme in pairs(wezterm.color.get_builtin_schemes()) do
    -- excld
    if is_tbl_in(scheme_excld_list, scheme_name) then
      -- skip
      -- wezterm.log_info('skip: ' .. scheme_name)
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


-- mouse

config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = act.CopyTo 'ClipboardAndPrimarySelection',
  },
  {
    event = { Down = { streak = 1, button = 'Right' } },
    mods = 'NONE',
    action = act.PasteFrom 'Clipboard',
  },
}

return config

