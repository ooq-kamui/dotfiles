-- 
-- opt ( set )
-- 
-- ref https://neovim.io/doc/user/lua.html

-- 
-- org setting
-- 

-- set modelines=0  " CVE-2007-2438
vim.opt.modelines = 0

-- Normally we use vim-extensions. If you want true vi-compatibility
-- remove change the following statements
-- set nocompatible
vim.opt.compatible = bl.f -- Use Vim defaults instead of 100% vi compatibility
-- set backspace=2
-- vim.opt.backspace = 2 -- more powerful backspacing

-- Don't write backup file if vim is being called by
--   crontab -e
--   chpass
-- autocmd BufWrite /private/tmp/crontab.* set nowritebackup nobackup
-- autocmd BufWrite /private/etc/pw.     * set nowritebackup nobackup
vim.api.nvim_create_autocmd({'BufWrite'}, {
  pattern  = {
    '/private/tmp/crontab.*',
    '/private/etc/pw.*',
  },
  callback = function()
    vim.opt.writebackup = bl.f
    vim.opt.backup      = bl.f
  end,
})
-- org setting end


v.Cmd.cmd('filetype on')

v.Cmd.cmd('syntax on')

-- vim.filetype.add({
--   pattern = {
--     ['*.fish'] = 'fish',
--     ['*.mdx'] = 'markdown',
--   },
-- })
-- defold
-- autocmd BufNewFile,BufRead *.script     set filetype=lua
-- autocmd BufNewFile,BufRead *.gui_script set filetype=lua

-- indent
-- space
indnt_fnc_space = function()
  vim.opt_local.sw  = 2
  vim.opt_local.sts = 2
  vim.opt_local.ts  = 2
  vim.opt_local.et  = bl.t
end

vim.api.nvim_create_autocmd({'FileType'}, {
  pattern  = {'lua'},
  callback = indnt_fnc_space,
})

vim.api.nvim_create_autocmd({'FileType'}, {
  pattern  = {'text'},
  callback = indnt_fnc_space,
})

vim.api.nvim_create_autocmd({'FileType'}, {
  pattern  = {'json'},
  callback = indnt_fnc_space,
})

vim.api.nvim_create_autocmd({'FileType'}, {
  pattern  = {'vim'},
  callback = indnt_fnc_space,
})

vim.api.nvim_create_autocmd({'FileType'}, {
  pattern  = {'fish'},
  callback = indnt_fnc_space,
})

vim.api.nvim_create_autocmd({'FileType'}, {
  pattern  = {'sh'},
  callback = indnt_fnc_space,
})

vim.api.nvim_create_autocmd({'FileType'}, {
  pattern  = {'markdown'},
  callback = indnt_fnc_space,
})

-- autocmd FileType python   setlocal sw=4 sts=4 ts=4   et
vim.api.nvim_create_autocmd({'FileType'}, {
  pattern  = {'python'},
  callback = function()
    vim.opt_local.sw  = 4
    vim.opt_local.sts = 4
    vim.opt_local.ts  = 4
    vim.opt_local.et  = bl.t
  end,
})
-- tab
-- autocmd FileType lua      setlocal sw=2 sts=2 ts=2 noet


vim.opt.listchars = {tab = '»_', eol = '«', extends = '»', precedes = '«', nbsp = '%'}
vim.opt.incsearch  = bl.t
vim.opt.hlsearch   = bl.t
vim.opt.ignorecase = bl.t
vim.opt.smartcase  = bl.t
vim.opt.number     = bl.t
-- vim.opt.relativenumber = bl.t
vim.opt.list       = bl.t
vim.opt.cursorline = bl.t
vim.opt.splitbelow = bl.t
vim.opt.switchbuf  = {'usetab', 'newtab'}
vim.opt.showcmd    = bl.t

vim.opt.wrapscan = bl.t  -- srch file end loop

vim.opt.encoding = 'utf-8'
vim.opt.fileencodings = {'utf-8', 'sjis'}
-- vim.opt.termencoding = 'utf-8'

-- vim.opt.mouse = 'n'
vim.opt.mouse = '' -- off

-- map <LeftMouse> <nop> -- ??

vim.opt.autoindent = bl.t
vim.opt.shiftwidth = 2  -- 4
vim.opt.tabstop    = 2  -- 4
vim.opt.expandtab  = bl.t  -- tab > space

