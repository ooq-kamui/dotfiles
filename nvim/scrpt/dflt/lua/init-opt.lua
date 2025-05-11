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

-- org setting

-- set modelines=0  " CVE-2007-2438
   vim.opt.modelines = 0

-- " Normally we use vim-extensions. If you want true vi-compatibility
-- " remove change the following statements
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


-- filetype on
   vim.cmd('filetype on')

-- syntax on
   vim.cmd('syntax on')

-- autocmd BufNewFile,BufRead *.fish       set filetype=fish
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
-- " autocmd FileType lua      setlocal sw=2 sts=2 ts=2 noet


-- set listchars=tab:»_,eol:«,extends:»,precedes:«,nbsp:%
   vim.opt.listchars = {tab = '»_', eol = '«', extends = '»', precedes = '«', nbsp = '%'}
-- set incsearch
   vim.opt.incsearch = true
-- set hlsearch
   vim.opt.hlsearch = true
-- set ignorecase smartcase
-- vim.opt.ignorecase = 'smartcase'
-- set number
   vim.opt.number = true
-- "set relativenumber
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
-- "set termencoding=utf-8
-- vim.opt.termencoding = 'utf-8'

-- "set mouse=n
-- vim.opt.mouse = 'n'
   -- dev anchor
-- "map <LeftMouse> <nop>
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
-- set whichwrap=b,s,h,l,<,>,[,]
   vim.opt.whichwrap:append('b')
   vim.opt.whichwrap:append('s')
   vim.opt.whichwrap:append('h')
   vim.opt.whichwrap:append('l')
   vim.opt.whichwrap:append('<')
   vim.opt.whichwrap:append('>')
   vim.opt.whichwrap:append('[')
   vim.opt.whichwrap:append(']')

-- set virtualedit=onemore
   vim.opt.virtualedit = 'onemore' -- cursor mv cr
-- set virtualedit+=block
   vim.opt.virtualedit:append {'block'} -- box slct
-- "set virtualedit=all
-- vim.opt.virtualedit = 'all'

-- set scrolloff=5
   vim.opt.scrolloff = 5
-- set sidescrolloff=4
   vim.opt.sidescrolloff = 4
-- set wildmode=list:longest
   vim.opt.wildmode = {list = 'longest'}
-- set tabpagemax=50
   vim.opt.tabpagemax = 50
-- set nf=""
   vim.opt.nf = ''
-- set showtabline=2
   vim.opt.showtabline = 2
-- set wildmenu " ?
   vim.opt.wildmenu = true
-- "set showmatch
-- vim.opt.showmatch = true
-- "set visualbell
-- vim.opt.visualbell = true
-- "set ambiwidth=double
-- vim.opt.ambiwidth = 'double'
-- set autoread
   vim.opt.autoread = true
-- "set clipboard+=unnamedplus
-- vim.opt.clipboard:append {'unnamedplus'}

-- status line
-- func! Status_line(file_encoding) abort
   function Status_line(file_encoding_flg)

--   set statusline=
     vim.opt.statusline = ''
--   "set statusline+=%m\
--   vim.opt.statusline:append {'%m\'} -- modify sign
--   set statusline+=%F
     vim.opt.statusline:append('%F') -- file name
--   set statusline+=%=
     vim.opt.statusline:append('%=') -- follow right side

--   if a:file_encoding
     if file_encoding_flg then

--     set statusline+=%{&fileencoding}\
       vim.opt.statusline:append('%{&fileencoding}\\') -- file encoding

--     if &bomb
       if vim.bo.bomb then
--       set statusline+=:bom
         vim.opt.statusline:append(':bom') -- bom
--     endif
       end
--   endif
     end

--   set statusline+=%y\
     vim.opt.statusline:append('%y\\')   -- file type
--   set statusline+=%c\
     vim.opt.statusline:append('%c\\')   -- column num
--   set statusline+=%p%%\
     vim.opt.statusline:append('%p%%\\') -- line num %
--   set statusline+=%l/%L
     vim.opt.statusline:append('%l/%L')  -- line num / line num all
-- endfunc
   end
-- call Status_line(v:false)
   Status_line(false)

-- set laststatus=2
   vim.opt.laststatus = 2 -- 0:off  1:on when 2 win  2:on
-- set completeopt=menuone,noinsert
   vim.opt.completeopt = {'menuone', 'noinsert'}
-- set foldmethod=manual
   vim.opt.foldmethod = 'manual'
-- set shortmess+=I
   vim.opt.shortmess:append('I')
-- "set nrformats+=unsigned " 2022-05-09
-- vim.opt.nrformats:append {'unsigned'}

-- set noswapfile
   vim.opt.swapfile = false

-- " undo
-- if has('persistent_undo')
   if vim.fn.has('persistent_undo') then

--   set undodir=~/.vim-undo
     vim.opt.undodir = g_home_dir .. '/.vim-undo'
--   set undofile
     vim.opt.undofile = true
-- endif
   end

-- 
-- shell & .vimrc_env
-- 

-- set shell=fish -- default
   vim.opt.shell = 'fish'


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


