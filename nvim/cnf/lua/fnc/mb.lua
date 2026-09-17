
v.Mb = {}

v.Mb.cmd = {}
v.Mb.cmd.__cnv_ascii = 'mb__cnv_ascii'

function v.Mb.__cnv_ascii(str)

  local sys_cmd = 'echo "' .. str .. '" | ' .. v.Mb.cmd.__cnv_ascii
  local rslt_str = v.Sys.cmd(sys_cmd)
  return rslt_str
end

