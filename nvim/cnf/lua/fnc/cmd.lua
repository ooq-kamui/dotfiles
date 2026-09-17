
v.Cmd = {}

function v.Cmd.cmd(cmd) -- alias

  vim.cmd(cmd)
end

function v.Cmd.exc(cmd) -- alias

  return vf.execute(cmd)
end

function v.Cmd.esc()

  v.Nml.exe(v.Nml.n.key.esc)
end

function v.Cmd.cmdline__(str)

  vf.feedkeys(': ' .. str) -- del not space
end

function v.Cmd.cmdline__fnc_call(fnc_name)

  v.Cmd.cmdline__('lua ' .. fnc_name)
end

function v.Cmd.repeat_with_fnc() -- repeat : lua reserve word

  -- v.Log.val('fnc repeat')


end

