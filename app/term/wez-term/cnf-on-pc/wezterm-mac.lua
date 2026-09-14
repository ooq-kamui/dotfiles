
local cnf
cnf = require('cnf/mac/wezterm-mac')
key = require('cnf/mac/wezterm-mac-key')

cnf.keys       = key.keys
cnf.key_tables = key.key_tables

return cnf