-- file opn, cursor mv last
vim.api.nvim_create_autocmd('BufRead', {
  group    = vim.api.nvim_create_augroup( 'vimrcEx', {} ),
  pattern  = {'*'},
  callback = function()
    local cursor_last_line = vf.line([['"]])
    local cursor_end_line  = vf.line("$")

    if cursor_last_line > 0 and cursor_last_line <= cursor_end_line then
      v.Cmd.cmd('normal! g`"')
    end
  end,
})

-- srch cmd
-- vim.api.nvim_create_autocmd('CmdlineLeave', {
--   group = vim.api.nvim_create_augroup('SearchCallback', { clear = true }),
--   pattern = { '/', '?' },
--   callback = function()
-- 
--     if vim.v.event.abort then return end
-- 
--     -- v.Log.val('run /')
--     -- v.Srch.str_vim_flt__(v.Rgstr.get('/'))
--   end,
-- })

vim.api.nvim_create_autocmd({'BufWinEnter'}, {
  pattern  = {'*'},
  callback = function()
    v.Cmd.cmd('normal! zz')
  end,
})

-- vim.api.nvim_create_autocmd({'BufRead'}, {
--   pattern  = {'*'},
--   callback = function()
--     v.Cmd.cmd('normal! /dmy')
--   end,
-- })

-- set nowrap
vim.opt.wrap = bl.f
vim.opt.whichwrap:append('b')
vim.opt.whichwrap:append('s')
vim.opt.whichwrap:append('h')
vim.opt.whichwrap:append('l')
vim.opt.whichwrap:append('<')
vim.opt.whichwrap:append('>')
vim.opt.whichwrap:append('[')
vim.opt.whichwrap:append(']')

vim.opt.virtualedit = 'onemore' -- cursor mv cr
vim.opt.virtualedit:append {'block'} -- box slct
-- vim.opt.virtualedit = 'all'

vim.opt.scrolloff     = 5
vim.opt.sidescrolloff = 4
vim.opt.wildmode      = {list = 'longest'}
vim.opt.tabpagemax    = 50
vim.opt.nf            = ''
vim.opt.showtabline   = 2
vim.opt.wildmenu      = bl.t -- ?
-- vim.opt.showmatch  = bl.t
-- vim.opt.visualbell = bl.t
vim.opt.autoread      = bl.t -- enable not ? at wsl, linux
-- vim.opt.clipboard:append {'unnamedplus'}

-- vim.opt.ambiwidth = 'double'
-- vim.opt.ambiwidth = 'single'

-- status line
function Status_line(file_encoding_flg)

  vim.opt.statusline = ''
  -- vim.opt.statusline:append {'%m\'} -- modify sign
  vim.opt.statusline:append('%F') -- file name
  vim.opt.statusline:append('%=') -- follow right side

  if file_encoding_flg then

    vim.opt.statusline:append('%{&fileencoding}\\') -- file encoding

    if vim.bo.bomb then
      vim.opt.statusline:append(':bom') -- bom
    end
  end

  vim.opt.statusline:append('%y ')   -- file type
  vim.opt.statusline:append('%c ')   -- column num
  vim.opt.statusline:append('%p%% ') -- line num %
  vim.opt.statusline:append('%l/%L') -- line num / line num all
end

-- Status_line(bl.t)
Status_line(bl.f)

vim.opt.laststatus  = 2 -- 0:off  1:on when 2 win  2:on
vim.opt.completeopt = {'menuone', 'noinsert'}
vim.opt.foldmethod  = 'manual'
vim.opt.shortmess:append('I')
vim.opt.shortmess:remove("S")
-- vim.opt.nrformats:append {'unsigned'} -- 2022-05-09

vim.opt.swapfile = bl.f

-- undo
if vf.has('persistent_undo') == 1 then

  vim.opt.undodir  = v.Dir.c.home_dir .. '/.vim-undo'
  vim.opt.undofile = bl.t
end

-- comment auto off ( def pos final ? )
-- autocmd FileType * set fo-=c fo-=r fo-=o
vim.api.nvim_create_autocmd('FileType', {
  pattern  = {'*'},
  callback = function()
    vim.opt.fo:remove {'c'}
    vim.opt.fo:remove {'r'}
    vim.opt.fo:remove {'o'}
  end,
})

-- shell
vim.opt.shell = 'fish'  -- default

