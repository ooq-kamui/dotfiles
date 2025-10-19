-- 
-- cmd
-- 

-- ex
-- 
-- vim.api.nvim_create_user_command('StrUpr',
--   function(opts)
--     v.Log.val(string.upper(opts.fargs[1]))
--   end,
--   {nargs = 1, complete = 'file'},
-- )

vim.api.nvim_create_user_command('Pth',
  function(opts)
    v.Dir.pth()
  end,
  {nargs = 0}
)

vim.api.nvim_create_user_command('K',
  function(opts)
    v.Dir.__parent(1)
  end,
  {nargs = 0}
)
vim.api.nvim_create_user_command('Kk',
  function(opts)
    v.Dir.__parent(2)
  end,
  {nargs = 0}
)
vim.api.nvim_create_user_command('Kkk',
  function(opts)
    v.Dir.__parent(3)
  end,
  {nargs = 0}
)

vim.api.nvim_create_user_command('Kf',
  function(opts)
    v.Dir.__git_root()
  end,
  {nargs = 0}
)

vim.api.nvim_create_user_command('Dpl',
  function(opts)
    v.Buf.file__dpl()
  end,
  {nargs = 0}
)

vim.api.nvim_create_user_command('Mv',
  function(opts)
    v.Buf.file__mv(opts.fargs[1])
  end,
  {nargs = 1}
)

vim.api.nvim_create_user_command('SrchOr',
  function(opts)
    v.Srch._or(unpack(opts.fargs))
  end,
  {nargs = '*'}
)

-- vim.api.nvim_create_user_command('InsSysCmd',
--   function(opts)
--     v.Cursor.__ins_sys_cmd(opts.fargs[1])
--   end,
--   {nargs = '*'}
-- )

vim.api.nvim_create_user_command('Rpl',
  function(opts)
    v.Slctd.line__rpl(opts.fargs[1], opts.fargs[2])
  end,
  {nargs = '*'}
)

vim.api.nvim_create_user_command('VBoxRpl',
  function(opts)
    v.Slctd.box__rpl(opts.fargs[1], opts.fargs[2])
  end,
  {nargs = '*', range = bl.t}
)

vim.api.nvim_create_user_command('Opn',
  function(opts)
    v.Buf.opn(opts.fargs[1])
  end,
  {nargs = '*', complete = 'file'}
)

vim.api.nvim_create_user_command('OpnMan',
  function(opts)
    v.Buf.opn_man(opts.fargs[1])
  end,
  {nargs = '*'}
)

vim.api.nvim_create_user_command('Sjis',
  function(opts)
    v.Buf.re__sjis()
  end,
  {nargs = 0}
)

-- " term
v.Cmd.cmd('command! -nargs=* Term split | wincmd j | resize 15 | term <args>')

-- "autocmd TermOpen * startinsert


