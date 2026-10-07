
local scheme_lst = {}

scheme_lst.win = require('cnf.win.wezterm-win-scheme-lst')
scheme_lst.mac = require('cnf.mac.wezterm-mac-scheme-lst')
scheme_lst.lnx = require('cnf.lnx.wezterm-lnx-scheme-lst')

return scheme_lst

