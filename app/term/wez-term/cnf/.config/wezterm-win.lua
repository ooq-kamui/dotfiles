
local cnf
cnf = require('cnf.win.wezterm-win')
key = require('cnf.win.wezterm-win-key')

cnf.keys       = key.keys
cnf.key_tables = key.key_tables

return cnf

