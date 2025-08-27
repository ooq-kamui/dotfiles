
v.Cmd = {}

-- function v.Cmd(cmd) -- alias
function v.Cmd.cmd(cmd) -- alias

  vim.cmd(cmd)
end

function v.Cmd.nml(cmd_nml) -- alias

  v.Cmd.cmd('normal! ' .. cmd_nml)
  -- vim.cmd('exe "normal! ' .. cmd_nml .. '"')
end

function v.Cmd.cmdline__(str)

  -- v.Rgstr.ynk__(str)

  vf.feedkeys(':call ' .. str)
end

