-- 
-- opt ( set )
-- 
-- ref https://neovim.io/doc/user/lua.html

-- ex
-- 
-- set xxx
--   vim.opt.xxx = true
-- 
-- set noxxx
--   vim.opt.xxx = false
-- 
-- set xxx=1
--   vim.opt.xxx = 1
-- 
-- set xxx=aaa
--   vim.opt.xxx = 'aaa'
-- 
-- set xxx+=aaa
--   vim.opt.xxx:append {'aaa'}
-- 
-- set xxx-=aaa
--   vim.opt.xxx:remove {'aaa'}
-- 
-- set xxx=aaa,bbb
--   vim.opt.xxx = {'aaa', 'bbb'}
-- 
-- set xxx=aa:bb,cc:dd
--   vim.opt.xxx = {aa = 'bb', cc = 'dd'}
-- 
-- setlocal xxx
--   vim.opt_local.xxx = true
-- 
-- autocmd xxx
--   vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
--     group    = vim.api.nvim_create_augroup('grp_name', {}),
--     pattern  = {'*.c', '*.h'},
--     callback = function()
--       print('yyy')
--     end,
--   })
-- 
-- &bomb
--   vim.bo.bomb
-- 
-- xxx on
-- vim.cmd('xxx on')


-- 
-- org setting
-- 

-- set modelines=0  " CVE-2007-2438
   vim.opt.modelines = 0

-- Normally we use vim-extensions. If you want true vi-compatibility
-- remove change the following statements
-- set nocompatible
   vim.opt.compatible = false -- Use Vim defaults instead of 100% vi compatibility
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
       vim.opt.writebackup = false
       vim.opt.backup      = false
     end,
   })
-- org setting end


vim.cmd('filetype on')

vim.cmd('syntax on')

-- autocmd BufNewFile,BufRead *.fish       set filetype=fish
-- dev anchor
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  pattern  = {'*.fish'},
  callback = function() vim.opt.filetype = fish end,
})

-- defold
-- autocmd BufNewFile,BufRead *.script     set filetype=lua
-- autocmd BufNewFile,BufRead *.gui_script set filetype=lua

-- indent
-- - space
indnt_fnc_space = function()
  vim.opt_local.sw  = 2
  vim.opt_local.sts = 2
  vim.opt_local.ts  = 2
  vim.opt_local.et  = true
end

-- autocmd FileType lua      setlocal sw=2 sts=2 ts=2   et
   vim.api.nvim_create_autocmd({'FileType'}, {
     pattern  = {'lua'},
     callback = indnt_fnc_space,
   })

-- autocmd FileType text     setlocal sw=2 sts=2 ts=2   et
   vim.api.nvim_create_autocmd({'FileType'}, {
     pattern  = {'text'},
     callback = indnt_fnc_space,
   })

-- autocmd FileType json     setlocal sw=2 sts=2 ts=2   et
   vim.api.nvim_create_autocmd({'FileType'}, {
     pattern  = {'json'},
     callback = indnt_fnc_space,
   })

-- autocmd FileType vim      setlocal sw=2 sts=2 ts=2   et
   vim.api.nvim_create_autocmd({'FileType'}, {
     pattern  = {'vim'},
     callback = indnt_fnc_space,
   })

-- autocmd FileType fish     setlocal sw=2 sts=2 ts=2   et
   vim.api.nvim_create_autocmd({'FileType'}, {
     pattern  = {'fish'},
     callback = indnt_fnc_space,
   })

-- autocmd FileType sh       setlocal sw=2 sts=2 ts=2   et
   vim.api.nvim_create_autocmd({'FileType'}, {
     pattern  = {'sh'},
     callback = indnt_fnc_space,
   })

-- autocmd FileType markdown setlocal sw=2 sts=2 ts=2   et
   vim.api.nvim_create_autocmd({'FileType'}, {
     pattern  = {'markdown'},
     callback = indnt_fnc_space,
   })

