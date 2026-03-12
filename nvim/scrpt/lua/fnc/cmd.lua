
v.Cmd = {}

function v.Cmd.cmd(cmd) -- alias

  vim.cmd(cmd)
end

function v.Cmd.exc(cmd) -- alias

  return vf.execute(cmd)
end

-- function v.Cmd.nml(nml_cmd) -- alias
-- 
--   v.Nml.exe(nml_cmd)
-- 
--   -- -- v.Log.log(nml_cmd)
--   -- nml_cmd = v.Str.escape(nml_cmd, [[\<"]])
--   -- -- v.Log.log(nml_cmd)
--   -- v.Cmd.cmd('exe "normal! ' .. nml_cmd .. '"')
-- end

function v.Cmd.esc()

  v.Nml.exe([[<esc>]])
  -- v.Cmd.cmd('exe "normal! \\<esc>"')
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

