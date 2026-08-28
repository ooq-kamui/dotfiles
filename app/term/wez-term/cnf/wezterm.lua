
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

-- config.window_background_opacity    = 0.20
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


-- config.color_scheme

local clip_cmd = {
  mac = 'pbcopy',
  lnx = 'wl-copy',
  win = 'clip',
}

function color_scheme__rnd(env)

  local scheme_name_lst = {}
  scheme_name_lst = utl.tbl.cct(scheme_name_lst, scheme_my_lst[env].recommend.h)
  -- scheme_name_lst = utl.tbl.cct(scheme_name_lst, scheme_my_lst[env].recommend.m)
  -- scheme_name_lst = utl.tbl.cct(scheme_name_lst, scheme_my_lst[env].check)

  wezterm.on('window-config-reloaded', function(win, pane)
    if not win:get_config_overrides() then
      local scheme_name = scheme_name_lst[math.random(#scheme_name_lst)]

      wezterm.log_info('> ' .. scheme_name .. ' <')

      local cmd = 'echo "' .. scheme_name .. '" | ' .. clip_cmd[env]
      -- os.execute(cmd)

      win:set_config_overrides {
        color_scheme = scheme_name,
      }
    end
  end)

  return {}
end

wezterm.on('opacity-tgl', function(win, pane)

  local cnf_tmp = win:get_config_overrides() or {}

  local opcty_crnt
  opcty_crnt = win:effective_config().window_background_opacity
  log(opcty_crnt)
  opcty_crnt = cnf_tmp.window_background_opacity or opcty_crnt

  local opcty_01 = 0.20
  local opcty_02 = 0.55

  if opcty_crnt <= opcty_01 + 0.01 then
    cnf_tmp.window_background_opacity = opcty_02
  else
    cnf_tmp.window_background_opacity = opcty_01
  end

  win:set_config_overrides(cnf_tmp)
end)

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

-- gui-startup helper

function spawn_with_split(pos, cols, rows)
  local _, pane, _ = wezterm.mux.spawn_window({
    position = { x = pos.x, y = pos.y, origin = 'ActiveScreen' },
    width = cols, height = rows,
  })
  pane:split({ direction = 'Right', size = 0.7 })
end

function is_vm()

  local f = io.popen("systemd-detect-virt 2>/dev/null")

  if not f then return end

  local virt = f:read("*l")
  f:close()

  -- if virt == "microsoft" or virt == "wsl" then
  if virt == "microsoft" then
    return true
  end

  return false
end

function gui_startup(scrn_tbl)

  wezterm.on('gui-startup', function()

    -- if is_vm() then return end

    local scrn = wezterm.gui.screens().active
    wezterm.log_info('scrn name: ' .. scrn.name)

    local s = scrn_tbl[scrn.name] or scrn_tbl['_default']
    spawn_with_split({ x = s.x, y = s.y }, s.cols, s.rows)
  end)
end

return config

