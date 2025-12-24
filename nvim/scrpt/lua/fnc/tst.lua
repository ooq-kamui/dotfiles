
-- fnc tst

v.Tst = {}

function v.Tst.tst()
  -- v.Log.val('fnc tst')

  -- v.Cmd.cmdline__('aa')
  -- v.Cmd.cmdline__('lua ')

  -- v.Cmd.cmdline__fnc_call('fnc_name')


  -- vim.cmd('normal! j')
  -- vim.cmd('normal! 10\\<c-e>')

  -- vim.cmd("exe 'normal! j'")
  -- vim.cmd('exe "normal! 5\\<c-e>"')
  -- vim.cmd([[exe "normal! \"eyy"]])

  local str
  str = '"aaa"'
  str = v.Str.__rpl_by_lua(str, '"', [[\\"]])
  print(str)

end


