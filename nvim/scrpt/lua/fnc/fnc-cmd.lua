
v.Cmd = {}

function v.Cmd.cmd(cmd) -- alias

  vim.cmd(cmd)
end

function v.Cmd.nml(cmd_nml) -- alias

  v.Cmd.cmd('normal! ' .. cmd_nml)
  -- v.Cmd.cmd('exe "normal! ' .. cmd_nml .. '"')
end

function v.Cmd.cmdline__(str)

  vf.feedkeys(str)
end

function v.Cmd.cmdline__fnc_call(fnc_name)

  -- vf.feedkeys(':call ' .. fnc_name)
  vf.feedkeys(':lua ' .. fnc_name)
end