-- autocmd FileType python   setlocal sw=4 sts=4 ts=4   et
   vim.api.nvim_create_autocmd({'FileType'}, {
     pattern  = {'python'},
     callback = function()
       vim.opt_local.sw  = 2
       vim.opt_local.sts = 2
       vim.opt_local.ts  = 4
       vim.opt_local.et  = true
     end,
   })
-- - tab
-- autocmd FileType lua      setlocal sw=2 sts=2 ts=2 noet


-- set listchars=tab:»_,eol:«,extends:»,precedes:«,nbsp:%
   vim.opt.listchars = {tab = '»_', eol = '«', extends = '»', precedes = '«', nbsp = '%'}
-- set incsearch
   vim.opt.incsearch = true
-- set hlsearch
   vim.opt.hlsearch = true
-- set ignorecase smartcase
   vim.opt.ignorecase = true
   vim.opt.smartcase  = true
-- set number
   vim.opt.number = true
-- set relativenumber
-- vim.opt.relativenumber = true
-- set list
   vim.opt.list = true
-- set cursorline
   vim.opt.cursorline = true
-- set splitbelow
   vim.opt.splitbelow = true
-- set switchbuf=usetab,newtab
   vim.opt.switchbuf = {'usetab', 'newtab'}
-- set showcmd
   vim.opt.showcmd = true

-- set encoding=utf-8
   vim.opt.encoding = 'utf-8'
-- set fileencodings=utf-8,sjis
   vim.opt.fileencodings = {'utf-8', 'sjis'}
-- set termencoding=utf-8
-- vim.opt.termencoding = 'utf-8'

-- set mouse=n
-- vim.opt.mouse = 'n'

-- dev anchor
-- map <LeftMouse> <nop>
-- ???  <nop> ??

-- set autoindent
   vim.opt.autoindent = true
-- set shiftwidth=2 " 4
   vim.opt.shiftwidth = 2
-- set tabstop=2    " 4
   vim.opt.tabstop = 2
-- set expandtab " tab > space
   vim.opt.expandtab = true


-- file opn, cursor mv last
-- augroup vimrcEx
--   autocmd BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
--   \ exe "normal! g`\"" | endif
-- augroup END
vim.api.nvim_create_autocmd('BufRead', {
  group    = vim.api.nvim_create_augroup( 'vimrcEx', {} ),
  pattern  = {'*'},
  callback = function()
    local cursor_last_line = vim.fn.line([['"]])
    local cursor_end_line  = vim.fn.line("$")

    if cursor_last_line > 0 and cursor_last_line <= cursor_end_line then
      vim.cmd('normal! g`"')
    end
  end,
})

-- autocmd BufWinEnter * normal! zz
vim.api.nvim_create_autocmd({'BufWinEnter'}, {
  pattern  = {'*'},
  callback = function()
    vim.cmd('normal! zz')
  end,
})

-- set nowrap
vim.opt.wrap = false
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

vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 4
vim.opt.wildmode = {list = 'longest'}
vim.opt.tabpagemax = 50
vim.opt.nf = ''
vim.opt.showtabline = 2
vim.opt.wildmenu = true -- ?
-- vim.opt.showmatch = true
-- vim.opt.visualbell = true
-- vim.opt.ambiwidth = 'double'
vim.opt.autoread = true
-- vim.opt.clipboard:append {'unnamedplus'}

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
  vim.opt.statusline:append('%l/%L')  -- line num / line num all
end

-- Status_line(true)
Status_line(false)

vim.opt.laststatus = 2 -- 0:off  1:on when 2 win  2:on
vim.opt.completeopt = {'menuone', 'noinsert'}
vim.opt.foldmethod = 'manual'
vim.opt.shortmess:append('I')
-- vim.opt.nrformats:append {'unsigned'} -- 2022-05-09

   vim.opt.swapfile = false

-- undo
if vim.fn.has('persistent_undo') == 1 then

  vim.opt.undodir = g.home_dir .. '/.vim-undo'
  vim.opt.undofile = true
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


-- 
-- shell & .vimrc_env
-- 

vim.opt.shell = 'fish'  -- default


