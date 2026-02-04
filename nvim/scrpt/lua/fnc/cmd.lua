
v.Cmd = {}

function v.Cmd.cmd(cmd) -- alias

  vim.cmd(cmd)
end

function v.Cmd.exc(cmd) -- alias

  return vf.execute(cmd)
end

function v.Cmd.nml(cmd_nml) -- alias

  -- v.Log.log(cmd_nml)
  cmd_nml = v.Str.__rpl_by_lua(cmd_nml, '"', [[\"]])
  -- cmd_nml = v.Str.__rpl_by_vim(cmd_nml, '"', [[\\"]])
  -- v.Log.log(cmd_nml)

  v.Cmd.cmd('exe "normal! ' .. cmd_nml .. '"')
end

function v.Cmd.esc()

  v.Cmd.nml([[\<esc>]])
  -- v.Cmd.cmd('exe "normal! \\<esc>"')
end

function v.Cmd.cmdline__(str)
  -- v.Log.log(str)

  vf.feedkeys(': ' .. str)
end

function v.Cmd.cmdline__fnc_call(fnc_name)

  -- dev anchor
  v.Cmd.cmdline__('lua ' .. fnc_name)
end

function v.Cmd._repeat() -- repeat : lua reserve word

  v.Log.val('fnc repeat')


end

