
utl = {}

utl.log = {}

function utl.log.log(val)

  local wezterm = require('wezterm')

  wezterm.log_info(val)
end
log = utl.log.log

utl.tbl = {}

function utl.tbl.is_in(tbl, _val)

  for idx, val in ipairs(tbl) do
    if val == _val then
      return true
    end
  end

  return false
end

function utl.tbl.cct(tbl1, tbl2)

  for idx, val in ipairs(tbl2) do
    table.insert(tbl1, val)
  end

  return tbl1
end

