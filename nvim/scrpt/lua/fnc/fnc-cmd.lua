
v.Cmd = {}

function v.Cmd.cmd(cmd) -- alias

  vim.cmd(cmd)
end

function v.Cmd.nml(cmd_nml) -- alias

  v.Cmd.cmd('normal! ' .. cmd_nml)

  -- v.Cmd.cmd('exe "normal! ' .. cmd_nml .. '"')
end

function v.Cmd.esc()

  v.Cmd.cmd('exe "normal! \\<esc>"')
  -- v.Cmd.nml('\\<esc>')
end

function v.Cmd.cmdline__(str)
  -- v.Log.log(str)

  vf.feedkeys(': ' .. str)
end

function v.Cmd.cmdline__fnc_call(fnc_name)

  -- dev anchor
  v.Cmd.cmdline__('lua ' .. fnc_name)
end

function v.Cmd._repeat() -- repeat : reserve word

  v.Log.val('fnc repeat')

  -- v.Tst.tst()

  -- v.Cursor.__mv_by_srch_str('f')
  -- v.Cursor.__mv_d()
  -- v.Cursor.__ins_ynk()
end

