
v.Cmd = {}

-- function v.Cmd(cmd) -- alias
function v.Cmd.cmd(cmd) -- alias

  vim.cmd(cmd)
end

function v.Cmd.nml(cmd_nml) -- alias

  v.Cmd.cmd('normal! ' .. cmd_nml)
  -- vim.cmd('exe "normal! ' .. cmd_nml .. '"')
end

-- function v.Cmdline__(str)
function v.Cmd.cmdline__(str)

  -- v.Ynk__(str)

  f.feedkeys(':call ' .. str)
end

