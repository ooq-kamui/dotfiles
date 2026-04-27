
-- fnc tst

v.Tst = {}

function v.Tst.tst()

  v.Slctd.__ltst()

  local char = 'c'
  local cmd = [[s/./\=repeat('c', strdisplaywidth(submatch(0)))/g]]
  v.Cmd.cmd(cmd)
  -- v.Nml.exe('rb')


  -- v.Log.log(v.Srch._str_plain_prv)
end


