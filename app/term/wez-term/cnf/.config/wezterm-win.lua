
local cnf
cnf = require('cnf\\wezterm-win')
key = require('cnf\\wezterm-win-key')

cnf.keys       = key.keys
cnf.key_tables = key.key_tables

return cnf

