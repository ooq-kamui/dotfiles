
local cnf
cnf = require('cnf/lnx/wezterm-lnx')
key = require('cnf/lnx/wezterm-lnx-key')

cnf.keys       = key.keys
cnf.key_tables = key.key_tables

return cnf

