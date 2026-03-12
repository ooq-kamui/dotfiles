
v.Nml = {}

v.Nml.cmd = {}


function v.Nml.exe(nml_cmd) -- alias

  -- v.Log.log(nml_cmd)
  nml_cmd = v.Str.escape(nml_cmd, [[\<"]])
  -- v.Log.log(nml_cmd)
  v.Cmd.cmd('exe "normal! ' .. nml_cmd .. '"')
end





