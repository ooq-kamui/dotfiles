-- 
-- opt ( set )
-- 

-- ex
-- setlocal xxx
--   vim.opt.hlsearch = true
-- set xxx
--   vim.opt_local.xx = true
-- augroup vimrcEx
--   vim.api.nvim_create_augroup( 'vimrcEx', {} )
-- autocmd xxx
--   vim.api.nvim_create_autocmd( 'insertenter', {
--     group = 'vimrcEx',
--     callback = function() print( 'insert enter') end
--   })


-- set org

-- set modelines=0  " CVE-2007-2438
   vim.opt.modelines = 0

-- " Normally we use vim-extensions. If you want true vi-compatibility
-- " remove change the following statements
-- set nocompatible  " Use Vim defaults instead of 100% vi compatibility
   vim.opt.compatible = false
-- set backspace=2   " more powerful backspacing
   vim.opt.backspace = 2

-- " Don't write backup file if vim is being called by "crontab -e"
-- autocmd BufWrite /private/tmp/crontab.* set nowritebackup nobackup
-- vim.api.nvim_create_autocmd( 'insertenter', {
--   callback = function() print( 'insert enter') end
-- })

-- " Don't write backup file if vim is being called by "chpass"
-- autocmd BufWrite /private/etc/pw.* set nowritebackup nobackup
-- vim.api.nvim_create_autocmd( 'insertenter', {
--   callback = function() print( 'insert enter') end
-- })

-- set org end


-- 
-- augroup
-- 
   vim.api.nvim_create_augroup( 'vimrcEx', {} )

-- filetype
-- filetype on

-- syntax
-- syntax on
-- autocmd BufNewFile,BufRead *.fish       set filetype=fish
-- vim.api.nvim_create_autocmd( 'insertenter', {
--   callback = function() print( 'insert enter') end
-- })

-- defold
-- autocmd BufNewFile,BufRead *.script     set filetype=lua
-- autocmd BufNewFile,BufRead *.gui_script set filetype=lua

-- filetype indent on
-- space
-- autocmd FileType lua      setlocal sw=2 sts=2 ts=2   et
-- autocmd FileType text     setlocal sw=2 sts=2 ts=2   et
-- autocmd FileType json     setlocal sw=2 sts=2 ts=2   et
-- autocmd FileType vim      setlocal sw=2 sts=2 ts=2   et
-- autocmd FileType fish     setlocal sw=2 sts=2 ts=2   et
-- autocmd FileType sh       setlocal sw=2 sts=2 ts=2   et
-- autocmd FileType markdown setlocal sw=2 sts=2 ts=2   et
-- autocmd FileType python   setlocal sw=4 sts=4 ts=4   et
-- tab
-- " autocmd FileType lua      setlocal sw=2 sts=2 ts=2 noet


-- set listchars=tab:»_,eol:«,extends:»,precedes:«,nbsp:%
   vim.opt.listchars = 'tab:»_,eol:«,extends:»,precedes:«,nbsp:%'
-- set incsearch
   vim.opt.incsearch = true
-- set hlsearch
   vim.opt.hlsearch = true
-- set ignorecase smartcase
   vim.opt.ignorecase = 'smartcase'
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
   vim.opt.switchbuf = 'usetab,newtab'
-- set showcmd
   vim.opt.showcmd = true

-- set encoding=utf-8
   vim.opt.encoding = 'utf-8'
-- set fileencodings=utf-8,sjis
   vim.opt.fileencodings = 'utf-8,sjis'
-- "set termencoding=utf-8
-- vim.opt.termencoding = 'utf-8'

-- "set mouse=n
-- vim.opt.mouse = 'n'
-- "map <LeftMouse> <nop>
-- ???

-- set autoindent
   vim.opt.autoindent = true
-- set shiftwidth=2 " 4
   vim.opt.shiftwidth = 2
-- set tabstop=2    " 4
   vim.opt.tabstop = 2
