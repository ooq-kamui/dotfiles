
math.randomseed(os.time())

local wezterm = require('wezterm')
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


require('cnf/utl')
scheme_my_lst = require('cnf/wezterm-scheme-lst')

-- config.color_scheme = 'AdventureTime'

function color_scheme__rnd(env)

  local scheme_name_lst = {}

  if     env == 'mac' then

    local scheme_excld_lst = {}
    scheme_excld_lst = utl.tbl.cct(scheme_excld_lst, scheme_my_lst[env].excld      )
    scheme_excld_lst = utl.tbl.cct(scheme_excld_lst, scheme_my_lst[env].recommend.h)
    scheme_excld_lst = utl.tbl.cct(scheme_excld_lst, scheme_my_lst[env].recommend.m)

    for scheme_name, scheme in pairs(wezterm.color.get_builtin_schemes()) do
      if utl.tbl.is_in(scheme_excld_lst, scheme_name) then -- excld
        -- skip
      else
        table.insert(scheme_name_lst, scheme_name)
      end
    end

  elseif env == 'win' then

    scheme_name_lst = utl.tbl.cct(scheme_name_lst, scheme_my_lst[env].recommend.h)
    scheme_name_lst = utl.tbl.cct(scheme_name_lst, scheme_my_lst[env].recommend.m)
  end

  wezterm.on('window-config-reloaded', function(window, pane)
    if not window:get_config_overrides() then
      local scheme_name = scheme_name_lst[math.random(#scheme_name_lst)]

      wezterm.log_info('> ' .. scheme_name .. ' <')

      if env == 'win' then
        wezterm.log_info(env)
        -- dev
        -- local cmd = '"' .. scheme_name .. '" | Out-String -NoNewline | clip'
        -- local cmd = 'echo -n ' .. scheme_name .. '" | clip'
        -- wezterm.log_info(cmd)
        -- os.execute(cmd)
      end

      window:set_config_overrides {
        color_scheme = scheme_name,
      }
    end
  end)

  return {}
end


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

