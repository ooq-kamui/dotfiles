
local wezterm = require('wezterm')

--
-- os : detect
--

local function os_detect()

  local trpl = wezterm.target_triple

  if trpl:find('darwin')  then return 'mac' end
  if trpl:find('windows') then return 'win' end
  if trpl:find('linux')   then return 'lnx' end

  return nil
end

local os_name = os_detect()

if not os_name then
  wezterm.log_error('unknown target_triple: ' .. wezterm.target_triple)
  return {}
end

--
-- os : load
--

local cnf = require('cnf.' .. os_name .. '.wezterm-' .. os_name)
local key = require('cnf.' .. os_name .. '.wezterm-' .. os_name .. '-key')

cnf.keys       = key.keys
cnf.key_tables = key.key_tables

return cnf

