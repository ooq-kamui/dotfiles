
v.Mb = {}

function v.Mb.__cnv(str)

  local sys_cmd = 'echo "' .. str .. '" | mb__cnv'
  str = v.Sys.cmd(sys_cmd)
  return str
end





