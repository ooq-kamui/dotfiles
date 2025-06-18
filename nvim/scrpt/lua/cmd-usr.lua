-- 
-- cmd
-- 

-- ex
-- 
-- vim.api.nvim_create_user_command('StrUpr',
--   function(opts)
--     print(string.upper(opts.fargs[1]))
--   end,
--   {nargs = 1, complete = 'file'},
-- )

vim.api.nvim_create_user_command('Pth',
  function(opts)
    v.Pth()
  end,
  {nargs = 0}
)

vim.api.nvim_create_user_command('K',
  function(opts)
    v.Dir__parent(1)
  end,
  {nargs = 0}
)
vim.api.nvim_create_user_command('Kk',
  function(opts)
    v.Dir__parent(2)
  end,
  {nargs = 0}
)
vim.api.nvim_create_user_command('Kkk',
  function(opts)
    v.Dir__parent(3)
  end,
  {nargs = 0}
)

vim.api.nvim_create_user_command('Dpl',
  function(opts)
    v.Buf_file__dpl()
  end,
  {nargs = 0}
)

vim.api.nvim_create_user_command('Mv',
  function(opts)
    v.Buf_file__mv(opts.fargs[1])
  end,
  {nargs = 1}
)

vim.api.nvim_create_user_command('SrchOr',
  function(opts)
    v.Srch_or(table.unpack(opts.fargs))
  end,
  {nargs = '*'}
)

vim.api.nvim_create_user_command('InsSysCmd',
  function(opts)
    v.Cursor__ins_sys_cmd(opts.fargs[1])
  end,
  {nargs = '*'}
)

vim.api.nvim_create_user_command('Rpl',
  function(opts)
    v.Slctd_line__rpl(opts.fargs[1], opts.fargs[2])
  end,
  {nargs = '*'}
)

vim.api.nvim_create_user_command('VBoxRpl',
  function(opts)
    v.Slctd_box__rpl(opts.fargs[1], opts.fargs[2])
  end,
  {nargs = '*'}
)

vim.api.nvim_create_user_command('Opn',
  function(opts)
    v.Buf.opn(opts.fargs[1])
  end,
  {nargs = '*', complete = 'file'}
)

vim.api.nvim_create_user_command('OpnMan',
  function(opts)
    v.Opn_man(opts.fargs[1])
  end,
  {nargs = '*'}
)

vim.api.nvim_create_user_command('OpnApp',
  function(opts)
    v.Opn_app(opts.fargs[1])
  end,
  {nargs = '*'}
)


-- " term
   vim.cmd('command! -nargs=* Term split | wincmd j | resize 15 | term <args>')

-- "autocmd TermOpen * startinsert


