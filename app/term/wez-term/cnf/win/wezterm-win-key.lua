local wezterm = require 'wezterm'
local act = wezterm.action

require('cnf/utl')
local cmn = require('cnf/wezterm-key-cmn')

--
-- env : win (keys delta)
--

local keys_win = {
    { key = 'i'         , mods = 'CTRL'            , action = act.SendKey{ key = 'Tab' } },
    { key = 'q'         , mods = 'SHIFT|CTRL'      , action = act.CloseCurrentTab{ confirm = true } },
 -- { key = 'u'         , mods = 'SHIFT|CTRL'      , action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
    { key = 'u'         , mods = 'SHIFT|CTRL'      , action = act.ActivatePaneDirection 'Next' },
 -- { key = 'w'         , mods = 'SHIFT|CTRL'      , action = act.CloseCurrentTab{ confirm = true } },
    { key = 'w'         , mods = 'CTRL|SHIFT',
      action = wezterm.action.SpawnCommandInNewTab {
        args = { 'pwsh.exe' },
        domain = { DomainName = 'local' },
      },
    },
    { key = 'Insert'    , mods = 'SHIFT'           , action = act.PasteFrom 'PrimarySelection' },
    { key = 'Insert'    , mods = 'CTRL'            , action = act.CopyTo 'PrimarySelection' },
}

--
-- env : win (copy_mode delta)
--

local copy_mode_win = {
    { key = 'f'         , mods = 'NONE'   , action = act.CopyMode{ JumpForward = { prev_char = false } } },
}

-- merge

local keys = utl.tbl.cct(cmn.keys, keys_win)

local key_tables = cmn.key_tables
key_tables.copy_mode = utl.tbl.cct(key_tables.copy_mode, copy_mode_win)

return {
  keys       = keys,
  key_tables = key_tables,
}

