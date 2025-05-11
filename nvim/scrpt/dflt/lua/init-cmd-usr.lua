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


-- command! -nargs=0 Pth call Pth()
   vim.api.nvim_create_user_command('Pth',
     function(opts)
       vim.fn.Pth()
     end,
     {nargs = 0}
   )

-- command! -nargs=0 K     call Dir__parent(1)
   vim.api.nvim_create_user_command('K',
     function(opts)
       vim.fn.Dir__parent(1)
     end,
     {nargs = 0}
   )
-- command! -nargs=0 Kk    call Dir__parent(2)
   vim.api.nvim_create_user_command('Kk',
     function(opts)
       vim.fn.Dir__parent(2)
     end,
     {nargs = 0}
   )
-- command! -nargs=0 Kkk   call Dir__parent(3)
   vim.api.nvim_create_user_command('Kkk',
     function(opts)
       vim.fn.Dir__parent(3)
     end,
     {nargs = 0}
   )

-- command! -nargs=0 Dpl call Buf_file__dpl()
   vim.api.nvim_create_user_command('Dpl',
     function(opts)
       vim.fn.Buf_file__dpl()
     end,
     {nargs = 0}
   )

-- command! -nargs=1 Mv call Buf_file__mv(<q-args>)
   vim.api.nvim_create_user_command('Mv',
     function(opts)
       vim.fn.Buf_file__mv(opts.fargs[1])
     end,
     {nargs = 1}
   )

-- command! -nargs=* SrchOr call Srch_or(<f-args>)
   vim.api.nvim_create_user_command('SrchOr',
     function(opts)
       vim.fn.Srch_or(table.unpack(opts.fargs))
     end,
     {nargs = '*'}
   )

-- command! -nargs=* InsSysCmd call Cursor__ins_sys_cmd(<q-args>)
   vim.api.nvim_create_user_command('InsSysCmd',
     function(opts)
       vim.fn.Cursor__ins_sys_cmd(table.unpack(opts.fargs))
     end,
     {nargs = '*'}
   )

-- command! -range=% -nargs=* Rpl <line1>,<line2>call Slctd_line__rpl(<f-args>)
   -- dev anchor
   vim.api.nvim_create_user_command('Rpl',
     function(opts)
       vim.fn.Slctd_line__rpl(table.unpack(opts.fargs))
     end,
     {nargs = '*'}
   )

-- command! -range=% -nargs=* VBoxRpl <line1>,<line2>call Slctd_box__rpl(<f-args>)
   -- dev anchor
   vim.api.nvim_create_user_command('VBoxRpl',
     function(opts)
       vim.fn.Slctd_box__rpl(table.unpack(opts.fargs))
     end,
     {nargs = '*'}
   )

-- command! -nargs=* -complete=file Opn call Opn(<q-args>)
   vim.api.nvim_create_user_command('Opn',
     function(opts)
       vim.fn.Opn(table.unpack(opts.fargs))
     end,
     {nargs = '*', complete = 'file'}
   )

-- command! -nargs=* OpnMan call Opn_man(<q-args>)
   vim.api.nvim_create_user_command('OpnMan',
     function(opts)
       vim.fn.Opn_man(table.unpack(opts.fargs))
     end,
     {nargs = '*'}
   )

-- "command! -nargs=* OpnApp call Opn_app(<f-args>)
   vim.api.nvim_create_user_command('OpnApp',
     function(opts)
       vim.fn.Opn_app(table.unpack(opts.fargs))
     end,
     {nargs = '*'}
   )


-- " term
-- command! -nargs=* Term split | wincmd j | resize 15 | term <args>
   vim.cmd('command! -nargs=* Term split | wincmd j | resize 15 | term <args>')

-- "autocmd TermOpen * startinsert