-- set expandtab " tab > space
   vim.opt.expandtab = true


-- " file opn, cursor mv last
-- augroup vimrcEx
--   autocmd BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
--   \ exe "normal! g`\"" | endif
-- augroup END

-- autocmd BufWinEnter * normal! zz

-- set nowrap
   vim.opt.wrap = false
-- set whichwrap=b,s,h,l,<,>,[,]
   vim.opt.whichwrap = 'b,s,h,l,<,>,[,]'
-- set virtualedit=onemore " cursor mv cr
   vim.opt.virtualedit = 'onemore'
-- set virtualedit+=block  " box slct
-- vim.opt.virtualedit = vim.opt.virtualedit + ???
-- "set virtualedit=all
-- vim.opt.virtualedit = 'all'

-- set scrolloff=5
   vim.opt.scrolloff = 5
-- set sidescrolloff=4
   vim.opt.sidescrolloff = 4
-- set wildmode=list:longest
   vim.opt.wildmode = 'list:longest'
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
-- vim.opt.ambiwidth = true
-- set autoread
   vim.opt.autoread = true
-- "set clipboard+=unnamedplus " ???
-- vim.opt.clipboard = true

-- 
-- status line
-- 

-- func! Status_line(file_encoding) abort
-- 
--   set statusline=
     vim.opt.statusline = ''
--   "set statusline+=%m\                " 変更あり表示
     -- vim.opt.statusline = true
--   set statusline+=%F                 " file name
     vim.opt.statusline = true
--   set statusline+=%=                 " 以降を右寄せ
     vim.opt.statusline = true

--   if a:file_encoding
--     set statusline+=%{&fileencoding}\  " file encoding
       vim.opt.statusline = true
--     if &bomb
--       set statusline+=:bom             " bom
         vim.opt.statusline = true
--     endif
--   endif
-- 
--   set statusline+=%y\                " file type
     vim.opt.statusline = true
--   set statusline+=%c\                " column num
     vim.opt.statusline = true
--   set statusline+=%p%%\              " line num %
     vim.opt.statusline = true
--   set statusline+=%l/%L              " line num / line num all
     vim.opt.statusline = true
-- endfunc
-- call Status_line(v:false)

-- set laststatus=2                   " 0:off  1:on when 2 win  2:on
   vim.opt.laststatus = true
-- set completeopt=menuone,noinsert
   vim.opt.completeopt = true
-- set foldmethod=manual
   vim.opt.foldmethod = true
-- set shortmess+=I
   vim.opt.shortmess = true
-- "set nrformats+=unsigned " 2022-05-09
-- vim.opt.nrformats = true

-- " splt
-- hi! link StatusLineNC Comment
-- hi! link VertSplit    Comment

-- set noswapfile
   vim.opt.swapfile = false

-- " undo
-- if has('persistent_undo')
--   set undodir=~/.vim-undo
     vim.opt.undodir = true
--   set undofile                                                                                                                                   
     vim.opt.undofile = true
-- endif

-- 
-- shell & .vimrc_env
-- 

-- set shell=fish           -- default
   vim.opt.shell = true

-- let g:env_dir = ''

-- if     Is_env__('mac')       " mac
--   let g:env_dir = 'mac'

-- elseif Is_env__('linux')     " c9, s9
--   let g:env_dir = 'c9'

-- elseif Is_env__('win64')     " pwsh
--   let g:env_dir = 'pwsh'

-- elseif Is_env__('win32unix') " gitbash
--   let g:env_dir = 'gitbash'
-- endif

-- if g:env_dir != ''
--   source `=g:init_vim_dir . '/' . g:env_dir . '/init.vim'`
-- else
--   echo "is env else"
-- endif


-- comment auto off ( def pos final ? )
-- autocmd FileType * set fo-=c fo-=r fo-=o
-- vim.api.nvim_create_autocmd( 'insertenter', {
--   callback = function() print( 'insert enter') end
-- })


