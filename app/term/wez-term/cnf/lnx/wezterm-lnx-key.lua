local wezterm = require 'wezterm'
local act = wezterm.action

require('cnf/utl')
local cmn = require('cnf/wezterm-key-cmn')

--
-- env : mac (keys delta)
--

local keys_mac = {
    { key = '¥'                                    , action = act.SendString([[\]]) },
    { key = 'H'         , mods = 'CTRL'            , action = act.HideApplication },
    { key = 'H'         , mods = 'SHIFT|CTRL'      , action = act.HideApplication },
 -- { key = 'Q'         , mods = 'CTRL'            , action = act.QuitApplication },
 -- { key = 'Q'         , mods = 'SHIFT|CTRL'      , action = act.QuitApplication },
    { key = 'Q'         , mods = 'CTRL'            , action = act.DisableDefaultAssignment },
    { key = 'Q'         , mods = 'SHIFT|CTRL'      , action = act.DisableDefaultAssignment },
    { key = 'h'         , mods = 'SUPER'           , action = act.HideApplication },
 -- { key = 'q'         , mods = 'SHIFT|CTRL'      , action = act.QuitApplication },
 -- { key = 'q'         , mods = 'SUPER'           , action = act.QuitApplication },
    { key = 'q'         , mods = 'CTRL'            , action = act.SendString '\x11' },
    { key = 'q'         , mods = 'SHIFT|CTRL'      , action = act.DisableDefaultAssignment },
    { key = 'q'         , mods = 'SUPER'           , action = act.DisableDefaultAssignment },
    { key = 'u'         , mods = 'SHIFT|CTRL'      , action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
    { key = 'w'         , mods = 'SHIFT|CTRL'      , action = act.CloseCurrentTab{ confirm = true } },
}

--
-- env : mac (copy_mode delta)
--

local copy_mode_mac = {
 -- { key = 'f'         , mods = 'NONE'   , action = act.CopyMode{ JumpForward = { prev_char = false } } },
    { key = 'f'         , mods = 'NONE'   , action = act.CopyMode 'MoveForwardWord' },
}

-- merge

local keys = utl.tbl.cct(cmn.keys, keys_mac)

local key_tables = cmn.key_tables
key_tables.copy_mode = utl.tbl.cct(key_tables.copy_mode, copy_mode_mac)

return {
  keys       = keys,
  key_tables = key_tables,
}

