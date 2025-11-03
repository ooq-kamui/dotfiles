
local cnf
cnf = require('cnf/wezterm-mac')
key = require('cnf/wezterm-mac-key')

cnf.keys       = key.keys
cnf.key_tables = key.key_tables

return cnf

