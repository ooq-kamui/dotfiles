
v.Cmd = {}

-- function v.Cmd(cmd) -- alias
function v.Cmd.cmd(cmd) -- alias

  vim.cmd(cmd)
end

-- function v.Normal(n_cmd) -- alias
function v.Cmd.nml(n_cmd) -- alias

  v.Cmd.cmd('normal! ' .. n_cmd)
  -- vim.cmd('exe "normal! ' .. n_cmd .. '"')
end

-- function v.Cmdline__(str)
function v.Cmd.cmdline__(str)

  -- v.Ynk__(str)

  f.feedkeys(':call ' .. str)
end

