
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

local scheme_list = {}
scheme_list.excld = {
  '3024 Day (Gogh)'                       ,
  'Atelier Cave (base16)'                 ,
  'Atelier Plateau Light (base16)'        ,
  'Atelier Savanna (base16)'              ,
  'Atelier Heath Light (base16)'          ,
  'Atelierseaside (light) (terminal.sexy)',
  'AyuLight (Gogh)'                       ,
  'CLRS'                                  ,
  'Canvased Pastel (terminal.sexy)'       ,
  'Ciapre (Gogh)'                         ,
  'Count Von Count (terminal.sexy)'       ,
  'CrayonPonyFish'                        ,
  'Ef-Dark'                               ,
  'Ef-Frost'                              ,
  'Ef-Tritanopia-Light'                   ,
  'Eva Dim (base16)'                      ,
  'FrontendDelight (Gogh)'                ,
  'Github'                                ,
  'Google Light (base16)'                 ,
  'Greenscreen (dark) (terminal.sexy)'    ,
  'Gruvbox Light'                         ,
  'Harmonic16 Light (base16)'             ,
  'Helios (base16)'                       ,
  'Homebrew (Gogh)'                       ,
  'Hybrid'                                ,
  'Icy Dark (base16)'                     ,
  'Lavandula (Gogh)'                      ,
  'Light White (terminal.sexy)'           ,
  'LiquidCarbon'                          ,
  'Lost Woods (terminal.sexy)'            ,
  'LunariaLight (Gogh)'                   ,
  'MaterialDark'                          ,
  'Mona Lisa (Gogh)'                      ,
  'Mono (terminal.sexy)'                  ,
  'Mono Green (Gogh)'                     ,
  'Monokai (light) (terminal.sexy)'       ,
  'Monokai Vivid'                         ,
  'Neutron'                               ,
  'OneHalfLight'                          ,
  'Pro (Gogh)'                            ,
  'Raycast_Light'                         ,
  'Sagelight (base16)'                    ,
  'Solarized Dark - Patched'              ,
  'Spiderman'                             ,
  'Tokyo Night Day'                       ,
  'TokyoNightLight (Gogh)'                ,
  'Unsifted Wheat (terminal.sexy)'        ,
  'Zenburn (Gogh)'                        ,
  'nighty (Gogh)'                         ,
  'summercamp (base16)'                   ,
  'HemisuLight (Gogh)'                    ,
  'NightLion v1'                          ,
  'Edge Light (base16)'                   ,
  'Eldorado dark (terminal.sexy)'         ,
  'Belafonte Day'                         ,
  'Vacuous 2 (terminal.sexy)'             ,
}
scheme_list.recommend = {
  'UltraViolent'                          , -- <
  'niji'                                  , -- <
  'Borland'                               , -- <
  'VibrantInk'                            , -- <
  'Builtin Pastel Dark'                   ,
  'Dracula (Gogh)'                        ,
  'Ef-Trio-Dark'                          ,
  'Espresso Libre'                        ,
  'IdleToes (Gogh)'                       ,
  'Jellybeans'                            ,
  'Oxocarbon Dark (Gogh)'                 ,
  'PaperColorDark (Gogh)'                 ,
  'Purple People Eater (Gogh)'            ,
  'Red Alert'                             ,
  'Windows High Contrast (base16)'        ,
  'iTerm2 Smoooooth'                      ,
  'Purple Rain'                           ,
}

local function color_scheme__rnd()

  local scheme_name_list = {}
  for scheme_name, scheme in pairs(wezterm.color.get_builtin_schemes()) do
    -- excld
    if is_tbl_in(scheme_list.excld, scheme_name) then
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

